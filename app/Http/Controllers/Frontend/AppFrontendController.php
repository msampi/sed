<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\AppBaseController;
use App\Http\Requests;
use App\Repositories\CompetitionRepository;
use App\Repositories\EvaluationUserEvaluatorRepository;
use App\Repositories\EvaluationRepository;
use App\Repositories\UserRepository;
use App\Repositories\AlertRepository;
use Illuminate\Http\Request;
use Response;
use Auth;
use Session;
use App;
use View;

class AppFrontendController extends AppBaseController
{
    /** @var  CompetitionRepository */
    protected $is_logged_user;
    protected $user;
    protected $userRepository;
    protected $evaluationRepository;
    protected $alertRepository;
    protected $evaluationUserEvaluatorRepository;

    public function __construct(UserRepository $userRepo,
                                EvaluationRepository $evaluationRepo,
                                EvaluationUserEvaluatorRepository $evaluationUserEvaluatorRepo )
    {
        //$this->middleware('auth');
        $this->alertRepository = App::make(AlertRepository::class);
        $this->userRepository = $userRepo;
        $this->evaluationRepository = $evaluationRepo;
        $this->evaluationUserEvaluatorRepository = $evaluationUserEvaluatorRepo;
        if (!(Session::get('evaluation_id')))
                Session::set('evaluation_id',$this->evaluationUserEvaluatorRepository->getLastEvaluation(Auth::user()->id));

        $alerts = $this->alertRepository->findWhere(['evaluation_id' => Session::get('evaluation_id')]);
        View::share('alerts', $alerts);

    }

    public function setCurrentUser($id)
    {
        $this->is_logged_user = true;
        $this->user = Auth::user();
        if ($id)
        {
            $this->user = $this->userRepository->findWithoutFail($id);
            $this->is_logged_user = false;
        }
    }



}
