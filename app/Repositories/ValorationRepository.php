<?php

namespace App\Repositories;

use App\Models\Valoration;
use InfyOm\Generator\Common\BaseRepository;

class ValorationRepository extends AdminBaseRepository
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
        return Valoration::class;
    }


    public function saveFromExcel($row, $evaluation_id, $post_id, $lang)
    {
        
        $valoration = $this->model->firstOrCreate(['import_id' => $row->id_valor, 'evaluation_id' => $evaluation_id, 'post_id' => $post_id]); 
        $valoration->import_id = $row->id_valor;
        $valoration->description = $this->saveArrayField($valoration->description, $lang, $row->descripcion);
        $valoration->weight = $row->peso;
        $valoration->name = $this->saveArrayField($valoration->name, $lang, $row->valor);
        $valoration->evaluation_id = $evaluation_id;
        $valoration->save();
              
    }

    
}
