<?php

namespace App\Models;

use Eloquent as Model;

/**
 * Class Rating
 * @package App\Models
 */
class Knowledges extends Model
{

    public $table = 'knowledges';
    


    public $fillable = [
        'name'
        
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'name' => 'string'
        
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'name' => 'required'
    ];

    
}
