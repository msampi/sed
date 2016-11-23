<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Requests;
use App\Repositories\UserRepository;
use App\Repositories\EvaluationUserEvaluatorRepository;
use App\Repositories\EvaluationRepository;
use App\Repositories\ObjectiveReviewRepository;
use App\Repositories\BehaviourRatingRepository;
use App\Repositories\ValorationRatingRepository;
use App\Http\Requests\CreatePerformanceRequest;
use App\Http\Requests\UpdatePerformanceRequest;
use App\Repositories\PerformanceRepository;
use App\Criteria\EqualCriteria;
use App\Http\Controllers\AppBaseController as InfyOmBaseController;
use Illuminate\Http\Request;
use Flash;
use Prettus\Repository\Criteria\RequestCriteria;
use Response;
use Session;
use Auth;

class PerformanceController extends AppFrontendController
{
    /** @var  PerformanceRepository */
    private $performanceRepository;
    private $behaviourRatingRepository;
    private $valorationRatingRepository;
    private $objectiveReviewRepository;

    public function __construct(UserRepository $userRepo,
                                EvaluationRepository $evaluationRepo,
                                PerformanceRepository $performanceRepo,
                                EvaluationUserEvaluatorRepository $evaluationUserEvaluatorRepo,
                                ObjectiveReviewRepository $objectiveReviewRepo,
                                ValorationRatingRepository $valorationRatingRepo,
                                BehaviourRatingRepository $behaviourRatingRepo)
    {
        parent::__construct($userRepo, $evaluationRepo, $evaluationUserEvaluatorRepo);
        $this->performanceRepository = $performanceRepo;
        $this->behaviourRatingRepository = $behaviourRatingRepo;
        $this->valorationRatingRepository = $valorationRatingRepo;
        $this->objectiveReviewRepository = $objectiveReviewRepo;
    }

    /**
     * Display a listing of the Performance.
     *
     * @param Request $request
     * @return Response
     */
    public function index($id = NULL)
    {
        parent::setCurrentUser($id);
        $this->performanceRepository->pushCriteria(new EqualCriteria('evaluation_id', Session::get('evaluation_id')));
        $this->performanceRepository->pushCriteria(new EqualCriteria('user_id', $this->user->id));
        $performance = $this->performanceRepository->first();

        $viewControlls = new \stdClass();
        $viewControlls->evaluationId = Session::get('evaluation_id');
        $viewControlls->userId = $this->user->id;
        $viewControlls->isEmpleado = $this->is_logged_user;

        $avgUser = $this->objectiveReviewRepository->getAverage($this->user->id,'user') + $this->behaviourRatingRepository->getAverage($this->user->id,'user') + $this->valorationRatingRepository->getAverage($this->user->id,'user');
        
        
        $avgEvaluator = $this->objectiveReviewRepository->getAverage($this->user->id,'evaluator') + $this->behaviourRatingRepository->getAverage($this->user->id,'evaluator') + $this->valorationRatingRepository->getAverage($this->user->id,'evaluator');
        

        if (!$this->is_logged_user) :
            $viewControlls->evaluatorId = Auth::user()->id;

        else:
            $viewControlls->evaluatorId = NULL;

        endif;


        if (!$performance)
            return view('frontend.performances.create')->with('viewControlls', $viewControlls)
                                                        ->with('eue', $this->eue)
                                                        ->with('avgUser', $avgUser)
                                                        ->with('avgEvaluator', $avgEvaluator);
        else
            if (($this->is_logged_user && $performance->finish_user) || (!$this->is_logged_user && $performance->finish_evaluator))
              return view('frontend.performances.edit')->with('performance', $performance)
                                                       ->with('viewControlls', $viewControlls)
                                                       ->with('eue', $this->eue)
                                                       ->with('avgUser', $avgUser)
                                                       ->with('avgEvaluator', $avgEvaluator);
            else
              return view('frontend.performances.show')->with('performance', $performance)
                                                      ->with('eue', $this->eue)
                                                      ->with('avgUser', $avgUser)
                                                      ->with('avgEvaluator', $avgEvaluator);


    }


    /**
     * Store a newly created Performance in storage.
     *
     * @param CreatePerformanceRequest $request
     *
     * @return Response
     */
    public function store(CreatePerformanceRequest $request)
    {
        $input = $request->all();

        $performance = $this->performanceRepository->create($input);

        return redirect(route('frontend.home'));
    }


    /**
     * Update the specified Performance in storage.
     *
     * @param  int              $id
     * @param UpdatePerformanceRequest $request
     *
     * @return Response
     */
    public function update($id, UpdatePerformanceRequest $request)
    {
        $performance = $this->performanceRepository->findWithoutFail($id);

        if (empty($performance)) {
            Flash::error('Performance not found');

            return redirect(route('frontend.performances.index'));
        }

        $performance = $this->performanceRepository->update($request->all(), $id);

        Flash::success('Performance updated successfully.');

        return redirect(route('frontend.performances.index'));
    }


}
