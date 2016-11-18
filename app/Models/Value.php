<?php

namespace App\Models;

use Eloquent as Model;

/**
 * Class Value
 * @package App\Models
 */
class Value extends BaseModel
{

    public $table = 'values';
    


    public $fillable = [
        'value',
        'name',
        'rating_id'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'value' => 'integer',
        'name' => 'array',
        'rating_id' => 'integer'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'value' => 'required',
        'name' => 'required'
    ];
}
