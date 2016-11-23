<?php

namespace App\Models;

use Eloquent as Model;
use Session;
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
    
    public function valorationRatingSum($valoration_id, $user_id, $entry)
    {
        $sum = 0;
        $vr = $this->where('valoration_id',$valoration_id)
                          ->where('user_id',$user_id)
                          ->where('entry',$entry)
                          ->where('evaluation_id',Session::get('evaluation_id'))->get();
         
         if ($vr->count())
             return $vr->sum('rating')/$vr->count();
         else
             return 0;
         
    }
}
