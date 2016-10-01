<?php

namespace App\Models;

use Eloquent as Model;

/**
 * Class Translation
 * @package App\Models
 */
class Translation extends BaseModel
{

    public $table = 'translations';
    

    public $fillable = [
        'words'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'words' => 'array'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        
    ];


    public function getWordByLanguage($language_id)
    {
        if (isset($this->words[$language_id]))
            return $this->words[$language_id];
        return NULL;
       
    }

    

    



}
