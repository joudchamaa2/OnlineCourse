<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Course extends Model
{
    use SoftDeletes;
    protected $fillable = [
        'user_id',
        'title',
        'description',
        'image',
        'category',
        'price',
    ];
    function user(){
        return $this->belongsTo(User::class);
    }
    public function videos(){
        return $this->hasMany(video::class);
    }
    public function quizes(){
        return $this->hasMany(Quiz::class);
    }
}
