<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response as SymfonyResponse;

use App\Models\User;
use Spatie\Permission\Models\Role;

class StaffController extends Controller
{
    /**
     * Display a listing of the staff.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users = User::with('roles')->where('user_id', '=', auth()->user()->id)->get();

        return response()->json([
            'staffs' => $users
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created staff in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'gender' => 'required',
            'firstName' => 'required',
            'lastName' => 'required',
            'email'    => 'required|email|unique:users',            
            'phoneNumber'    => 'required',            
        ]);

        try {
            $user = User::create([
                'user_id' => auth()->user()->id,
                'gender' => $request->gender,
                'name'  => $request->firstName . ' ' . $request->lastName,
                'email' => $request->email,
                'phone' => $request->phoneNumber,
                'password' => bcrypt('12345678')
            ]);

            // Assign staff role 
            $roleExists = Role::where('name', '=', 'staff')->exists();

            if ($roleExists) {
                $user->assignRole('staff');
            }

            return response()->json([
                'message' => 'Staff addedd successfully'
            ]);
        } catch (\Exception $e) {
            print ($e->getMessage());
            return response()->json([
                'message' => 'Error adding staff'
            ], SymfonyResponse::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
