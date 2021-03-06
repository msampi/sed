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
use App;


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
        $this->setCurrentUser();
        $this->trackingRepository->saveTrackingAction($this->tracking->id,'Ingreso a listado de usuarios');
        $this->evaluationUserEvaluatorRepository->pushCriteria(new EvaluationUserEvaluatorCriteria());
        $evaluationUserEvaluators = $this->evaluationUserEvaluatorRepository->all();
        $is_stage_three = $this->evaluationRepository->isStageThree();
        $total_evaluations = $this->evaluationUserEvaluatorRepository->getTotalEvaluations();
        $completed = $this->evaluationUserEvaluatorRepository->getCompletedEvaluations();
        $global_performance = $this->evaluationUserEvaluatorRepository->getTotalAverage();
        $total_users = $this->evaluationUserEvaluatorRepository->getTotalUsers();
        $agree_users = $this->evaluationUserEvaluatorRepository->getAgreeUsers();
        return view('frontend.users')
            ->with('evaluationUserEvaluators', $evaluationUserEvaluators)
            ->with('eue', $this->eue)
            ->with('is_stage_three', $is_stage_three)
            ->with('total_evaluations', $total_evaluations)
            ->with('completed', $completed)
            ->with('global_performance', $global_performance)
            ->with('total_users', $total_users)
            ->with('agree_users', $agree_users);
            

    }
}
