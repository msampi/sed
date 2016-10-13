<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Requests;
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

class PerformanceController extends AppFrontendController
{
    /** @var  PerformanceRepository */
    private $performanceRepository;

    public function __construct(PerformanceRepository $performanceRepo)
    {
        $this->performanceRepository = $performanceRepo;
    }

    /**
     * Display a listing of the Performance.
     *
     * @param Request $request
     * @return Response
     */
    public function index(Request $request)
    {
        $this->performanceRepository->pushCriteria(new EqualCriteria('evaluation_id', Session::get('evaluation_id')));
        //$this->performanceRepository->pushCriteria(new EqualCriteria('user_id', $this->user->id));
        $performance = $this->performanceRepository->first();

        if (!$performance)
            return view('frontend.performances.create')->with('is_logged_user', $this->is_logged_user);
        else
            if (($this->is_logged_user && $performance->finish_user) || (!$this->is_logged_user && $performance->finish_evaluator))
              return view('frontend.performances.edit')->with('performance', $performance)
                                                       ->with('is_logged_user', $this->is_logged_user);
            else
              return view('frontend.performances.show')->with('performance', $performance);


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

        Flash::success('Performance saved successfully.');

        return redirect(route('frontend.performances.index'));
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
