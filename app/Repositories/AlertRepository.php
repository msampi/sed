<?php

namespace App\Repositories;

use App\Models\Alert;
use InfyOm\Generator\Common\BaseRepository;

class AlertRepository extends AdminBaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'evaluation_id'
    ];

    /**
     * Configure the Model
     **/
    public function model()
    {
        return Alert::class;
    }

}
