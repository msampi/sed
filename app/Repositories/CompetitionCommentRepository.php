<?php

namespace App\Repositories;

use App\Models\CompetitionComment;
use App\Repositories\BaseCommentRepository;
use Session;

class CompetitionCommentRepository extends BaseCommentRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'comment'
    ];

    /**
     * Configure the Model
     **/
    public function model()
    {
        return CompetitionComment::class;
    }

    protected function setCommentReferenceId($comment, $value)
    {
         $comment->competition_id = $value;
         return $comment;
    }

    public function reference()
    {
        return 'competition_id';
    }

    

    

    
}
