<?php

namespace App\Repositories;

use App\Models\Translation;
use InfyOm\Generator\Common\BaseRepository;

class TranslationRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        
    ];

    /**
     * Configure the Model
     **/
    public function model()
    {
        return Translation::class;
    }
}
