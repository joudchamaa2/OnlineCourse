<?php

namespace App\Http\Controllers;

use App\Models\Course;
use App\Models\HomeImage;
use App\Models\User;
use App\Models\Video;
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
function Courses(){
    try{
        $courses = Course::with('user')->get();
        return response()->json([
            'courses'=>$courses,
        ],201);
    }catch(\Exception $e){
        return response()->json([
            'message'=>$e->getMessage(),
            'line'=>$e->getLine(),
        ],500);
    }
}
function DeleteCourse(Course $course){
   try{ 
    $deleteId = $course->id;
    $course->delete();
    return response()->json([
        'course_id'=>$deleteId,
    ],201);
}catch(\Exception $e){
    return response()->json([
        'message'=>$e->getMessage(),
        'line'=>$e->getLine(),
    ],500);
}
}
function GetCourseById(Course $course){
    try{
        return response()->json([
            'course'=>$course,
        ],201);
    }catch(\Exception $e){
        return response()->json([
            'message'=>$e->getMessage(),
            'line'=>$e->getLine(),
        ],500);
    }
}
function updatecourse(Request $request , Course $course){
    try{
    $fields = $request->validate([
        'title'=>['string'],
        'description'=>['string'],
        'price'=>['numeric'],
        'image'=>['nullable','string','mime:jpg,png,jpeg,webp,svg'],
    ]);
    if(isset($request->image)){

        $imageName = time().'.'.$fields['image']->extension();
        $fields['image']->move(public_path('assets/images'), $imageName);
        $fields['image'] = $imageName;
        }else{
            $fields['image'] = $course->image;
        }
        $course->update($fields);
        return response()->json([
            'message'=>'Course updated successfully',
            'course'=>$course,
        ],201);
    }catch(\Exception $e){
        return response()->json([
            'message'=>$e->getMessage(),
            'line'=>$e->getLine(),
        ],500);
        
    }
}
function image(Request $request){

    $request->validate([
        'image' => 'required|image|mimes:jpg,png,jpeg,webp,svg,avif|max:2048'
    ]);

    try {

        if ($request->hasFile('image')) {

            $imageFile = $request->file('image');

            $imageName = time().'.'.$imageFile->extension();

            $imageFile->move(
                public_path('assets/images'),
                $imageName
            );

            $image = HomeImage::create([
                'image' => $imageName
            ]);

            return response()->json([
                'image' => $image,
            ], 201);
        }

    } catch (\Exception $e) {

        return response()->json([
            'message' => $e->getMessage(),
            'line' => $e->getLine(),
        ], 500);
    }
}
function images(){
    try{
        $images = HomeImage::all();
        return response()->json([
            'images'=>$images,
        ],201);
    }catch(\Exception $e){
        return response()->json([
            'message'=>$e->getMessage(),
            'line'=>$e->getLine(),
        ],500);
    }
}
function GetVideo(Video $video){
    try{
        $video = Video::with('course')->get();
        return response()->json([
            'video'=>$video,
        ],201);
    }catch(\Exception $e){
        return response()->json([
            'message'=>$e->getMessage(),
            'line'=>$e->getLine(),
        ],500);
    }
}
function DeleteVideo(video $video){
    try{
        $video->delete();
        return response()->json([
            'message '=>"Video deleted successfully",
        ],201);

    }catch(\Exception $e){
        return response()->json([
            'message'=>$e->getMessage(),
            'line'=>$e->getLine(),
        ],500);
    }
}
function EditVideo(Video $video){
    return response()->json([
        'video'=>$video,
    ],201);
}
}


