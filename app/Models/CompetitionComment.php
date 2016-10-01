<?php

namespace App\Models;

use Eloquent as Model;

/**
 * Class CompetitionComment
 * @package App\Models
 */
class CompetitionComment extends Model
{

    public $table = 'competition_comments';
    


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
