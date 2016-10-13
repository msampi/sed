<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\AppBaseController;
use App\Http\Requests;
use App\Repositories\UserRepository;
use App\Repositories\EvaluationRepository;
use App\Criteria\EvaluationUserEvaluatorCriteria;
use App\Repositories\EvaluationUserEvaluatorRepository;
use Illuminate\Http\Request;
use App\Models\Translation;
use App\Library\Dictionary;
use Session;
use Auth;


class UserController extends AppFrontendController
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */


    public function __construct(UserRepository $userRepo,
                                EvaluationRepository $evaluationRepo,
                                EvaluationUserEvaluatorRepository $evaluationUserEvaluatorRepo)
    {
        parent::__construct($userRepo, $evaluationRepo, $evaluationUserEvaluatorRepo);
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($id = NULL)
    {

        if ($id)
            Session::set('evaluation_id',$id);

        $this->trackingRepository->saveTrackingAction($this->tracking->id,'Ingreso a listado de usuarios');
        $this->evaluationUserEvaluatorRepository->pushCriteria(new EvaluationUserEvaluatorCriteria());
        $evaluationUserEvaluators = $this->evaluationUserEvaluatorRepository->all();

        return view('frontend.users')
            ->with('evaluationUserEvaluators', $evaluationUserEvaluators);

    }
}
