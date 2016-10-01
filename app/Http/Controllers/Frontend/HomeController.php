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
        $evaluation = $this->evaluationRepository->find(Session::get('evaluation_id'));

        $this->evaluationUserEvaluatorRepository->pushCriteria(new EvaluationUserEvaluatorCriteria());
        //$evaluationUserEvaluators = $this->evaluationUserEvaluatorRepository->all();

        return view('frontend.home')->with('evaluation', $evaluation);

    }
}
