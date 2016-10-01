<?php

namespace App\Models;

use App\Models\ObjectiveReview;
use Eloquent as Model;
use App\Models\ObjectiveReviewDate;

/**
 * Class Objective
 * @package App\Models
 */
class Objective extends BaseModel
{

    public $table = 'objectives';
    


    public $fillable = [
        'name',
        'description',
        'post_id',
        'evaluation_id',
        'weight'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'name' => 'array',
        'description' => 'array',
        'post_id' => 'integer',
        'evaluation_id' => 'integer',
        'weight' => 'integer'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'name' => 'required'
    ];

    public function reviews() 
    {
        return $this->hasMany('App\Models\ObjectiveReview');
    }

    public function post() 
    {
        return $this->belongsTo('App\Models\Post');
    }


    public function getReviewsBy($stage, $entry, $user_id)
    {
        foreach ($this->reviews as $review) {
            if (($review->stage == $stage) && ($review->entry == $entry) && ($review->user_id == $user_id))
                return $review;
        }
        return new ObjectiveReview();

    }


   
    
}
