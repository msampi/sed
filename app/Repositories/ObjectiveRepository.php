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
        'evaluation_id'
    ];

    /**
     * Configure the Model
     **/
    public function model()
    {
        return Objective::class;
    }

    public function getObjectives($user, $eue)
    {
        
        return $this->model->where(function ($query) use ($user,$eue) {
                            $query->where('user_id',$user->id)
                                  ->where('evaluation_id',Session::get('evaluation_id'))
                                  ->where('post_id',$eue->post_id);
                                 
                        })->orWhere(function ($query) use ($user,$eue) {
                            $query->where('user_id',NULL)
                                  ->where('evaluation_id',Session::get('evaluation_id'))
                                  ->where('post_id',$eue->post_id);
                        })->orWhere(function ($query) use ($user,$eue) {
                            $query->where('user_id',0)
                                  ->where('evaluation_id',Session::get('evaluation_id'))
                                  ->where('post_id',$eue->post_id);
                        })->get();
                  
        

    }

    public function saveObjective($input)
    {
        $flags = array();
        foreach ($input as $value) {

            if (isset($value->stage) && ($value->stage == 'objective'))
            {
                //echo $value->description.': '.$value->id;
                $objective = $this->model->firstOrNew(['id' => $value->id]);
                $objective->description = $this->saveArrayField($objective->description, Auth::user()->language_id, $value->description);
                $objective->weight = $value->selector;
                $objective->user_id = $value->uid;
                $objective->evaluator_id = $value->eid;
                $objective->evaluation_id = Session::get('evaluation_id');
                $objective->post_id = $value->pid;
                $objective->save();
                if (isset($value->flag)){
                  $flags[$value->flag] = $objective->id;
                }


            }
        }
        return $flags;
    }

    public function saveFromExcel($row, $evaluation_id, $post_id, $lang)
    {

        $objective = $this->model->firstOrCreate(['import_id' => $row->id_objetivo, 'evaluation_id' => $evaluation_id,'post_id' => $post_id]);
        $objective->import_id = $row->id_objetivo;
        $objective->description = $this->saveArrayField($objective->description, $lang, $row->descripcion);
        $objective->name = $this->saveArrayField($objective->name, $lang, $row->objetivo);
        $objective->weight = $row->peso.'%';
        $objective->evaluation_id = $evaluation_id;
        $objective->save();

    }
}
