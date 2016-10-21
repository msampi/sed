<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\AppBaseController;
use App\Http\Requests;
use App\Http\Requests\CreateTranslationRequest;
use App\Http\Requests\UpdateTranslationRequest;
use App\Repositories\TranslationRepository;
use App\Repositories\LanguageRepository;
use Illuminate\Http\Request;
use Flash;
use Prettus\Repository\Criteria\RequestCriteria;
use Response;



class TranslationController extends AdminBaseController
{
    /** @var  TranslationRepository */
    private $translationRepository;


    public function __construct(TranslationRepository $translationRepo, LanguageRepository $languageRepo)
    {
        $this->translationRepository = $translationRepo;
        parent::__construct();

    }

    /**
     * Display a listing of the Translation.
     *
     * @param Request $request
     * @return Response
     */
    public function index(Request $request)
    {
        $this->translationRepository->pushCriteria(new RequestCriteria($request));
        $languages = $this->languageRepository->all();
        $translations = $this->translationRepository->all();

        return view('admin.translations.index')
            ->with('translations', $translations)
            ->with('languages', $languages);
    }

    /**
     * Show the form for creating a new Translation.
     *
     * @return Response
     */
    public function create()
    {
        $languages = $this->languageRepository->all();
        return view('admin.translations.create')
                ->with('languages',$languages);
    }

    /**
     * Store a newly created Translation in storage.
     *
     * @param CreateTranslationRequest $request
     *
     * @return Response
     */
    public function store(CreateTranslationRequest $request)
    {
        $input = $request->all();

        $translation = $this->translationRepository->create($input);

        Flash::success('Translation saved successfully.');

        return redirect()->route('translations.index');
    }

    /**
     * Show the form for editing the specified Translation.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $translation = $this->translationRepository->findWithoutFail($id);
        $languages = $this->languageRepository->all();

        if (empty($translation)) {
            Flash::error('Translation not found');

            return redirect(route('translations.index'));
        }

        return view('admin.translations.edit')->with('translation', $translation)->with('languages',$languages);;
    }

    /**
     * Update the specified Translation in storage.
     *
     * @param  int              $id
     * @param UpdateTranslationRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateTranslationRequest $request)
    {
        $translation = $this->translationRepository->findWithoutFail($id);

        if (empty($translation)) {
            Flash::error('Translation not found');

            return redirect(route('translations.index'));
        }

        $translation = $this->translationRepository->update($request->all(), $id);

        Flash::success('Translation updated successfully.');

        return redirect(route('translations.index'));
    }

    /**
     * Remove the specified Translation from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $translation = $this->translationRepository->findWithoutFail($id);

        if (empty($translation)) {
            Flash::error('Translation not found');

            return redirect(route('translations.index'));
        }

        $this->translationRepository->delete($id);

        Flash::success('Translation deleted successfully.');

        return redirect(route('translations.index'));
    }
}
