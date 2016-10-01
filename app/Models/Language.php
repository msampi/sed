<?php

namespace App\Models;

use Eloquent as Model;

/**
 * Class Language
 * @package App\Models
 */
class Language extends Model
{

    public $table = 'languages';
    


    public $fillable = [
        'name',
        'prefix'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'name' => 'string',
        'prefix' => 'string'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'name' => 'required',
        'prefix' => 'required'
    ];
}
