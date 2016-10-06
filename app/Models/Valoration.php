<?php

namespace App\Models;
use App\Models\ValorationComment;
use App\Models\ValorationRating;

use Eloquent as Model;
use Auth;

/**
 * Class Valoration
 * @package App\Models
 */
class Valoration extends BaseModel
{

    public $table = 'valorations';



    public $fillable = [
        'name',
        'description',
        'evaluation_id',
        'post_id',
        'weight'
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
        'weight' => 'integer'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'name' => 'required'
    ];

    public function evaluation()
    {
        return $this->belongsTo('App\Models\Evaluation');
    }

    public function comments()
    {
        return $this->hasMany('App\Models\ValorationComment');
    }

    public function getComment($stage, $entry, $user_id)
    {
        foreach ($this->comments as $comment) {

            if ($comment->entry == $entry && $comment->stage == $stage && $comment->user_id == $user_id)
                return $comment;
        }
        return new ValorationComment();


    }
    public function valorationRatings()
    {
        return $this->hasMany('App\Models\ValorationRating');
    }

    public function getValorationRating($stage, $entry, $user_id)
    {
        foreach ($this->valorationRatings as $bh) {
            if ($bh->stage == $stage && $bh->entry == $entry && $bh->user_id == $user_id)
                return $bh;
        }
        return new ValorationRating();
    }

    public function post()
    {
        return $this->belongsTo('App\Models\Post');
    }




}
