<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Frontend\AppFrontendController;
use App\Http\Requests;
use App\Repositories\UserRepository;
use App\Repositories\EvaluationUserEvaluatorRepository;
use App\Repositories\EvaluationRepository;
use App\Repositories\PlanRepository;
use App\Repositories\PlanImprovementRepository;
use App\Repositories\PlanCommentRepository;
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
    private $planImprovementRepository;
    private $planCommentRepository;

    public function __construct(UserRepository $userRepo,
                                EvaluationRepository $evaluationRepo,
                                EvaluationUserEvaluatorRepository $evaluationUserEvaluatorRepo,
                                PlanRepository $planRepo,
                                PlanCommentRepository $planCommentRepo,
                                PlanImprovementRepository $planImprovementRepo)
    {
        parent::__construct($userRepo, $evaluationRepo, $evaluationUserEvaluatorRepo);
        $this->planRepository = $planRepo;
        $this->planCommentRepository = $planCommentRepo;
        $this->planImprovementRepository = $planImprovementRepo;


    }


    /**
     * Display a listing of the Competition.
     *
     * @param Request $request
     * @return Response
     */

    public function printJSactions($plans)
    {

        echo "<script>
                var plans = [];";

            foreach ($plans as $plan) {
                echo 'plans['.$plan->id.'] = [];';
                foreach ($plan->actions as $action){
                  echo 'var action = new Object();';
                  echo 'action.id = '.$action->id.';';
                  echo 'action.desc = "'.$action->getAttributeTranslate($action->description).'";';
                  echo 'plans['.$plan->id.'].push(action);';
                }

            }

        echo "</script>";
    }

    public function index($id = NULL)
    {
        parent::setCurrentUser($id);


        $plans = $this->planRepository->findWhere(['evaluation_id' => Session::get('evaluation_id'), 'post_id' => $this->user->getEvaluationById(Session::get('evaluation_id'))->post_id]);
        //$plan_actions = PlanAction::where('name', 'pattern');
        $plan_improvements = PlanImprovement::where('evaluation_id', Session::get('evaluation_id'))
                                             ->where('user_id', $this->user->id)->get();

        $this->planCommentRepository->createComments(NULL, $this->user);

        $plan_comments = new PlanComment();
        $is_stage_two = $this->evaluationRepository->isStageTwo();
        $is_stage_three = $this->evaluationRepository->isStageThree();

        $this->printJSactions($plans);
        $visualization_st1 = $this->evaluationRepository->userVisibilityStageOne($this->is_logged_user);
        $visualization_st2 = $this->evaluationRepository->userVisibilityStageTwo($this->is_logged_user);


        return view('frontend.pdp')->with('user',$this->user)
                                   ->with('is_logged_user',$this->is_logged_user)
                                   ->with('section_name','PDP')
                                   ->with('plan_improvements',$plan_improvements)
                                   ->with('plan_comments',$plan_comments)
                                   ->with('plans',$plans)
                                   ->with('is_stage_two',$is_stage_two)
                                   ->with('is_stage_three',$is_stage_three)
                                   ->with('evaluation_id',Session::get('evaluation_id'))
                                   ->with('eue', $this->eue)
                                   ->with('visualization_st1',$visualization_st1)
                                   ->with('visualization_st2',$visualization_st2);
    }

    public function save(Request $request)
    {

        $input = json_decode($request->data);
        $this->planCommentRepository->saveComment($input->comments, TRUE);
        $flags = $this->planImprovementRepository->saveImprovements($input->improvements);
        echo json_encode($flags);

    }

    public function delete(Request $request)
    {

        $this->planImprovementRepository->delete($request->get('id'));
        echo 1;

    }

}
