<?php

namespace App\Http\Controllers;

use App\Models\Course;
use App\Models\Quiz;
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
            'user_id'=>Auth::id(),
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
        $course->load(['user','videos']);
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
function GetVideo(Video $video){
    try{
    $video->load(['course','user']);
    $videoscourse = Video::where('course_id',$video->course_id)->get();
    return response()->json([
        'video'=>$video,
        'videoscourse'=>$videoscourse,
    ],201);
    }catch(\Exception $e){
        return response()->json([
            'message'=>$e->getMessage(),
            'line'=>$e->getLine(),
        ],500);
    }
}
function CreateQuiz(Course $course , Request $request){
    try{
        $fields = $request->validate([
            'question'=>['required','string'],
            'answer'=>['required','string'],
            'option1'=>['required','string'],
            'option2'=>['required','string'],
            'option3'=>['required','string'],
        ]);

        $quiz = Quiz::create([
            'course_id'=>$course->id,
            'user_id'=>Auth::id(),
            'question'=>$fields['question'],
            'answer'=>$fields['answer'],
            'option1'=>$fields['option1'],
            'option2'=>$fields['option2'],
            'option3'=>$fields['option3'],
        ]);
        return response()->json([
            'quiz'=>$quiz,
        ],201);
        
    }catch(\Exception $e){
        return response()->json([
            'message'=>$e->getMessage(),
            'line'=>$e->getLine(),
        ],500);
}
}
function GetQuiz(Course $course){
    try{
        $quizes = Quiz::where('course_id',$course->id)->get();
        return response()->json([
            'quizes'=>$quizes,
        ],201);
    }catch(\Exception $e){
        return response()->json([
            'message'=>$e->getMessage(),
            'line'=>$e->getLine(),
        ],500);
    }
}
}