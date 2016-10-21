<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\AppBaseController;
use App\Http\Requests;
use App\Repositories\AlertRepository;
use Illuminate\Http\Request;
use App\Http\Requests\CreateAlertRequest;
use App\Http\Requests\UpdateAlertRequest;
use Flash;
use Prettus\Repository\Criteria\RequestCriteria;
use Response;
use Illuminate\Support\Facades\Input;

class AlertController extends AdminBaseController
{
    /** @var  AlertRepository */
    private $alertRepository;


    public function __construct(AlertRepository $alertRepo)
    {
        $this->alertRepository = $alertRepo;
        parent::__construct();

    }

    /**
     * Display a listing of the Alert.
     *
     * @param Request $request
     * @return Response
     */
    public function index(Request $request)
    {
        $this->alertRepository->pushCriteria(new RequestCriteria($request));
        $alerts = $this->alertRepository->all();

        return view('admin.alerts.index')->with('alerts', $alerts);

    }

    /**
     * Show the form for creating a new Alert.
     *
     * @return Response
     */
    public function create(Request $request)
    {
        /* Recordar que si es admin solo muestro los puestos de su cliente */
        $languages = $this->languageRepository->all();

        return view('admin.alerts.create')->with('evaluations', $this->evaRepo->getEvaluationsList())
                                          ->with('languages', $languages);
    }

    /**
     * Store a newly created Alert in storage.
     *
     * @param CreateAlertRequest $request
     *
     * @return Response
     */
    public function store(CreateAlertRequest $request)
    {
        $input = $request->all();
        $alert = $this->alertRepository->create($input);

        Flash::success($this->dictionary->translate('Alerta guardada correctamente'));

        return redirect()->route('admin.alerts.index');
    }

    /**
     * Show the form for editing the specified Alert.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $alert = $this->alertRepository->findWithoutFail($id);
        $languages = $this->languageRepository->all();

        if (empty($alert)) {
            Flash::error($this->dictionary->translate('Alerta no encontrada'));

            return redirect()->route('admin.alerts.index');
        }

        return view('admin.alerts.edit')->with('alert', $alert)
                                        ->with('evaluations', $this->evaRepo->getEvaluationsList())
                                        ->with('languages', $languages);
    }

    /**
     * Update the specified Alert in storage.
     *
     * @param  int              $id
     * @param UpdateAlertRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateAlertRequest $request)
    {
        $alert = $this->alertRepository->findWithoutFail($id);

        if (empty($alert)) {
            Flash::error($this->dictionary->translate('Valoración no encontrada'));

            return redirect()->route('admin.alerts.index');
        }

        $alert = $this->alertRepository->update($request->all(), $id);

        Flash::success($this->dictionary->translate('Valoración actualizada correctamente'));

        return redirect()->route('admin.alerts.index');
    }

    /**
     * Remove the specified Alert from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $alert = $this->alertRepository->findWithoutFail($id);

        if (empty($alert)) {
            Flash::error($this->dictionary->translate('Valoración no encontrada'));

            return redirect()->route('admin.alerts.index');
        }

        $this->alertRepository->delete($id);

        Flash::success($this->dictionary->translate('Valoración eliminada correctamente'));

        return redirect()->route('admin.alerts.index');
    }
}
