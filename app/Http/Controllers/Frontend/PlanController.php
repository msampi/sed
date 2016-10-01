<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Frontend\AppFrontendController;
use App\Http\Requests;
use App\Repositories\UserRepository;
use App\Repositories\EvaluationUserEvaluatorRepository;
use App\Repositories\EvaluationRepository;
use App\Repositories\PlanRepository;
use Illuminate\Http\Request;
use App\Models\PlanImprovement;
use App\Models\PlanComment;
use App\Models\PlanAction;
use Response;
use Session;

class PlanController extends AppFrontendController
{
    /** @var  CompetitionRepository */

    private $planRepository;

    public function __construct(UserRepository $userRepo,
                                EvaluationRepository $evaluationRepo,
                                EvaluationUserEvaluatorRepository $evaluationUserEvaluatorRepo,
                                PlanRepository $planRepo)
    {
        parent::__construct($userRepo, $evaluationRepo, $evaluationUserEvaluatorRepo);
        $this->planRepository = $planRepo;


    }


    /**
     * Display a listing of the Competition.
     *
     * @param Request $request
     * @return Response
     */
//echo 'actions['.$plan->id.'].push("'.$action->getAttributeTranslate($action->description).'");';
    public function printJSactions($plans)
    {
        echo "<script>
                var actions = [];";

            foreach ($plans as $plan) {
                echo 'actions['.$plan->id.'] = [];';
                foreach ($plan->actions as $action)
                     echo 'actions["'.$plan->id.'"].push("'.$action->getAttributeTranslate($action->description).'");';
            }

        echo "</script>";
    }

    public function index($id = NULL)
    {
        parent::setCurrentUser($id);

        /* El plan de accion va completado por el usuario en la evaluacion o por el evaluador hacia el usuario en la evaluacion  */

        $plans = $this->planRepository->findWhere(['evaluation_id' => Session::get('evaluation_id'), 'post_id' => $this->user->getEvaluationById(Session::get('evaluation_id'))->post_id]);
        $plan_actions = PlanAction::where('name', 'pattern');
        $plan_improvements = PlanImprovement::where('evaluation_id', Session::get('evaluation_id'))
                                             ->where('user_id', $this->user->id)->get();

        $plan_comments = new PlanComment();
        $current_stage = $this->evaluationRepository->getCurrentStage();

        $this->printJSactions($plans);


        return view('frontend.pdp')->with('user',$this->user)
                                   ->with('is_logged_user',$this->is_logged_user)
                                   ->with('section_name','PDP')
                                   ->with('plan_improvements',$plan_improvements)
                                   ->with('plan_comments',$plan_comments)
                                   ->with('plans',$plans)
                                   ->with('current_stage',$current_stage)
                                   ->with('evaluation_id',Session::get('evaluation_id'));
    }

    public function save(Request $request)
    {

        $input = json_decode($request->data);

        // /$this->valorationCommentRepository->saveComment($input->comments);
        //$this->behaviourRatingRepository->saveRating($input->ratings);

    }

}
