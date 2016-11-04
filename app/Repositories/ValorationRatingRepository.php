<?php

namespace App\Repositories;

use App\Models\ValorationRating;
use InfyOm\Generator\Common\BaseRepository;

class ValorationRatingRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'rating'
    ];

    /**
     * Configure the Model
     **/
    public function model()
    {
        return ValorationRating::class;
    }

    public function saveRating($input)
    {
       
        foreach ($input as $value) {
            
            $rating = $this->model->firstOrNew(['user_id' => $value->uid, 'entry' => $value->entry, 'stage' => $value->stage, 'evaluator_id' => $value->eid, 'valoration_id' => $value->bid]);
            $rating->rating = $value->rating;
            $rating->user_id = $value->uid;
            $rating->entry = $value->entry;
            $rating->stage = $value->stage;
            $rating->valoration_id = $value->bid;
            $rating->evaluator_id = $value->eid;
            $rating->save();
            
            
        }
        
    }
}
