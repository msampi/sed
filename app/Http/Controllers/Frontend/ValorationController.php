<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Frontend\AppFrontendController;
use App\Http\Requests;
use App\Repositories\UserRepository;
use App\Repositories\ValorationCommentRepository;
use App\Repositories\EvaluationUserEvaluatorRepository;
use App\Repositories\EvaluationRepository;
use App\Repositories\ValorationRepository;
use App\Repositories\ValorationRatingRepository;
use Illuminate\Http\Request;
use Response;
use Session;

class ValorationController extends AppFrontendController
{
    /** @var  CompetitionRepository */
    private $valorationRepository;
    private $valorationRatingRepository;
    private $valorationCommentRepository;

    public function __construct(UserRepository $userRepo,
                                EvaluationRepository $evaluationRepo,
                                EvaluationUserEvaluatorRepository $evaluationUserEvaluatorRepo,
                                ValorationRepository $valorationRepo,
                                ValorationCommentRepository $valorationCommentRepo,
                                ValorationRatingRepository $valorationRatingRepo)
    {
        parent::__construct($userRepo, $evaluationRepo, $evaluationUserEvaluatorRepo);
        $this->valorationRepository = $valorationRepo;
        $this->valorationCommentRepository = $valorationCommentRepo;
        $this->valorationRatingRepository = $valorationRatingRepo;

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
        if ($this->is_logged_user)
          $this->trackingRepository->saveTrackingAction($this->tracking->id,'Ingreso a valores');
        else
          $this->trackingRepository->saveTrackingAction($this->tracking->id,'Ingreso a valores del empleado');
        $valorations = $this->valorationRepository->findWhere(['evaluation_id' => Session::get('evaluation_id'), 'post_id' => $this->user->getEvaluationById(Session::get('evaluation_id'))->post_id]);
        $rating = $this->evaluationRepository->getValorationsRating();
        $current_stage = $this->evaluationRepository->getCurrentStage();

        foreach ($valorations as $valoration) {
           $this->valorationCommentRepository->createComments($valoration, $this->user);
        }

        return view('frontend.valorations')->with('user',$this->user)
                                            ->with('is_logged_user',$this->is_logged_user)
                                            ->with('section_name','Valorations')
                                            ->with('valorations',$valorations)
                                            ->with('rating',$rating)
                                            ->with('current_stage',$current_stage);
    }

    public function save(Request $request)
    {

        $input = json_decode($request->data);

        $this->valorationCommentRepository->saveComment($input->comments);
        $this->valorationRatingRepository->saveRating($input->ratings);
        echo 1;

    }

}
