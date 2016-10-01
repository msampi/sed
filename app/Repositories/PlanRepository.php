<?php

namespace App\Repositories;

use App\Models\Plan;
use App\Models\Action;
use InfyOm\Generator\Common\BaseRepository;

class PlanRepository extends AdminBaseRepository
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
        return Plan::class;
    }

    public function saveFromExcel($row, $evaluation_id, $post_id, $lang)
    {
        
        $plan = $this->model->firstOrCreate(['import_id' => $row->id_plan, 'evaluation_id' => $evaluation_id,'post_id' => $post_id]); 
        $plan->import_id = $row->id_plan;
        $plan->name = $this->saveArrayField($plan->name, $lang, $row->plan);
        $plan->evaluation_id = $evaluation_id;
        $plan->post_id = $post_id;
        $plan->save();
        return $plan;
              
    }

    public function create(array $input)
    {
        $plan = parent::create($input);

        if (isset($input['values']))
            foreach ($input['values'] as $value) {
                $action = new Action();
                $action->plan_id = $plan->id;
                $action->description = $value;
                $action->save();
            }
        return $plan;

    }

    public function update(array $input, $id)
    {

        $plan = parent::update($input, $id);

        if (isset($input['values']))
            foreach ($input['values'] as $key => $value) {
                $action = Action::firstOrNew(['id' => $key]);
                $action->plan_id = $plan->id;
                $action->description = $value;
                $action->save();
            }

        $deleteInput = explode(',',$input['remove-item-list']);
        foreach ($deleteInput as $value) {
            if ($value)
                Action::where('id',$value)->delete();
        }

        return $plan;
    }
}
