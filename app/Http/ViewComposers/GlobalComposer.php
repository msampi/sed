<?php namespace App\Http\ViewComposers;

use Response;
use App\Http\Requests;
use Illuminate\Contracts\View\View;
use App\Repositories\UserRepository;
use App\Repositories\ClientRepository;
use App\Repositories\EvaluationRepository;
use App\Repositories\RatingRepository;
use App\Repositories\LanguageRepository;


class GlobalComposer
{

    private $userRepo;

    private $clientRepo;

    private $languageRepo;

    private $evaluationRepo;

    private $ratingRepo;

    public function __construct(UserRepository $userRepo, ClientRepository $clientRepo, LanguageRepository $languageRepo, EvaluationRepository $evaluationRepo, RatingRepository $ratingRepo)
    {
        $this->userRepo = $userRepo;
        $this->clientRepo = $clientRepo;
        $this->languageRepo = $languageRepo;
        $this->evaluationRepo = $evaluationRepo;
        $this->ratingRepo = $ratingRepo;
    }    
    /**
     * Bind data to the view.
     *
     * @param  View $view
     * @return void
     */
    public function compose(View $view)
    {
        $view->with('userCount',  $this->userRepo->getUserCount());
        $view->with('clientCount',  $this->clientRepo->getClientCount());
        $view->with('languageCount',  $this->languageRepo->getLanguageCount());
        $view->with('evaluationCount',  $this->evaluationRepo->getEvaluationCount());
        $view->with('ratingCount',  $this->ratingRepo->getRatingCount());
    }
}