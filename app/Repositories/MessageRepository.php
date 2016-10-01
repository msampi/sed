<?php

namespace App\Repositories;

use App\Models\Message;
use InfyOm\Generator\Common\BaseRepository;
use Auth;

class MessageRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'title'
    ];

    /**
     * Configure the Model
     **/
    public function model()
    {
        return Message::class;
    }

    public function getRoleUserMessages($superadmin)
    {
      if ($superadmin)
        return $this->model->listCurrentLang('id', 'subject');
      else
        return $this->model->where('client_id', Auth::user()->client_id)->orWhere('client_id','')->listCurrentLang('id', 'subject');

    }
}
