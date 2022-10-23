<?php

namespace App\Http\Middleware;
use Symfony\Component\HttpFoundation\Response as SymfonyResponse;

use Closure;
use Illuminate\Http\Request;
use Session;

class TwoFactor
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        if (!Session::has('user_2fa')) {
            return response()->json(['message' => 'Verify two factor', "code" => 01 ], SymfonyResponse::HTTP_FORBIDDEN);
        }   

        return $next($request);
    }
}
