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

    /**
     * Gets the prefix by id.
     *
     * @param      <type>  $id     The identifier
     *
     * @return     <type>  The prefix by id.
     */
    public function getPrefixByIdLang( $id ) {
        return Language::findOrFail( $id )->prefix;
    }
}
