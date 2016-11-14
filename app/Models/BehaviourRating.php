<?php

namespace App\Models;

use Eloquent as Model;

/**
 * Class BehaviourRating
 * @package App\Models
 */
class BehaviourRating extends Model
{

    public $table = 'behaviour_ratings';
    


    public $fillable = [
        'rating'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'rating' => 'string'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        
    ];
    
    public function behaviour()
    {
        return $this->belongsTo('App\Models\Behaviour');
    }
}
