<?php

namespace App\Repositories;

use App\Models\BehaviourRating;
use InfyOm\Generator\Common\BaseRepository;

class BehaviourRatingRepository extends BaseRepository
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
        return BehaviourRating::class;
    }

    public function saveRating($input)
    {
       
        foreach ($input as $value) {
            
            $rating = $this->model->firstOrCreate(['user_id' => $value->uid, 'entry' => $value->entry, 'stage' => $value->stage, 'evaluator_id' => $value->eid, 'behaviour_id' => $value->bid]);
            $rating->rating = $value->rating;
            $rating->user_id = $value->uid;
            $rating->entry = $value->entry;
            $rating->stage = $value->stage;
            $rating->behaviour_id = $value->bid;
            $rating->evaluator_id = $value->eid;
            $rating->save();
            
            
        }
        
    }
}
