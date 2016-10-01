<?php

namespace App\Http\Controllers\Admin;

use Flash;
use Response;
use App\Http\Requests;
use Illuminate\Http\Request;
use App\Http\Controllers\AppBaseController;
use App\Http\Requests\CreatePostRequest;
use App\Http\Requests\UpdatePostRequest;
use App\Repositories\PostRepository;
use App\Repositories\LanguageRepository;
use App\Repositories\ClientRepository;
use Prettus\Repository\Criteria\RequestCriteria;


class PostController extends AdminBaseController
{
    /** @var  PostRepository */
    private $postRepository;
    private $clientRepo;
    

    public function __construct(PostRepository $postRepo, ClientRepository $clientRepo)
    {
        $this->postRepository = $postRepo;
        $this->clientRepo = $clientRepo;
        parent::__construct();
    
    }

    /**
     * Display a listing of the Post.
     *
     * @param Request $request
     * @return Response
     */
    public function index(Request $request)
    {
        $this->postRepository->pushCriteria(new RequestCriteria($request));
        $posts = $this->postRepository->all();
        $evaluation = $this->evaRepo->find($request->search);

        return view('admin.posts.index')->with('posts', $posts)
                                        ->with('evaluation', $evaluation);
    }

    /**
     * Show the form for creating a new Post.
     *
     * @return Response
     */
    public function create(Request $request)
    {
        $languages = $this->languageRepository->all();
        $evaluation = $this->evaRepo->find($request->search);
        return view('admin.posts.create')->with('languages', $languages)
                                         ->with('evaluation_id', $request->search)
                                         ->with('client_id', $evaluation->client_id);
    }

    /**
     * Store a newly created Post in storage.
     *
     * @param CreatePostRequest $request
     *
     * @return Response
     */
    public function store(CreatePostRequest $request)
    {
        $input = $request->all();

        $post = $this->postRepository->create($input);

        Flash::success($this->dictionary->translate('Puesto guardado correctamente'));

        return redirect()->route('admin.posts.index', 'search='.$post->evaluation_id);
    }

    /**
     * Show the form for editing the specified Post.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $post = $this->postRepository->findWithoutFail($id);
        $languages = $this->languageRepository->all();

        if (empty($post)) {
            Flash::error($this->dictionary->translate('Puesto no encontrado'));

            return redirect(route('posts.index'));
        }

        return view('admin.posts.edit')->with('post', $post)
                                       ->with('languages', $languages)
                                       ->with('evaluation_id', $post->evaluation_id)
                                       ->with('client_id', $post->client_id);
    }

    /**
     * Update the specified Post in storage.
     *
     * @param  int              $id
     * @param UpdatePostRequest $request
     *
     * @return Response
     */
    public function update($id, UpdatePostRequest $request)
    {
        $post = $this->postRepository->findWithoutFail($id);

        if (empty($post)) {
            Flash::error($this->dictionary->translate('Puesto no encontrado'));

            return redirect(route('admin.posts.index', 'search='.$post->evaluation_id));
        }

        $post = $this->postRepository->update($request->all(), $id);

        Flash::success($this->dictionary->translate('Puesto actualizado correctamente'));

        return redirect(route('admin.posts.index','search='.$post->evaluation_id));
    }

    /**
     * Remove the specified Post from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $post = $this->postRepository->findWithoutFail($id);

        if (empty($post)) {
            Flash::error($this->dictionary->translate('Puesto no encontrado'));

            return redirect()->route('admin.posts.index', 'search='.$post->evaluation_id);
        }

        $this->postRepository->delete($id);

        Flash::success($this->dictionary->translate('Puesto eliminado correctamente'));

        return redirect()->route('admin.posts.index', 'search='.$post->evaluation_id);
    }
}
