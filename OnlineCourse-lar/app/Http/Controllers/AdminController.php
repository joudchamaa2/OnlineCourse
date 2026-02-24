<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AdminController extends Controller
{
    function Page(){
        $user = User::where('id','!=',Auth::id())->orderby('id','desc')->take(2)->get();
        $userCount = User::count();
        return response()->json([
            'user'=>$userCount,
            'tuser'=>$user,
            
        ]);
    }
    function Users(){
        try{
        $user = User::where('id','!=',Auth::id())->get();
        return response()->json([
            'user'=>$user,
        ],201);
    }
    catch(\Exception $e){
        return response()->json([
            'message'=>$e->getMessage(),
            'line'=>$e->getLine(),
        ]);
    }
}
function Delete(User $user){
    $deleteId = $user->id;
    $user->delete();
    return response()->json([
        'user_id'=>$deleteId,
    ],201);
}
function editRole(Request $request,User $user) {
    $fields = $request->validate([
        'role'=>['in:admin,indtructor,user'],
    ]);
    $user->role = $fields['role'];

    $user->save();

    return response()->json([
        'message' => 'Role updated successfully',
        'user' => $user,
    ], 200);
}

}