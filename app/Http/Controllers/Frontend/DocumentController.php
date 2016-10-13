<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Requests;
use App\Http\Requests\CreateDocumentRequest;
use App\Http\Requests\UpdateDocumentRequest;
use App\Repositories\DocumentRepository;
use App\Repositories\UserRepository;
use App\Http\Controllers\AppBaseController as InfyOmBaseController;
use Illuminate\Http\Request;
use App\Repositories\EvaluationUserEvaluatorRepository;
use App\Repositories\EvaluationRepository;
use Flash;
use Prettus\Repository\Criteria\RequestCriteria;
use Response;

class DocumentController extends AppFrontendController
{
    /** @var  DocumentRepository */
    private $documentRepository;

    public function __construct(UserRepository $userRepo,
                                DocumentRepository $documentRepo,
                                EvaluationRepository $evaluationRepo,
                                EvaluationUserEvaluatorRepository $evaluationUserEvaluatorRepo)
    {
        parent::__construct($userRepo, $evaluationRepo, $evaluationUserEvaluatorRepo);
        $this->documentRepository = $documentRepo;
    }

    /**
     * Display a listing of the Document.
     *
     * @param Request $request
     * @return Response
     */
    public function index(Request $request)
    {
        parent::setCurrentUser(NULL);
        $this->trackingRepository->saveTrackingAction($this->tracking->id,'Ingreso a documentos');
        $this->documentRepository->pushCriteria(new RequestCriteria($request));
        $documents = $this->documentRepository->all();
        $current_stage = $this->evaluationRepository->getCurrentStage();

        return view('frontend.documents')
            ->with('documents', $documents)
            ->with('section_name','Documentos')
            ->with('is_logged_user',$this->is_logged_user)
            ->with('user',$this->user)
            ->with('current_stage',$current_stage);
    }


}
