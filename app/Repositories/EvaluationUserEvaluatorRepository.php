<?php

namespace App\Repositories;

use App\Models\EvaluationUserEvaluator;
use App\Repositories\ObjectiveReviewRepository;
use App\Repositories\BehaviourRatingRepository;
use App\Repositories\ValorationRatingRepository;
use InfyOm\Generator\Common\BaseRepository;
use App\Http\Requests\CreateUserRequest;
use App\Criteria\EqualCriteria;
use App\Library\EmailSend;
use App\Models\User;
use Auth;
use App;
use Session;

class EvaluationUserEvaluatorRepository extends AdminBaseRepository
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
        return EvaluationUserEvaluator::class;
    }

    public function getLastEvaluation($user_id)
    {
        $recent =  $this->model->where('user_id','=', $user_id )->orderBy('created_at','desc')->first();
        if(!$recent)
            abort(503);
        else
            return $recent->evaluation_id;
    }

    public function create(array $input)
    {
        if ($new_post_id = $this->saveNewPost($input))
            $input['post_id'] = $new_post_id;
        return parent::create($input);

    }

    public function update(array $input, $id)
    {
        if ($new_post_id = $this->saveNewPost($input))
            $input['post_id'] = $new_post_id;
        return parent::update($input, $id);

    }

    
    public function saveFromExcel($data)
    {
        $ev = $this->model->firstOrCreate(['user_id' => $data['user_id'],'evaluation_id' => $data['evaluation_id']]);
        if (isset($data['evaluator_id']))
          $ev->evaluator_id = $data['evaluator_id'];
        $ev->user_id = $data['user_id'];
        $ev->evaluation_id = $data['evaluation_id'];
        $ev->post_id = $data['post_id'];
        $ev->save();
    }

    public function startEvaluation($evaluation)
    {
        $this->pushCriteria(new EqualCriteria('evaluation_id',$evaluation->id));
        $this->pushCriteria(new EqualCriteria('started',0));
        $eue = $this->all();

        foreach ($eue as $ev) {
          if (!$ev->started):
              $user = User::where('id',$ev->user_id)->first();
              
              $request = new CreateUserRequest();
        
              $email = new EmailSend($evaluation->register_message_id, NULL, $user, $request);
              $email->send();
              $email = new EmailSend($evaluation->welcome_message_id, NULL, $user);
              $email->send();
              $ev->started = 1;
              $ev->status_objectives = [0,0,0];
              $ev->status_competitions = [0,0,0];
              $ev->status_valorations = [0,0,0];
              $ev->save();
         endif;

        }
    }
    
    
    
    public function getCompletedEvaluations()
    {
        $evaluations = $this->findWhere(['evaluator_id' => Auth::user()->id]);
        
        $completed = 0;
        foreach($evaluations as $evaluation)
            if ($evaluation->completed())
                $completed++;
        
        return $completed;
        
        
    }
    
    public function getTotalEvaluations()
    {
        return count($this->findWhere(['evaluator_id' => Auth::user()->id]));
        
        
    }
    
    public function getTotalAverage()
    {
        $objectiveReviewRepository = App::make(ObjectiveReviewRepository::class);
        $behaviourRatingRepository = App::make(BehaviourRatingRepository::class);
        $valorationRatingRepository = App::make(ValorationRatingRepository::class);
        
        $evaluations = $this->findWhere(['evaluator_id' => Auth::user()->id, 'evaluation_id' => Session::get('evaluation_id')]);
        $average = 0;
        foreach($evaluations as $evaluation)
        {
            $average = $objectiveReviewRepository->getAverage($evaluation->user_id,'user') + $behaviourRatingRepository->getAverage($evaluation->user_id,'user') + $valorationRatingRepository->getAverage($evaluation->user_id,'user') + $average;
           
        }
        
        return $average/$evaluations->count();
    }
    
    public function getTotalUsers()
    {
        return $this->findWhere(['evaluator_id' => Auth::user()->id, 'evaluation_id' => Session::get('evaluation_id')])->count();
    }
    
    public function getAgreeUsers()
    {
        $evaluations = $this->findWhere(['evaluator_id' => Auth::user()->id, 'evaluation_id' => Session::get('evaluation_id')]);
        $agree = 0;
        foreach($evaluations as $evaluation)
            if ($evaluation->user->performanceEvaluation())
                if ($evaluation->user->performanceEvaluation()->user_agree)
                    $agree++;
        return $agree;
    }



}
