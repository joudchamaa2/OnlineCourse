<?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\CourseController;
use App\Http\Controllers\MainController;
use Illuminate\Support\Facades\Route;

Route::middleware('api')->group(function(){
	Route::prefix('auth')->group(function(){
	    Route::middleware('isLoggedin')->group(function(){
            Route::post('/register',[AuthController::class,'register']);
		    Route::post('/login',[AuthController::class,'loginPage']);
		});
        
		Route::middleware('auth:sanctum')->post('logout', [AuthController::class, 'logout']);
	});
	Route::middleware('auth:sanctum')->group(function(){
        Route::get('/home',[MainController::class,'home']);
		Route::get('/courses',[CourseController::class,'courses']);
		Route::get('/view/singlecourse/{course}',[CourseController::class,'SingleCourse']);
		Route::post('/subscribe/course',[MainController::class,'subscribe']);
		

	});
	Route::middleware(['auth:sanctum','admin'])->group(function(){
        Route::get('/admin/dashboard',[AdminController::class,'Page']);
		Route::get('/admin/users',[AdminController::class,'Users']);
		Route::delete('/admin/DeleteUser/{user}',[AdminController::class,'Delete']);
		Route::put('/admin/editRole/{user}',[AdminController::class,'editRole']);
		Route::get('/admin/course/count',[CourseController::class,'count']);
		Route::get('/admin/courses',[AdminController::class,'Courses']);
		Route::delete('/admin/course/delete/{course}',[AdminController::class,'DeleteCourse']);
		Route::get('/admin/course/GetCourseById/{course}',[AdminController::class,'GetCourseById']);
		Route::put('/admin/course/edit/{course}',[AdminController::class,'EditCourse']);
		Route::put('/admin/updateCourse/{course}',[AdminController::class,'updatecourse']);
		Route::post('/admin/image',[AdminController::class,'image']);
		Route::get('/admin/images',[AdminController::class,'images']);
		Route::post('/admin/course/video/{course}/create',[CourseController::class,'CreateVideo']);
		Route::get('/admin/GetVideo',[AdminController::class,'GetVideo']);
		Route::delete('/admin/video/{video}',[AdminController::class,'DeleteVideo']);
		Route::get('/admin/updatevideo/{video}',[AdminController::class,'EditVideo']);
	});
	Route::middleware(['auth:sanctum','AdminAndInst'])->group(function(){
		Route::post('/course/create',[CourseController::class,'Create']);
	});
	Route::middleware(['auth:sanctum','subscribe','expired'])->group(function(){
		Route::get('/course/video/watch/{video}',[CourseController::class,'GetVideo']);
		
	});
});
