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
        $current_stage = $this->evaluationRepository->getCurrentStage();
        if ($this->is_logged_user)
          $this->trackingRepository->saveTrackingAction($this->tracking->id,'Ingreso a competencias');
        else
          $this->trackingRepository->saveTrackingAction($this->tracking->id,'Ingreso a competencias del empleado');
        foreach ($competitions as $competition) {
           $this->competitionCommentRepository->createComments($competition, $this->user);
        }


        return view('frontend.competitions')->with('user',$this->user)
                                            ->with('is_logged_user',$this->is_logged_user)
                                            ->with('section_name','Competencias')
                                            ->with('competitions',$competitions)
                                            ->with('rating',$rating)
                                            ->with('current_stage',$current_stage);
    }

    public function save(Request $request)
    {

        $input = json_decode($request->data);

        $this->competitionCommentRepository->saveComment($input->comments);
        $this->behaviourRatingRepository->saveRating($input->ratings);
        echo 1;

    }

}
