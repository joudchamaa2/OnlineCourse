<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class video extends Model
{
    protected $fillable = [
        'course_id',
        'title',
        'description',
        'video',
    ];
    public function course(){
        return $this->belongsTo(Course::class);
    }
}
