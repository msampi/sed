<?php

namespace App\Repositories;

use App\Models\Objective;
use InfyOm\Generator\Common\BaseRepository;
use Auth;
use Session;

class ObjectiveRepository extends AdminBaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'evaluation_id',
        'post_id',
        'user_id'
    ];

    /**
     * Configure the Model
     **/
    public function model()
    {
        return Objective::class;
    }

    public function getObjectives($user)
    {

        return $this->model->where('evaluation_id',Session::get('evaluation_id'))
                        ->where('user_id',$user->id)->orWhere('user_id', NULL)->orWhere('user_id', 0)
                        ->get();

    }

    public function saveObjective($input)
    {
    
        foreach ($input as $value) {
            if ($value->stage == 'objective') 
            {

                $objective = $this->model->findOrNew($value->id);
                $objective->description = $value->description;
                $objective->weight = $value->selector;
                $objective->user_id = $value->uid;
                $objective->evaluator_id = $value->eid;
                $objective->evaluation_id = Session::get('evaluation_id');
                $objective->post_id = $value->pid;
                $objective->save();
            }
        }
    }

    public function saveFromExcel($row, $evaluation_id, $post_id, $lang)
    {
        
        $objective = $this->model->firstOrCreate(['import_id' => $row->id_objetivo, 'evaluation_id' => $evaluation_id,'post_id' => $post_id]); 
        $objective->import_id = $row->id_objetivo;
        $objective->description = $this->saveArrayField($objective->description, $lang, $row->descripcion);
        $objective->name = $this->saveArrayField($objective->name, $lang, $row->objetivo);
        $objective->weight = $row->peso;
        $objective->evaluation_id = $evaluation_id;
        $objective->save();
              
    }
}
