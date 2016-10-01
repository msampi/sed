<?php

namespace App\Models;

use Eloquent as Model;

/**
 * Class Plan
 * @package App\Models
 */
class Action extends BaseModel
{

    public $table = 'actions';


    public $fillable = [
        'name',
        'description',
        'plan_id',
        'import_id'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'name' => 'array',
        'description' => 'array',
        'post_id' => 'integer',
        'import_id' => 'integer'
    ];

}
