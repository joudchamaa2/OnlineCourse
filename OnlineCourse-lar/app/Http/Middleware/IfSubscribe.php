<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;
use Carbon\Carbon;



class IfSubscribe
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $user = Auth::user();
        if(!$user){
            return response()->json([
                'message' => 'Unauthorized'
            ], 401);
        }
        if($user->subscription == null){
            return response()->json([
                'message'=>"Must be subscribe to enter this page"
            ],403);
        }
        if($user->expired_at && Carbon::now()->greaterThan($user->expired_at)){
            return response()->json([
                'message' => 'Your subscription has expired'
            ], 403);
        }
        if($user->subscription &&($user->expired_at === null || Carbon::now()->lessThanOrEqualTo($user->expired_at))){
            return response()->json([
                'message'=>"you already have an active subscription ",
            ],403);
        }
        return $next($request);
    }
}
