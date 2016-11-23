<?php

namespace App\Repositories;

use App\Models\ValorationRating;
use InfyOm\Generator\Common\BaseRepository;
use Session;
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
            $rating->evaluation_id = Session::get('evaluation_id');
            $rating->entry = $value->entry;
            $rating->stage = $value->stage;
            $rating->valoration_id = $value->bid;
            $rating->evaluator_id = $value->eid;
            $rating->save();
            
            
        }
        
    }
    
     public function getAverage($user_id, $entry)
    {
        $sum = 0;
        $valoration_ratings = $this->model->distinct('valoration_id')
                                  ->where('user_id',$user_id) 
                                  ->where('entry',$entry)
                                  ->where('evaluation_id',Session::get('evaluation_id'))->get();
        foreach($valoration_ratings as $vr){
            $count = $vr->valorationRatingSum($vr->valoration->id, $user_id, $entry);
            $sum = $sum + ($count * ($vr->valoration->weight /100));
            
        }
        
        return $sum;
    }
    
    
}
