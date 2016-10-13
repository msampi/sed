<?php

namespace App\Repositories;

use App\Models\Performance;
use InfyOm\Generator\Common\BaseRepository;

class PerformanceRepository extends BaseRepository
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
        return Performance::class;
    }
}
