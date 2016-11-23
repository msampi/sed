<?php

namespace App\Models;

use Eloquent as Model;

/**
 * Class Performance
 * @package App\Models
 */
class Performance extends Model
{

    public $table = 'performances';



    public $fillable = [
        'user_comment',
        'evaluator_comment',
        'user_agree',
        'user_final_score',
        'evaluator_final_score',
        'user_id',
        'evaluator_id',
        'evaluation_id'
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
