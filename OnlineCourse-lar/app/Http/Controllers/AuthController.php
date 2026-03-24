<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    function register(Request $request){
        try{
        $fields = $request->validate([
            'name'=>['required','string','max:10'],
            'email'=>['required','string','email','max:250'],
            'password'=>['required','between:5,30','string'],
        ]);
        
        $user = User::create($fields);
        $token = $user->createToken('auth_token')->plainTextToken;
        return response()->json([
            'user'=>$user,
            'token'=>$token,
        ],201);
        }catch(\Exception $e){
            return response()->json([
            'error' => $e->getMessage(),
            'line' => $e->getLine()
        ], 500);
        }
    }
    public function loginPage(Request $request)
{
    try {
        $fields = $request->validate([
            'email' => ['required', 'string', 'email', 'max:250'],
            'password' => ['required', 'string', 'between:5,30'],
        ]);

        if (!Auth::attempt($fields)) {
            return response()->json([
                'response_code' => 401,
                'status' => 'error',
                'message' => 'Unauthorized',
            ], 401);
        }
        /** @var \App\Models\User $user */
        $user = Auth::user();
        $token = $user->createToken('auth_token')->plainTextToken;
        

        return response()->json([
            'response_code' => 200,
            'status' => 'success',
            'message' => 'Login successful',
            'user_info' => [
                'id' => $user->id,
                'name' => $user->name,
                'email' => $user->email,
                'role'=>$user->role,
            ],
            'token' => $token,
            'token_type' => 'Bearer',
        ]);
    } catch (\Exception $e) {
        return response()->json([
            'response_code' => 500,
            'status' => 'error',
            'message' => $e->getMessage(),
            'line' => $e->getLine(),
        ], 500);
    }
}
public function logout(Request $request)
{
    return response()->json([
        'user' => $request->user()
    ]);
}


}
