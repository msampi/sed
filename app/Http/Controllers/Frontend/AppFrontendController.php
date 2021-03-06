<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\AppBaseController;
use App\Http\Requests;
use App\Repositories\CompetitionRepository;
use App\Repositories\EvaluationUserEvaluatorRepository;
use App\Repositories\EvaluationRepository;
use App\Repositories\TrackingRepository;
use App\Repositories\UserRepository;
use App\Repositories\AlertRepository;
use App\Repositories\LanguageRepository;
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
    protected $trackingRepository;
    protected $evaluationUserEvaluatorRepository;
    protected $eue;
    protected $tracking;

    public function __construct(UserRepository $userRepo,
                                EvaluationRepository $evaluationRepo,
                                EvaluationUserEvaluatorRepository $evaluationUserEvaluatorRepo )
    {

        $this->alertRepository = App::make(AlertRepository::class);
        $this->trackingRepository = App::make(TrackingRepository::class);
        $this->userRepository = $userRepo;
        $this->evaluationRepository = $evaluationRepo;
        $this->evaluationUserEvaluatorRepository = $evaluationUserEvaluatorRepo;

        if (!(Session::get('evaluation_id')))
                Session::set('evaluation_id',$this->evaluationUserEvaluatorRepository->getLastEvaluation(Auth::user()->id));
        $this->tracking = $this->trackingRepository->firstOrCreate(['user_id'=>Auth::user()->id, 'evaluation_id' => Session::get('evaluation_id'), 'client_id'=>Auth::user()->client_id ]);

        $alerts = $this->alertRepository->findWhere(['evaluation_id' => Session::get('evaluation_id')]);
        View::share('alerts', $alerts);
        $this->eue = $this->evaluationUserEvaluatorRepository->findWhere([['user_id','=',Auth::user()->id], ['evaluation_id','=',Session::get('evaluation_id')]])[0];
        
    }

    public function setCurrentUser($id = NULL)
    {
        $this->is_logged_user = true;
        $this->user = Auth::user();
        if ($id)
        {
            $this->user = $this->userRepository->findWithoutFail($id);
            $this->is_logged_user = false;
            $this->eue = $this->evaluationUserEvaluatorRepository->findWhere([['user_id','=',$this->user->id], ['evaluator_id','=',Auth::user()->id], ['evaluation_id','=',Session::get('evaluation_id')]])[0];

        }
        
       
    }
    
    public function changeStatus($status, $stage)
    {
        if ($status[$stage] == 0)
        {
            
            if ($stage == 0){
                if ($this->evaluationRepository->isStageOne())
                    $status[$stage] = 1;
            }
            if ($stage == 1){
                if ($this->evaluationRepository->isStageTwo())
                    $status[$stage] = 1;
            }
            if ($stage == 2){
                if ($this->evaluationRepository->isStageThree())
                    $status[$stage] = 1;
            }
        }
        return $status;
        
    }
    
    public function setStatus()
    {
        $status_objectives = $this->eue->status_objectives;
        $status_competitions = $this->eue->status_competitions;
        $status_valorations = $this->eue->status_valorations;
        $status_objectives = $this->changeStatus($status_objectives, 0);
        $status_objectives = $this->changeStatus($status_objectives, 1);
        $status_objectives = $this->changeStatus($status_objectives, 2);
        $status_competitions = $this->changeStatus($status_competitions, 1);
        $status_competitions = $this->changeStatus($status_competitions, 2);
        $status_valorations = $this->changeStatus($status_valorations, 1);
        $status_valorations = $this->changeStatus($status_valorations, 2);
        $this->eue->status_objectives = $status_objectives;
        $this->eue->status_competitions = $status_competitions;
        $this->eue->status_valorations = $status_valorations;
        $this->eue->save();
        
    }

    /**
     * Gets the alert.
     */
    public function getAlert( Request $request, AlertRepository $alert, LanguageRepository $lang ) {

        $user = Auth::user();

        return $alert->findByID( $request->get('id'), $user )->description[ $user->language_id ];

    }

}
