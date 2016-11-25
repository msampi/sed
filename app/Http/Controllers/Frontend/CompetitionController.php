<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Frontend\AppFrontendController;
use App\Http\Requests;
use App\Repositories\UserRepository;
use App\Repositories\BehaviourRatingRepository;
use App\Repositories\CompetitionCommentRepository;
use App\Repositories\EvaluationUserEvaluatorRepository;
use App\Repositories\EvaluationRepository;
use App\Repositories\CompetitionRepository;
use Illuminate\Http\Request;
use Response;
use Session;

class CompetitionController extends AppFrontendController
{
    /** @var  CompetitionRepository */
    private $competitionRepository;
    private $competitionCommentRepository;
    private $behaviourRatingRepository;



    public function __construct(UserRepository $userRepo,
                                EvaluationRepository $evaluationRepo,
                                EvaluationUserEvaluatorRepository $evaluationUserEvaluatorRepo,
                                CompetitionRepository $competitionRepo,
                                CompetitionCommentRepository $competitionCommentRepo,
                                BehaviourRatingRepository $behaviourRatingRepo)
    {
        parent::__construct($userRepo, $evaluationRepo, $evaluationUserEvaluatorRepo);
        $this->competitionRepository = $competitionRepo;
        $this->competitionCommentRepository = $competitionCommentRepo;
        $this->behaviourRatingRepository = $behaviourRatingRepo;
    }


    /**
     * Display a listing of the Competition.
     *
     * @param Request $request
     * @return Response
     */

    public function index($id = NULL)
    {
        parent::setCurrentUser($id);
        $competitions = $this->competitionRepository->findWhere(['evaluation_id' => Session::get('evaluation_id'), 'post_id' => $this->eue->post_id]);
        $rating = $this->evaluationRepository->getCompetitionsRating();
        $is_stage_two = $this->evaluationRepository->isStageTwo();
        $is_stage_three = $this->evaluationRepository->isStageThree();
        $status = new \stdClass();
        $status->first_stage = $this->eue->getStageStatus(0,'competitions');
        $status->second_stage = $this->eue->getStageStatus(1, 'competitions');
        $status->third_stage = $this->eue->getStageStatus(2, 'competitions');
        
        if ($this->is_logged_user)
          $this->trackingRepository->saveTrackingAction($this->tracking->id,'Ingreso a competencias');
        else
          $this->trackingRepository->saveTrackingAction($this->tracking->id,'Ingreso a competencias del empleado');
        foreach ($competitions as $competition) {
           $this->competitionCommentRepository->createComments($competition, $this->user);
        }

        $visualization_st1 = $this->evaluationRepository->userVisibilityStageOne($this->is_logged_user);
        $visualization_st2 = $this->evaluationRepository->userVisibilityStageTwo($this->is_logged_user);

        return view('frontend.competitions')->with('user',$this->user)
                                            ->with('is_logged_user',$this->is_logged_user)
                                            ->with('section_name','Competencias')
                                            ->with('competitions',$competitions)
                                            ->with('rating',$rating)
                                            ->with('is_stage_two',$is_stage_two)
                                            ->with('is_stage_three',$is_stage_three)
                                            ->with('eue', $this->eue)
                                            ->with('visualization_st1',$visualization_st1)
                                            ->with('visualization_st2',$visualization_st2)
                                            ->with('status',$status);
    }

    public function save(Request $request)
    {

        $input = json_decode($request->data);
        if ($request->status){
            $this->eue->setStatus($request->status, $request->stage, 'competitions');
            $this->eue->save();
        }
        $this->competitionCommentRepository->saveComment($input->comments);
        $this->behaviourRatingRepository->saveRating($input->ratings);
        echo 1;

    }

}
