<?php

namespace App\Models;

use Eloquent as Model;

/**
 * Class ValorationComment
 * @package App\Models
 */
class ValorationComment extends Model
{

    public $table = 'valoration_comments';
    


    public $fillable = [
        'comment'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'comment' => 'string'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        
    ];
}
