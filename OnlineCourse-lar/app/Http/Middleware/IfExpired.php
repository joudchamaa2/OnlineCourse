<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;
use Carbon\Carbon;

class IfExpired
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $user = Auth::user();
        if(!$user->subscription){
    return response()->json(['message'=>"Must subscribe to enter this page"],403);
}

if($user->expired_at && Carbon::now()->greaterThan($user->expired_at)){
    return response()->json(['message'=>"Your subscription has expired"],403);
}
        return $next($request);
    }
}
