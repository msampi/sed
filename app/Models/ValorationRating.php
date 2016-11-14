<?php

namespace App\Models;

use Eloquent as Model;

/**
 * Class BehaviourRating
 * @package App\Models
 */
class ValorationRating extends Model
{

    public $table = 'valoration_ratings';
    


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
    
    public function valoration()
    {
        return $this->belongsTo('App\Models\Valoration');
    }
}
