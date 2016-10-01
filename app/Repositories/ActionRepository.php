<?php

namespace App\Repositories;

use App\Models\Action;
use InfyOm\Generator\Common\BaseRepository;

class ActionRepository extends AdminBaseRepository
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
        return Action::class;
    }

    public function saveFromExcel($row, $plan_id, $lang)
    {
        
        $attributes = $row->all();
        foreach ($attributes as $attr => $value) {
            if (strpos($attr, 'accion') !== false) {
                $data = explode('_', $attr);
                if (isset($data[1]) && is_numeric($data[1])){  
                    $action = $this->model->firstOrCreate(array('import_id' => $data[1], 'plan_id' => $plan_id));
                    if ($value != ''):
                        $action->import_id = $data[1];
                        $action->description = $this->saveArrayField($action->description, $lang, $value);
                        $action->save();
                    endif;
                }
            }


        }
    }
}
