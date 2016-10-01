<?php

namespace App\Repositories;

use App\Models\Post;
use InfyOm\Generator\Common\BaseRepository;

class PostRepository extends AdminBaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = ['evaluation_id'];

    /**
     * Configure the Model
     **/
    public function model()
    {
        return Post::class;
    }

    public function saveFromExcel($row, $evaluation_id, $lang, $client_id)
    {
    
        $post = $this->model->firstOrCreate(['import_id' => $row->id_puesto, 'evaluation_id' => $evaluation_id, 'client_id' => $client_id]); 
        $post->import_id = $row->id_puesto;
        $post->name = $this->saveArrayField($post->name, $lang, $row->puesto);
        $post->evaluation_id = $evaluation_id;
        $post->client_id = $client_id;
        $post->save();
        return $post->id;
        
    }

}
