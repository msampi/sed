<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\AppBaseController;
use App\Models\Post;
use App\Http\Requests;
use App\Http\Requests\CreateValorationRequest;
use App\Http\Requests\UpdateValorationRequest;
use App\Repositories\ValorationRepository;
use App\Repositories\ValueRepository;
use Illuminate\Http\Request;
use App\Repositories\EvaluationRepository;
use Flash;
use Prettus\Repository\Criteria\RequestCriteria;
use Response;
use Illuminate\Support\Facades\Input;

class ValorationController extends AdminBaseController
{
    /** @var  ValorationRepository */
    private $valorationRepository;
    private $valueRepository;


    public function __construct(ValorationRepository $valorationRepo, ValueRepository $valueRepo)
    {
        $this->valorationRepository = $valorationRepo;
        $this->valueRepository = $valueRepo;
        parent::__construct();

    }

    /**
     * Display a listing of the Valoration.
     *
     * @param Request $request
     * @return Response
     */
    public function index(Request $request)
    {
        $this->valorationRepository->pushCriteria(new RequestCriteria($request));
        $valorations = $this->valorationRepository->all();
        $evaluation = $this->evaRepo->find($request->search);

        return view('admin.valorations.index')->with('valorations', $valorations)
                                              ->with('evaluation', $evaluation);
    }

    /**
     * Show the form for creating a new Valoration.
     *
     * @return Response
     */
    public function create(Request $request)
    {
        /* Recordar que si es admin solo muestro los puestos de su cliente */
        $languages = $this->languageRepository->all();
        $post = new Post();

        return view('admin.valorations.create')->with('posts', $post->listCurrentLang('id', 'name'))
                                               ->with('evaluation_id', $request->search)
                                               ->with('languages', $languages);
    }

    /**
     * Store a newly created Valoration in storage.
     *
     * @param CreateValorationRequest $request
     *
     * @return Response
     */
    public function store(CreateValorationRequest $request)
    {
        $input = $request->all();
        $valoration = $this->valorationRepository->create($input);

        Flash::success($this->dictionary->translate('Valoración guardada correctamente'));

        return redirect()->route('admin.valorations.index', 'search='.$valoration->evaluation_id);
    }

    /**
     * Show the form for editing the specified Valoration.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $valoration = $this->valorationRepository->findWithoutFail($id);
        $languages = $this->languageRepository->all();
        $post = new Post();
        if (empty($valoration)) {
            Flash::error($this->dictionary->translate('Valoración no encontrada'));

            return redirect()->route('admin.valorations.index');
        }

        return view('admin.valorations.edit')->with('valoration', $valoration)
                                             ->with('posts', $post->listCurrentLang('id', 'name'))
                                             ->with('evaluation_id', $valoration->evaluation_id)
                                             ->with('languages', $languages);
    }

    /**
     * Update the specified Valoration in storage.
     *
     * @param  int              $id
     * @param UpdateValorationRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateValorationRequest $request)
    {
        $valoration = $this->valorationRepository->findWithoutFail($id);

        if (empty($valoration)) {
            Flash::error($this->dictionary->translate('Valoración no encontrada'));

            return redirect()->route('admin.valorations.index');
        }

        $valoration = $this->valorationRepository->update($request->all(), $id);

        Flash::success($this->dictionary->translate('Valoración actualizada correctamente'));

        return redirect()->route('admin.valorations.index','search='.$valoration->evaluation_id);
    }

    /**
     * Remove the specified Valoration from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $valoration = $this->valorationRepository->findWithoutFail($id);

        if (empty($valoration)) {
            Flash::error($this->dictionary->translate('Valoración no encontrada'));

            return redirect()->route('admin.valorations.index');
        }

        $this->valorationRepository->delete($id);

        Flash::success($this->dictionary->translate('Valoración eliminada correctamente'));

        return redirect()->route('admin.valorations.index', 'search='.$valoration->evaluation_id);
    }
}
