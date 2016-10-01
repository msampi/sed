<?php

namespace App\Models;

use Eloquent as Model;

/**
 * Class Plan
 * @package App\Models
 */
class PlanAction extends BaseModel
{

    public $table = 'actions';


    public $fillable = [
        'evaluation_id',
        'plan_id',
        'action_id',
        'user_id',
        'evaluator_id'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
      'evaluation_id' => 'integer',
      'plan_id' => 'integer',
      'action_id' => 'integer',
      'user_id' => 'integer',
      'evaluator_id' => 'integer'
    ];

}
