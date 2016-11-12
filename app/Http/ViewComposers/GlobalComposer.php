<?php namespace App\Http\ViewComposers;

use Response;
use App\Http\Requests;
use Illuminate\Contracts\View\View;
use App\Repositories\UserRepository;
use App\Repositories\ClientRepository;
use App\Repositories\MessageRepository;
use App\Repositories\EvaluationRepository;
use App\Repositories\RatingRepository;
use App\Repositories\LanguageRepository;
use App\Repositories\TrackingRepository;
use App\Repositories\AlertRepository;
use Session;

class GlobalComposer
{

    private $userRepo;
    private $clientRepo;
    private $languageRepo;
    private $evaluationRepo;
    private $ratingRepo;
    private $messageRepo;
    private $alertRepo;
    private $trackingRepo;

    public function __construct(UserRepository $userRepo,
                                ClientRepository $clientRepo,
                                LanguageRepository $languageRepo,
                                EvaluationRepository $evaluationRepo,
                                RatingRepository $ratingRepo,
                                MessageRepository $messageRepo,
                                TrackingRepository $trackingRepo,
                                AlertRepository $alertRepo)
    {
        $this->userRepo = $userRepo;
        $this->clientRepo = $clientRepo;
        $this->languageRepo = $languageRepo;
        $this->evaluationRepo = $evaluationRepo;
        $this->ratingRepo = $ratingRepo;
        $this->messageRepo = $messageRepo;
        $this->trackingRepo = $trackingRepo;
        $this->alertRepo = $alertRepo;
    }
    /**
     * Bind data to the view.
     *
     * @param  View $view
     * @return void
     */
    public function compose(View $view)
    {
        $view->with('userCount',  $this->userRepo->getCountRecords());
        $view->with('clientCount',  $this->clientRepo->getCountRecords());
        $view->with('languageCount',  $this->languageRepo->getCountRecords());
        $view->with('evaluationCount',  $this->evaluationRepo->getCountRecords());
        $view->with('ratingCount',  $this->ratingRepo->getCountRecords());
        $view->with('messageCount',  $this->messageRepo->getCountRecords());
        $view->with('trackingCount',  $this->trackingRepo->getCountRecords());
        $view->with('alertCount',  $this->alertRepo->getCountRecords());
        
        if (Session::get('evaluation_id')) :
            $evaluation = $this->evaluationRepo->find(Session::get('evaluation_id'));
            $view->with('enabledObjectives',  $this->evaluationRepo->enabledObjectives($evaluation));
            $view->with('enabledCompetitions',  $this->evaluationRepo->enabledCompetitions($evaluation));
            $view->with('enabledValorations',  $this->evaluationRepo->enabledValorations($evaluation));
        endif;
        
    }
}
