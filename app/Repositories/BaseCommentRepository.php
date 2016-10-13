<?php

namespace App\Repositories;

use InfyOm\Generator\Common\BaseRepository;
use Session;

abstract class BaseCommentRepository extends BaseRepository
{


    abstract protected function setCommentReferenceId($comment, $value);


    public function saveComment($input, $nonreference = FALSE)
    {

        foreach ($input as $value) {

            $comment = $this->model->findOrNew($value->id);
            if (!$nonreference)
              $comment = $this->setCommentReferenceId($comment, $value->cid); //$comment->competition_id = $value->cid;
            $comment->comment = $value->comment;
            $comment->user_id = $value->uid;
            $comment->entry = $value->entry;
            $comment->evaluator_id = $value->eid;
            $comment->evaluation_id = Session::get('evaluation_id');
            if (isset($value->type))
              $comment->type = $value->type;
            $comment->save();


        }

    }

    public function createComment($model_id, $user_id, $stage, $entry, $type = NULL)
    {

        if ($model_id) :
            $comment = $this->model->firstOrNew([$this->reference() =>$model_id,
                                            'user_id' =>$user_id,
                                            'evaluation_id' => Session::get('evaluation_id'),
                                            'stage' => $stage,
                                            'entry' => $entry ]);
            $comment = $this->setCommentReferenceId($comment, $model_id);
        else :
          $comment = $this->model->firstOrNew(['user_id' =>$user_id,
                                          'evaluation_id' => Session::get('evaluation_id'),
                                          'stage' => $stage,
                                          'entry' => $entry,
                                          'type' => $type ]);


        endif;
        $comment->user_id = $user_id;
        $comment->evaluation_id = Session::get('evaluation_id');
        $comment->stage = $stage;
        $comment->entry = $entry;
        $comment->save();
    }

    public function createComments($model, $user)
    {
        $this->createComment($model->id, $user->id, 'half-year', 'user');
        $this->createComment($model->id, $user->id, 'half-year', 'evaluator');
        $this->createComment($model->id, $user->id, 'end-year', 'user');
        $this->createComment($model->id, $user->id, 'end-year', 'evaluator');

    }
}
