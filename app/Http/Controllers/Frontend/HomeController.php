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


class HomeController extends AppFrontendController
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
        $this->setStatus();
        $evaluation = $this->evaluationRepository->find(Session::get('evaluation_id'));
        $this->trackingRepository->saveTrackingAction($this->tracking->id,'Ingreso al sistema');
        $this->evaluationUserEvaluatorRepository->pushCriteria(new EvaluationUserEvaluatorCriteria());
        $is_stage_three = $this->evaluationRepository->isStageThree();
        return view('frontend.home')->with('evaluation', $evaluation)
                                    ->with('eue', $this->eue)
                                    ->with('is_stage_three', $is_stage_three);

    }

    public function quit()
    {
      $this->trackingRepository->saveTrackingAction($this->tracking->id,'Salida del sistema');
      return redirect('logout');

    }
}
