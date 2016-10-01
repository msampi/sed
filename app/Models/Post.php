<?php

namespace App\Models;

use App\Models\BaseModel;
use Eloquent as Model;
use Auth;

/**
 * Class Post
 * @package App\Models
 */
class Post extends BaseModel
{

    public $table = 'posts';

    public $fillable = [
        'name',
        'client_id',
        'evaluation_id'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'name' => 'array',
        'client_id' => 'integer',
        'evaluation_id' => 'integer'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'name' => 'required'
    ];

    /**
     * { function_description }
     *
     * @return     <type>  ( description_of_the_return_value )
     */
    public function client() {
        return $this->belongsTo('App\Models\Client');
    }

    /**
     * { function_description }
     *
     * @return     <type>  ( description_of_the_return_value )
     */
    public function evaluation() {
        return $this->belongsTo('App\Models\Evaluation');
    }


    





}
