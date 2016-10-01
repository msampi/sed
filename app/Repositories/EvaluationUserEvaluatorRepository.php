<?php

namespace App\Repositories;

use App\Models\EvaluationUserEvaluator;
use InfyOm\Generator\Common\BaseRepository;


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

    

}
