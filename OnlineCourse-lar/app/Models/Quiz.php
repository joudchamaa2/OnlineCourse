<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Quiz extends Model
{
    protected $fillable = [
        'course_id',
        'user_id',
        'question',
        'answer',
        'option1',
        'option2',
        'option3',
    ];

    public function course(){
        return $this->belongsTo(Course::class);
    }
    public function user(){
        return $this->belongsTo(User::class);
    }
}
