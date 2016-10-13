<?php

namespace App\Repositories;

use App\Models\PlanComment;
use App\Models\Action;
use InfyOm\Generator\Common\BaseRepository;

class PlanCommentRepository extends BaseCommentRepository
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
        return PlanComment::class;
    }

    protected function setCommentReferenceId($comment, $value){
      return NULL;
    }

    public function createComments($model, $user)
    {
        $this->createComment(NULL, $user->id, 'half-year', 'user', 1);
        $this->createComment(NULL, $user->id, 'half-year', 'evaluator', 1);
        $this->createComment(NULL, $user->id, 'end-year', 'user', 1);
        $this->createComment(NULL, $user->id, 'end-year', 'evaluator', 1);
        $this->createComment(NULL, $user->id, 'half-year', 'user', 2);
        $this->createComment(NULL, $user->id, 'half-year', 'evaluator', 2);
        $this->createComment(NULL, $user->id, 'end-year', 'user', 2);
        $this->createComment(NULL, $user->id, 'end-year', 'evaluator', 2);

    }


}
