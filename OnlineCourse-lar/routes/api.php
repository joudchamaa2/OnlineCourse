<?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\AuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::middleware('api')->group(function(){
	Route::prefix('auth')->group(function(){
        Route::post('/register',[AuthController::class,'register']);
		Route::post('/login',[AuthController::class,'loginPage']);
		Route::middleware('auth:sanctum')->post('logout', [AuthController::class, 'logout']);
	});
	Route::middleware(['auth:sanctum','admin'])->group(function(){
        Route::get('/admin/dashboard',[AdminController::class,'Page']);
		Route::get('/admin/users',[AdminController::class,'Users']);
		Route::delete('/admin/DeleteUser/{user}',[AdminController::class,'Delete']);
		Route::put('/admin/editRole/{user}',[AdminController::class,'editRole']);
	});
});
