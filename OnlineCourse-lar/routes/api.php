<?php

use App\Http\Controllers\AuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::middleware('api')->group(function(){
	Route::prefix('auth')->group(function(){
        Route::post('/register',[AuthController::class,'register']);
		Route::post('/login',[AuthController::class,'login']);
		Route::middleware('auth:sanctum')->post('logout', [AuthController::class, 'logout']);
	});
});
