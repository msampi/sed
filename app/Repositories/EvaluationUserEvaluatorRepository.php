<?php

namespace App\Repositories;

use App\Models\EvaluationUserEvaluator;
use InfyOm\Generator\Common\BaseRepository;
use App\Http\Requests\CreateUserRequest;
use App\Criteria\EqualCriteria;
use App\Library\EmailSend;
use App\Models\User;


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
              $ev->status = [1,0,0];
              $ev->save();
         endif;

        }
    }



}
