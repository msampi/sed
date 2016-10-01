<?php

namespace App\Repositories;

use App\Models\ValorationComment;
use App\Repositories\BaseCommentRepository;

class ValorationCommentRepository extends BaseCommentRepository
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
        return ValorationComment::class;
    }

    protected function setCommentReferenceId($comment, $value)
    {
         $comment->valoration_id = $value;
         return $comment;
    }

    public function reference()
    {
        return 'valoration_id';
    }


}
