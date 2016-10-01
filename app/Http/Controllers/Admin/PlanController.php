<?php

namespace App\Http\Controllers\Admin;

use App\Http\Requests;
use App\Models\Post;
use App\Http\Requests\CreatePlanRequest;
use App\Http\Requests\UpdatePlanRequest;
use App\Repositories\PlanRepository;
use App\Http\Controllers\AppBaseController as InfyOmBaseController;
use Illuminate\Http\Request;
use Flash;
use Prettus\Repository\Criteria\RequestCriteria;
use Response;

class PlanController extends AdminBaseController
{
    /** @var  PlanRepository */
    private $planRepository;


    public function __construct(PlanRepository $planRepo)
    {
        $this->planRepository = $planRepo;
        parent::__construct();
    }

    /**
     * Display a listing of the Plan.
     *
     * @param Request $request
     * @return Response
     */
    public function index(Request $request)
    {
        $this->planRepository->pushCriteria(new RequestCriteria($request));
        $evaluation = $this->evaRepo->find($request->search);
        $plans = $this->planRepository->all();

        return view('admin.plans.index')
            ->with('plans', $plans)
            ->with('evaluation', $evaluation);
    }

    /**
     * Show the form for creating a new Plan.
     *
     * @return Response
     */
    public function create(Request $request)
    {
        $post = new Post();
        parent::loadLangScript();
        $languages = $this->languageRepository->all();
        return view('admin.plans.create')->with('evaluation_id', $request->search)
                                         ->with('posts', $post->listCurrentLang('id', 'name'))
                                         ->with('languages', $languages);
    }

    /**
     * Store a newly created Plan in storage.
     *
     * @param CreatePlanRequest $request
     *
     * @return Response
     */
    public function store(CreatePlanRequest $request)
    {
        $input = $request->all();

        $plan = $this->planRepository->create($input);

        Flash::success($this->dictionary->translate('PDP guardado correctamente'));

        return redirect(route('admin.plans.index','search='.$plan->evaluation_id));
    }



    /**
     * Show the form for editing the specified Plan.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $plan = $this->planRepository->findWithoutFail($id);
        parent::loadLangScript();
        $languages = $this->languageRepository->all();
        $post = new Post();
        if (empty($plan)) {
            Flash::error($this->dictionary->translate('PDP no encontrado'));

            return redirect(route('admin.plans.index', 'search='.$plan->evaluation_id));
        }

        return view('admin.plans.edit')->with('plan', $plan)
                                       ->with('evaluation_id', $plan->evaluation_id)
                                       ->with('posts', $post->listCurrentLang('id', 'name'))
                                       ->with('languages', $languages);
    }

    /**
     * Update the specified Plan in storage.
     *
     * @param  int              $id
     * @param UpdatePlanRequest $request
     *
     * @return Response
     */
    public function update($id, UpdatePlanRequest $request)
    {
        $plan = $this->planRepository->findWithoutFail($id);

        if (empty($plan)) {
            Flash::error($this->dictionary->translate('PDP no encontrado'));

            return redirect(route('admin.plans.index', 'search='.$plan->evaluation_id));
        }

        $plan = $this->planRepository->update($request->all(), $id);

        Flash::success($this->dictionary->translate('PDP actualizado correctamente'));

        return redirect(route('admin.plans.index', 'search='.$plan->evaluation_id));
    }

    /**
     * Remove the specified Plan from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $plan = $this->planRepository->findWithoutFail($id);

        if (empty($plan)) {
            Flash::error($this->dictionary->translate('PDP no encontrado'));

            return redirect(route('admin.plans.index', 'search='.$plan->evaluation_id));
        }

        $this->planRepository->delete($id);

        Flash::success($this->dictionary->translate('Plan eliminado correctamente'));

        return redirect(route('admin.plans.index', 'search='.$plan->evaluation_id));
    }
}
