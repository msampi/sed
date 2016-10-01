<?php

namespace App\Models;

use Eloquent as Model;

/**
 * Class Plan
 * @package App\Models
 */
class PlanComment extends BaseModel
{

    public $table = 'plan_comments';
    

    public $fillable = [
        'comment',
        'type',
        'stage',
        'entry',
        'evaluation_id',
        'user_id'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'comment' => 'text',
        'type' => 'integer',
        'stage' => 'string',
        'entry' => 'string',
        'evaluation_id' => 'integer',
        'user_id' => 'integer'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [];

    public function getComment($evaluation_id, $user_id, $stage, $entry, $type )
    {
        return $this->where('evaluation_id', $evaluation_id)
                    ->where('user_id', $user_id)
                    ->where('entry', $entry)
                    ->where('type', $type)
                    ->where('stage', $stage)->first();
    }
    
}
