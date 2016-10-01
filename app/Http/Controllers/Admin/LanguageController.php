<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\AppBaseController;
use App\Http\Requests;
use App\Http\Requests\CreateLanguageRequest;
use App\Http\Requests\UpdateLanguageRequest;
use App\Repositories\LanguageRepository;
use Illuminate\Http\Request;
use Flash;
use Prettus\Repository\Criteria\RequestCriteria;
use Response;

class LanguageController extends AdminBaseController
{

    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Display a listing of the Language.
     *
     * @param Request $request
     * @return Response
     */
    public function index(Request $request)
    {
        $this->languageRepository->pushCriteria(new RequestCriteria($request));
        $languages = $this->languageRepository->all();

        return view('admin.languages.index')
            ->with('languages', $languages);
    }

    /**
     * Show the form for creating a new Language.
     *
     * @return Response
     */
    public function create()
    {
        return view('admin.languages.create');
    }

    /**
     * Store a newly created Language in storage.
     *
     * @param CreateLanguageRequest $request
     *
     * @return Response
     */
    public function store(CreateLanguageRequest $request)
    {
        $input = $request->all();

        $language = $this->languageRepository->create($input);

        Flash::success($this->dictionary->translate('Idioma guardado correctamente'));

        return redirect()->route('languages.index');
    }


    /**
     * Show the form for editing the specified Language.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $language = $this->languageRepository->findWithoutFail($id);

        if (empty($language)) {
            Flash::error($this->dictionary->translate('Idioma no encontrado'));

            return redirect(route('languages.index'));
        }

        return view('admin.languages.edit')->with('language', $language);
    }

    /**
     * Update the specified Language in storage.
     *
     * @param  int              $id
     * @param UpdateLanguageRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateLanguageRequest $request)
    {
        $language = $this->languageRepository->findWithoutFail($id);

        if (empty($language)) {
            Flash::error($this->dictionary->translate('Idioma no encontrado'));

            return redirect(route('languages.index'));
        }

        $language = $this->languageRepository->update($request->all(), $id);

        Flash::success($this->dictionary->translate('Idioma actualizado correctamente'));

        return redirect(route('languages.index'));
    }

    /**
     * Remove the specified Language from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $language = $this->languageRepository->findWithoutFail($id);

        if (empty($language)) {
            Flash::error($this->dictionary->translate('Idioma no encontrado'));

            return redirect()->route('languages.index');
        }

        $this->languageRepository->delete($id);

        Flash::success($this->dictionary->translate('Idioma eliminado correctamente'));

        return redirect()->route('languages.index');
    }
}
