<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Frontend\AppFrontendController;
use App\Repositories\ObjectiveRepository;
use App\Repositories\UserRepository;
use App\Repositories\EvaluationUserEvaluatorRepository;
use App\Repositories\EvaluationRepository;
use App\Repositories\ObjectiveReviewRepository;
use App\Models\Evaluation;
use Illuminate\Http\Request;
use Input;

class ObjectiveController extends AppFrontendController
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */

    private $objectiveRepository;
    private $objectiveReviewRepository;


    public function __construct(ObjectiveRepository $objectiveRepo,
                                EvaluationRepository $evaluationRepo,
                                EvaluationUserEvaluatorRepository $evaluationUserEvaluatorRepo,
                                ObjectiveReviewRepository $objectiveReviewRepo,
                                UserRepository $userRepo)
    {
        parent::__construct($userRepo, $evaluationRepo, $evaluationUserEvaluatorRepo);
        $this->objectiveRepository = $objectiveRepo;
        $this->objectiveReviewRepository = $objectiveReviewRepo;

    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($id = NULL)
    {

        parent::setCurrentUser($id);
        if ($this->is_logged_user)
          $this->trackingRepository->saveTrackingAction($this->tracking->id,'Ingreso a objetivos');
        else
          $this->trackingRepository->saveTrackingAction($this->tracking->id,'Ingreso a objetivos del empleado');
        $objectives = $this->objectiveRepository->getObjectives($this->user, $this->eue);
        $sum_weight = $objectives->sum('weight');
        $is_stage_one = $this->evaluationRepository->isStageOne();
        $is_stage_two = $this->evaluationRepository->isStageTwo();
        $is_stage_three = $this->evaluationRepository->isStageThree();
        $status = $this->eue->getStageStatus(0);
        
        $rating = $this->evaluationRepository->getObjectivesRating();
        $visualization_st1 = $this->evaluationRepository->userVisibilityStageOne($this->is_logged_user);
        $visualization_st2 = $this->evaluationRepository->userVisibilityStageTwo($this->is_logged_user);

        return view('frontend.objectives')->with('objectives',$objectives)
                                          ->with('user',$this->user)
                                          ->with('is_logged_user',$this->is_logged_user)
                                          ->with('is_stage_one',$is_stage_one)
                                          ->with('is_stage_two',$is_stage_two)
                                          ->with('is_stage_three',$is_stage_three)
                                          ->with('rating',$rating)
                                          ->with('sum_weight',$sum_weight)
                                          ->with('eue',$this->eue)
                                          ->with('section_name', 'Objetivos')
                                          ->with('visualization_st1',$visualization_st1)
                                          ->with('visualization_st2',$visualization_st2)
                                          ->with('status',$status);

    }

    public function save(Request $request)
    {

        $input = json_decode($request->data);
        $this->eue->setStatus(0,$request->status);
        $this->eue->save();
        $flags = $this->objectiveRepository->saveObjective($input);
        $this->objectiveReviewRepository->saveReview($input);
        echo json_encode($flags);

    }

    public function delete(Request $request)
    {

        $this->objectiveRepository->delete($request->get('id'));
        echo 1;

    }


}
