<?php

namespace App\Repositories;

use App\Models\PlanImprovement;
use InfyOm\Generator\Common\BaseRepository;

class PlanImprovementRepository extends BaseRepository
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
        return PlanImprovement::class;
    }


    public function saveImprovements($values)
    {
      $flags = array();
        foreach ($values as $value) {
          $improvement = $this->model->firstOrCreate(['id' => $value->id]);
          $improvement->objectives = $value->objective;
          $improvement->dev_action = $value->action;
          $improvement->meta = $value->meta;
          $improvement->resources = $value->resource;
          $improvement->save();
          $flags[$value->flag] = $improvement->id;

        }
        return $flags;
    }



}
