<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\AppBaseController;
use App\Http\Requests;
use App\Models\Post;
use App\Http\Requests\CreateObjectiveRequest;
use App\Http\Requests\UpdateObjectiveRequest;
use App\Repositories\ObjectiveRepository;
use Illuminate\Http\Request;
use Flash;
use Prettus\Repository\Criteria\RequestCriteria;
use Response;

class ObjectiveController extends AdminBaseController
{
    /** @var  ObjectiveRepository */
    private $objectiveRepository;

    public function __construct(ObjectiveRepository $objectiveRepo)
    {
        $this->objectiveRepository = $objectiveRepo;
        parent::__construct();
    }

    /**
     * Display a listing of the Objective.
     *
     * @param Request $request
     * @return Response
     */
    public function index(Request $request)
    {
        $this->objectiveRepository->pushCriteria(new RequestCriteria($request));
        $objectives = $this->objectiveRepository->all();
        $evaluation = $this->evaRepo->find($request->search);
        return view('admin.objectives.index')->with('objectives', $objectives)
                                             ->with('evaluation', $evaluation);
    }

    /**
     * Show the form for creating a new Objective.
     *
     * @return Response
     */
    public function create(Request $request)
    {
        $post = new Post();
        $languages = $this->languageRepository->all();
        return view('admin.objectives.create')->with('evaluation_id', $request->search)
                                              ->with('posts', $post->listCurrentLang('id', 'name'))
                                              ->with('languages', $languages);
    }

    /**
     * Store a newly created Objective in storage.
     *
     * @param CreateObjectiveRequest $request
     *
     * @return Response
     */
    public function store(CreateObjectiveRequest $request)
    {
        $input = $request->all();

        $objective = $this->objectiveRepository->create($input);

        Flash::success($this->dictionary->translate('Objetivo guardado correctamente'));

        return redirect()->route('admin.objectives.index', 'search='.$objective->evaluation_id);
    }

    /**
     * Show the form for editing the specified Objective.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $post = new Post();
        $languages = $this->languageRepository->all();
        $objective = $this->objectiveRepository->findWithoutFail($id);

        if (empty($objective)) {
            Flash::error($this->dictionary->translate('Objetivo no encontrado'));

            return redirect()->route('admin.objectives.index', 'search='.$objective->evaluation_id);
        }

        return view('admin.objectives.edit')->with('objective', $objective)
                                            ->with('posts', $post->listCurrentLang('id', 'name'))
                                            ->with('evaluation_id', $objective->evaluation_id)
                                            ->with('languages', $languages);
    }

    /**
     * Update the specified Objective in storage.
     *
     * @param  int              $id
     * @param UpdateObjectiveRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateObjectiveRequest $request)
    {
        $objective = $this->objectiveRepository->findWithoutFail($id);

        if (empty($objective)) {
            Flash::error($this->dictionary->translate('Objetivo no encontrado'));

            return redirect()->route('admin.objectives.index', 'search='.$objective->evaluation_id);
        }

        $objective = $this->objectiveRepository->update($request->all(), $id);

        Flash::success($this->dictionary->translate('Objetivo actualizado correctamente'));

        return redirect()->route('admin.objectives.index', 'search='.$objective->evaluation_id);
    }

    /**
     * Remove the specified Objective from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $objective = $this->objectiveRepository->findWithoutFail($id);

        if (empty($objective)) {
            Flash::error($this->dictionary->translate('Objetivo no encontrado'));

            return redirect()->route('admin.objectives.index');
        }

        $this->objectiveRepository->delete($id);

        Flash::success($this->dictionary->translate('Objetivo eliminado correctamente'));

        return redirect()->route('admin.objectives.index','search='.$objective->evaluation_id);
    }
}
