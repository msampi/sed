<?php

namespace App\Http\Controllers\Admin;

use Flash;
use Response;
use App\Models\Post;
use App\Models\User;
use App\Http\Requests;
use App\Models\Rating;
use App\Model\Message;
use App\Library\EmailSend;
use Illuminate\Http\Request;
use App\Http\Requests\MessageRequest;
use App\Repositories\MessageRepository;
use App\Repositories\EvaluationRepository;
use App\Http\Controllers\AppBaseController;
use Prettus\Repository\Criteria\RequestCriteria;
use Illuminate\Foundation\Auth\ResetsPasswords;
use App\Repositories\EvaluationUserEvaluatorRepository;
use App\Http\Requests\CreateEvaluationUserEvaluatorRequest;
use App\Http\Requests\UpdateEvaluationUserEvaluatorRequest;

class EvaluationUserEvaluatorController extends AdminBaseController
{
    use ResetsPasswords;

    /** @var  EvaluationRepository */
    private $evaluationUserEvaluatorRepository;

    /** @var  MessageRepository */
    protected $messageRepository;


    /**
     * { function_description }
     *
     * @param      \App\Repositories\EvaluationUserEvaluatorRepository  $evaluationUserEvaluatorRepo  The evaluation user evaluator repo
     * @param      MessageRepository                                    $messageRepo                  The message repo
     */
    public function __construct(EvaluationUserEvaluatorRepository $evaluationUserEvaluatorRepo, MessageRepository $messageRepo)
    {
        $this->evaluationUserEvaluatorRepository = $evaluationUserEvaluatorRepo;
        $this->messageRepository = $messageRepo;

        parent::__construct();
    }

    /**
     * Display a listing of the Evaluation.
     *
     * @param Request $request
     * @return Response
     */
    public function index(Request $request)
    {
        $this->evaluationUserEvaluatorRepository->pushCriteria(new RequestCriteria($request));
        $evaluation_users = $this->evaluationUserEvaluatorRepository->all();
        $evaluation = $this->evaRepo->find($request->search);
        $messages = $this->messageRepository->all();

        return view('admin.evaluationUserEvaluators.index')->with('evaluation_users', $evaluation_users)
                                                           ->with('evaluation', $evaluation)
                                                           ->with('mensajes', $messages);


    }

    /**
     * Show the form for creating a new Evaluation.
     *
     * @return Response
     */
    public function create(Request $request)
    {
        $post = new Post();
        $evaluation = $this->evaRepo->find($request->search);
        $users = User::where('role_id', 3)->where('client_id', $evaluation->client_id)->lists('email', 'id');
        $users->prepend('Ninguno', '');
        return view('admin.evaluationUserEvaluators.create')->with('posts', $post->listCurrentLang('id', 'name'))
                                                            ->with('evaluation', $evaluation)
                                                            ->with('users', $users) ;
    }

    /**
     * Store a newly created Evaluation in storage.
     *
     * @param CreateEvaluationRequest $request
     *
     * @return Response
     */
    public function store(CreateEvaluationUserEvaluatorRequest $request)
    {

        $input = $request->all();


        if ($request->get('user_id') == $request->get('evaluator_id') ) {

            return redirect(route('admin.evaluationUserEvaluators.create', 'search='.$request->get('evaluation_id')))->withErrors([$this->dictionary->translate('Un usuario no puede ser evaluado por si mismo')]);

        }

        $evaluation = $this->evaluationUserEvaluatorRepository->updateOrCreate(['evaluation_id' => $input['evaluation_id'], 'evaluator_id' => $input['evaluator_id'], 'user_id' => $input['user_id'] ], $input);

        Flash::success($this->dictionary->translate('Evaluación guardada correctamente'));

        return redirect(route('admin.evaluationUserEvaluators.index','search='.$request->get('evaluation_id')));

    }



    /**
     * Show the form for editing the specified Evaluation.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $eue = $this->evaluationUserEvaluatorRepository->findWithoutFail($id);
        $evaluation = $this->evaRepo->find($eue->evaluation_id);
        $users = User::where('role_id', 3)->where('client_id', $evaluation->client_id)->lists('email', 'id');
        $users->prepend('Ninguno', '');
        $post = new Post();
        if (empty($evaluation)) {
            Flash::error($this->dictionary->translate('Evaluación no encontrada'));

            return redirect(route('admin.evaluationUserEvaluators.index'));
        }

        return view('admin.evaluationUserEvaluators.edit')->with('evaluation', $evaluation)
                                                          ->with('eue', $eue)
                                                          ->with('posts', $post->listCurrentLang('id', 'name'))
                                                          ->with('users', $users);
    }

    /**
     * Update the specified Evaluation in storage.
     *
     * @param  int              $id
     * @param UpdateEvaluationRequest $request
     *
     * @return Response
     */



    public function update($id, UpdateEvaluationUserEvaluatorRequest $request)
    {
        $evaluation = $this->evaluationUserEvaluatorRepository->findWithoutFail($id);

        if (empty($evaluation)) {

            Flash::error($this->dictionary->translate('Evaluación no encontrada'));
            return redirect(route('admin.evaluationUserEvaluators.index','search='.$evaluation->evaluation_id));

        }

        if ($request->get('user_id') == $request->get('evaluator_id') ) {

            return redirect(route('admin.evaluationUserEvaluators.edit', [$evaluation->id]))->withErrors([$this->dictionary->translate('Un usuario no puede ser evaluado por si mismo')]);

        }

        $input = $request->all();
        //$evaluation = $this->evaluationUserEvaluatorRepository->updateOrCreate(['evaluation_id' => $input['evaluation_id'], 'evaluator_id' => $input['evaluator_id'], 'user_id' => $input['user_id'] ], $input);
        $evaluation = $this->evaluationUserEvaluatorRepository->update($input,$id);

        Flash::success($this->dictionary->translate('Evaluación actualizada correctamente'));

        return redirect(route('admin.evaluationUserEvaluators.index','search='.$evaluation->evaluation_id));
    }

    /**
     * Remove the specified Evaluation from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $evaluation = $this->evaluationUserEvaluatorRepository->findWithoutFail($id);

        if (empty($evaluation)) {
            Flash::error($this->dictionary->translate('Evaluación no encontrada'));

            return redirect(route('admin.evaluationUserEvaluators.index'));
        }

        $this->evaluationUserEvaluatorRepository->delete($id);

        Flash::success($this->dictionary->translate('Evaluación eliminada correctamente'));

        return redirect(route('admin.evaluationUserEvaluators.index', 'search='.$evaluation->evaluation_id));
    }

    /**
     * { function_description }
     *
     * @param      \Illuminate\Http\Request  $request  The request
     */
    public function send(Request $request, MessageRequest $messageRequest) {

        foreach ( explode(",", $messageRequest->get('users', ''))  as $key => $value) {
            $resend = $this->getUsers( $messageRequest );
            $email = new EmailSend($messageRequest->get('mensaje'), $messageRequest->get('search'), User::find( $value ), NULL, $resend, $this);
            $email->send();
        }
        Flash::success($this->dictionary->translate('Mensajes enviados correctamente'));
        $this->index( $messageRequest );
    }

    /**
     * Gets the users.
     *
     * @param      \App\Http\Requests\MessageRequest          $messageRequest  The message request
     *
     * @return     \App\Http\Requests\MessageRequest|boolean  The users.
     */
    private function getUsers( MessageRequest $messageRequest ) {
        if ( $messageRequest->get('clave', false) ) {
            $messageRequest->request->add(['email'=>User::findOrFail( $value )->email ]);
            $resend = $messageRequest;
        }
        else
            $resend = false;

        return $resend;
    }
}
