<?php

namespace App\Http\Controllers;

use App\Models\Course;
use App\Models\Video;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CourseController extends Controller
{
    function Create(Request $request){
    try{
        $fields = $request->validate([
            'title'=>['required','string'],
            'description'=>['required','string'],
            'image'=>['nullable','image','mimes:jpeg,png,jpg,gif,svg,webp','max:2048'],
            'category'=>['required','string'],
            'price'=>['required','integer'],
        ]);
    if(isset($fields['image'])){
        $imageName = time().'.'.$fields['image']->extension();
        $fields['image']->move(public_path('assets/images'),$imageName);
        $fields['image'] = $imageName;
}

$course = Course::create([
    'user_id'=>Auth::id(),
    'title'=>$fields['title'],
    'description'=>$fields['description'],
    'image'=>$fields['image'] ?? null,
    'category'=>$fields['category'],
    'price'=>$fields['price'],

]);
        return response()->json([
            'message'=>'Course created successfully',
            'course'=>$course,
        ],201);
}catch(\Exception $e){
    return response()->json([
        'message'=>$e->getMessage(),
        'line'=>$e->getLine(),
    ],500);
}

    }
    function count(){
        try{
        $courseCount = Course::count();
        return response()->json([
            'course'=>$courseCount,
        ],201);
    }catch(\Exception $e){
        return response()->json([
            'message'=>$e->getMessage(),
            'line'=>$e->getLine(),
        ],500);
    }
}
function courses(){
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
function CreateVideo(Request $request, Course $course){
    try{
        $fields = $request->validate([
            'title'=>['required','string'],
            'description'=>['required','string'],
            'video'=>['required','file','mimes:mp4,mkv,avi,flv,webm','max:512000'],
        ]);
        if(isset($fields['video'])){
        $videoName = time().'.'.$fields['video']->extension();
        $fields['video']->move(public_path('assets/videos'),$videoName);
        $fields['video'] = $videoName;
        $video = Video::create([
            'course_id'=>$course->id,
            'title'=>$fields['title'],
            'description'=>$fields['description'],
            'video'=>$fields['video'],
        ]);
        return response()->json([
            'video'=>$video,
        ],201);
}
        
    }catch(\Exception $e){
        return response()->json([
            'message'=>$e->getMessage(),
            'line'=>$e->getLine(),
        ],500);
    }
}
function SingleCourse(Course $course){
    try{
        $courses = Course::with('videos')->find($course);
        return response()->json([
            'course'=>$courses,
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
    $videos = Video::with('course')->find($video);
    return response()->json([
        'video'=>$videos,
    ],201);
    }catch(\Exception $e){
        return response()->json([
            'message'=>$e->getMessage(),
            'line'=>$e->getLine(),
        ],500);
    }
}
}