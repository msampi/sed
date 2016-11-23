<?php

namespace App\Models;

use Eloquent as Model;
use Session;
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
    
    public function behaviourRatingSum($behaviour_id, $user_id, $entry)
    {
        $sum = 0;
        $br = $this->where('behaviour_id',$behaviour_id)
                          ->where('user_id',$user_id)
                          ->where('entry',$entry)
                          ->where('evaluation_id',Session::get('evaluation_id'))->get();
         
         if ($br->count())
             return $br->sum('rating')/$br->count();
         else
             return 0;
         
    }
    
    
    
    
}
