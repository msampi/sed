<?php

namespace App\Repositories;

use App\Models\PlanImprovement;
use InfyOm\Generator\Common\BaseRepository;
use Session;

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
          $improvement->evaluation_id = Session::get('evaluation_id');
          $improvement->user_id = $value->uid;
          $improvement->save();
          if (isset($value->flag)){
            $flags[$value->flag] = $improvement->id;
          }

        }
        return $flags;
    }



}
