<?php

namespace App\Repositories;

use App\Models\ObjectiveReview;
use InfyOm\Generator\Common\BaseRepository;
use Session;

class ObjectiveReviewRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'description',
        'rating',
        'evaluation_id',
        'objective_id',
        'user_id',
        'stage'
    ];

    /**
     * Configure the Model
     **/
    public function model()
    {
        return ObjectiveReview::class;
    }

    public function saveReview($input)
    {
    
        foreach ($input as $value) {
            if (($value->stage != 'objective')) 
            {

                $objective = $this->model->findOrNew($value->id);
                $objective->description = $value->description;
                $objective->rating = $value->selector;
                $objective->user_id = $value->uid;
                $objective->objective_id = $value->oid;
                $objective->evaluation_id = Session::get('evaluation_id');
                $objective->stage = $value->stage;
                $objective->entry = $value->entry;
                $objective->save();
               

            }
        }
    }
}
