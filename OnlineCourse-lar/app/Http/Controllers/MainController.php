<?php

namespace App\Http\Controllers;

use App\Models\Course;
use App\Models\HomeImage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

use function Symfony\Component\Clock\now;

class MainController extends Controller
{
    function home(){
        try{
            $image = HomeImage::latest()->first();
            $course = Course::with('user')->orderby('id','desc')->take(3)->get();
            return response()->json([
                'image'=>$image,
                'course'=>$course,
            ],200);
        }catch(\Exception $e){
            return response()->json(['error'=>$e->getMessage()],500);
        }
    }
    function subscribe(Request $request){
        try{
        $user = Auth::user();
        
        if($user->subscription &&($user->expired_at === null || Carbon::now()->lessThanOrEqualTo($user->expired_at))){
            return response()->json([
                'message'=>"you already have an active subscription ",
            ],403);
        }
        if (!$user instanceof \App\Models\User) {
            $user = \App\Models\User::find($user->id);
        }

        $user->subscription = now();
        $user->subscription_type = $request->subscription_type;

        if($user->subscription_type === 'monthly'){
            $user->expired_at = Carbon::now()->addMonth();
        }else{
            $user->expired_at = Carbon::now()->addYear();
        }
        $user->save();
        return response()->json([
            'message'=>"Subscription saved",
        ],201);
        }catch(\Exception $e){
            return response()->json([
                'message'=>$e->getMessage(),
                'line'=>$e->getLine(),
            ],500);
        }

        

    }
}
