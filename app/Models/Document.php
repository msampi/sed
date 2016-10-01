<?php

namespace App\Models;

use Eloquent as Model;

/**
 * Class Document
 * @package App\Models
 */
class Document extends Model
{

    public $table = 'documents';
    


    public $fillable = [
        'name',
        'evaluation_id'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'name' => 'string',
        'evaluation_id' => 'integer'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        
    ];
}
