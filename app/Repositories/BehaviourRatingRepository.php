<?php

namespace App\Repositories;

use App\Models\BehaviourRating;
use InfyOm\Generator\Common\BaseRepository;
use Session;

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
            
            $rating = $this->model->firstOrNew(['user_id' => $value->uid, 'entry' => $value->entry, 'stage' => $value->stage, 'evaluator_id' => $value->eid, 'behaviour_id' => $value->bid]);
            $rating->rating = $value->rating;
            $rating->user_id = $value->uid;
            $rating->entry = $value->entry;
            $rating->evaluation_id = Session::get('evaluation_id');
            $rating->stage = $value->stage;
            $rating->behaviour_id = $value->bid;
            $rating->evaluator_id = $value->eid;
            $rating->save();
            
            
        }
        
    }
    
    public function getAverage($user_id, $entry)
    {
        $sum = 0;
        $behaviour_ratings = $this->model->distinct('behaviour_id')
                                  ->where('user_id',$user_id) 
                                  ->where('entry',$entry)
                                  ->where('evaluation_id',Session::get('evaluation_id'))->get();
        foreach($behaviour_ratings as $br){
            $count = $br->behaviourRatingSum($br->behaviour->id, $user_id, $entry);
            $sum = $sum + ($count * ($br->behaviour->competition->weight /100));
            
        }
        
        return $sum;
                
    }
}
