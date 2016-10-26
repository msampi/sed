<?php

namespace App\Repositories;

use App\Models\Language;
use InfyOm\Generator\Common\BaseRepository;

class LanguageRepository extends AdminBaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'name',
        'prefix'
    ];

    /**
     * Configure the Model
     **/
    public function model()
    {
        return Language::class;
    }

  
}
