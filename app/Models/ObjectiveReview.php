<?php

namespace App\Models;

use Eloquent as Model;

/**
 * Class ObjectiveReview
 * @package App\Models
 */
class ObjectiveReview extends Model
{

    public $table = 'objective_reviews';
    


    public $fillable = [
        'description',
        'rating',
        'evaluation_id',
        'objective_id',
        'user_id',
        'stage'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'description' => 'string',
        'rating' => 'string',
        'evaluation_id' => 'integer',
        'objective_id' => 'integer',
        'user_id' => 'integer',
        'stage' => 'string'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
       
    ];
    
    public function objective()
    {
        return $this->belongsTo('App\Models\Objective');
    }
}
