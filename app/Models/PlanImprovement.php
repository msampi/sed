<?php

namespace App\Models;

use Eloquent as Model;

/**
 * Class Plan
 * @package App\Models
 */
class PlanImprovement extends BaseModel
{

    public $table = 'plan_improvement';
    

    public $fillable = [
        'objectives',
        'meta',
        'dev_action',
        'resources',
        'evaluation_id',
        'user_id'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'objectives' => 'text',
        'meta' => 'text',
        'dev_action' => 'text',
        'resources' => 'text',
        'evaluation_id' => 'integer',
        'user_id' => 'integer'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [];

    
}
