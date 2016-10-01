<?php

namespace App\Models;

use Eloquent as Model;

/**
 * Class Plan
 * @package App\Models
 */
class Plan extends BaseModel
{

    public $table = 'plans';
    

    public $fillable = [
        'name',
        'post_id',
        'evaluation_id',
        'import_id'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'name' => 'array',
        'post_id' => 'integer',
        'evaluation_id' => 'integer',
        'import_id' => 'integer'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'name' => 'required'
    ];

    public function actions(){
        return $this->hasMany('App\Models\Action');
    }

    public function post(){
        return $this->belongsTo('App\Models\Post');
    }
}
