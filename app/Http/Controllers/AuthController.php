<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response as SymfonyResponse;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Validator;
use Illuminate\Support\Facades\Session;

use Illuminate\Auth\Events\Registered;
use Illuminate\Foundation\Auth\EmailVerificationRequest;

use Illuminate\Auth\Events\PasswordReset;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Str;
use Spatie\Permission\Models\Role;

use Log;

class AuthController extends Controller
{
    const LOG_TAG = "AuthController";

    /**
    * Login user and create token
    *
    * @param  [string] email
    * @param  [string] password
    * @param  [boolean] remember_me
    */

    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|string|email',
            'password' => 'required|string',
            'remember_me' => 'boolean'
        ]);

        $credentials = request(['email','password']);

        if(!Auth::attempt($credentials))
        {   
            return response()->json([
                'message' => 'Unauthorized'
            ], SymfonyResponse::HTTP_BAD_REQUEST);
        }

        $user = $request->user();

        if (is_null($user->email_verified_at)) {
            return response()->json([
                'message' => __("auth.verification")
            ], SymfonyResponse::HTTP_BAD_REQUEST);
        }

        $tokenResult = $user->createToken('Personal Access Token');
        $token = $tokenResult->plainTextToken;

        // Generate 2fa
        $user->generateCode($user->id);

        return response()->json([
            'accessToken' => $token,
            'token_type' => 'Bearer',
        ]);
    }

    /**
    * Create user
    *
    * @param  [string] name
    * @param  [string] email
    * @param  [string] password
    * @param  [string] password_confirmation
    * @return [string] message
    */
    public function register(Request $request)
    {
        $request->validate([
            'name' => 'required|string',
            'email'=>'required|string|unique:users',
            'password'=>'required|string',
            'c_password' => 'required|same:password'
        ]);

        $user = new User([
            'name'  => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password),
        ]);

        if($user->save()) {
            // Send verification email
            event(new Registered($user));

            $tokenResult = $user->createToken('Personal Access Token');
            $token = $tokenResult->plainTextToken;

            // Assign client role as default
            $roleExists = Role::where('name', '=', 'client')->exists();

            if ($roleExists) {
                $user->assignRole('client');
            }

            return response()->json([
                'message' => 'Successfully created user!',
                'accessToken'=> $token,
            ], 201);
        }
        else{
            return response()->json(['message'=>'Provide proper details']);
        }
    }

    /**
     * Verify email
     */
    public function verifyEmail(Request $request)
    {
        try {
            $userID = $request->id;
            $user = User::findOrFail($userID); // $request->user()            

            if ( !is_null($user->email_verified_at)) {
                return response()->json(
                  [
                    "message" => "Given email is already verified.",
                  ],
                  400
                );
            }
        
            $user->email_verified_at = date("Y-m-d g:i:s");
            $user->save();
            // $request->fulfill();

            return response()->json(['message' => 'Email verified']);
        } catch(\Exception $e) {
            return response()->json(['message' => 'Either the provided activation token is invalid or this account has already been activated.'], SymfonyResponse::HTTP_BAD_REQUEST);
        }
    }

    /**
     * Get the authenticated User
    *
    * @return [json] user object
    */
    public function user(Request $request)
    {
        $user = User::select('id', 'name', 'email')->find($request->user()->id); // $request->user();

        // Currently ui expects this
        $user->fullName = $user->name;

        // Add permissionse
        $user->ability = $user->getAllPermissions();

        // Add role. User is being assigned only one role
        if(count($user->getRoleNames()) > 0) {
            $user->role = $user->getRoleNames()[0];
        }

        return response()->json($user);
    }

    /**
     * Verify two factor
     */
    public function verifyTwoFactor(Request $request)
    {
        $request->validate([
            'code'=>'required',
        ]);

        $find = User::where('id', auth()->user()->id)
                ->where('two_factor_code', $request->code)
                ->where('updated_at', '>=', now()->subMinutes(2))
                ->first();

        if (!is_null($find)) {
            Session::put('user_2fa', auth()->user()->id);
            return response()->json(['message' => '2fa verified']);
        }

        return response()->json(['message' => 'You entered wrong code', 'user' => now()], SymfonyResponse::HTTP_BAD_REQUEST);
    }

    /**
     * Resend 2factor
     */
    public function resendTwoFactor() 
    {
        $user = Auth::user();

        $user->generateCode($user->id);

        return response()->json(['message' => '2fa resent']);
    }
    
    /**
     * Logout user (Revoke the token)
    *
    * @return [string] message
    */
    public function logout(Request $request)
    {
        $request->user()->tokens()->delete();

        return response()->json([
            'message' => 'Successfully logged out'
        ]);
    }

    /**
     * Send forgot password link on email
     */
    public function forgotPassword(Request $request)
    {
        $request->validate(['email' => 'required|email']);
 
        $status = Password::sendResetLink(
            $request->only('email'),
            function($user, $token) {
                Log::info(self::LOG_TAG . " --> " . $token);
                
                $user->sendPasswordResetNotification($token);
            }
        );
    
        return  $status === Password::RESET_LINK_SENT
                    ? response()->json(['message' => __($status)])
                    : response()->json(['message' => __($status)], SymfonyResponse::HTTP_NOT_FOUND);
    }

    /**
     * Update password
     */
    public function resetPassword(Request $request)
    {
        $request->validate([
            'token' => 'required',
            'email' => 'required|email',
            'password' => 'required|min:8|confirmed',
        ]);
     
        try {
            $status = Password::reset(
                $request->only('email', 'password', 'password_confirmation', 'token'),
                function ($user, $password) {
                    $user->forceFill([
                        'password' => Hash::make($password)
                    ])->setRememberToken(Str::random(60));
        
                    $user->save();
        
                    event(new PasswordReset($user));
                }
            );

            Log::info(self::LOG_TAG . " --> " . json_encode($status));

            return $status === Password::PASSWORD_RESET
                        ? response()->json(['message' => __($status)])
                        : response()->json(['message' => __($status)], SymfonyResponse::HTTP_BAD_REQUEST);
        } catch(\Exception $e) {
            Log::info(self::OG_TAG . " --> " . $e->getMessage());

            return response()->json(['message' => 'Error resetting password'], $e->getCode());
        }
    }
}