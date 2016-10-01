<?php

namespace App\Repositories;

use App\Models\Language;
use InfyOm\Generator\Common\BaseRepository;

class LanguageRepository extends BaseRepository
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

    /**
     * Gets the languaje count.
     *
     * @return     <type>  The languaje count.
     */
    public function getLanguageCount() {
        return $this->all()->count();
    }       
}
