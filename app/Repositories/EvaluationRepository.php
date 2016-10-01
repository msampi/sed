<?php

namespace App\Repositories;

use App\Models\Evaluation;
use InfyOm\Generator\Common\BaseRepository;
use Session;
use Carbon\Carbon;
use Auth;

class EvaluationRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'name'
    ];

    /**
     * Configure the Model
     **/
    public function model()
    {
        return Evaluation::class;
    }


    /**
     * Gets the evaluation count.
     *
     * @return     <type>  The evaluation count.
     */
    public function getEvaluationCount() {
        return $this->all()->count();
    }

    public function getObjectivesRating() {
        return $this->model->where('id', Session::get('evaluation_id'))->first()->objectivesRating;
    }

    public function getCompetitionsRating() {
        return $this->model->where('id', Session::get('evaluation_id'))->first()->competitionsRating;
    }

    public function getValorationsRating() {
        return $this->model->where('id', Session::get('evaluation_id'))->first()->valorationsRating;
    }


    public function getCurrentStage()
    {

        $evaluation = $this->model->where('id',Session::get('evaluation_id'))->first();

        $now = Carbon::now();

        if ($evaluation->start_year_end->gt($now))
            return 1;
        else
        if ($evaluation->half_year_end->gt($now))
            return 2;
        else
            return 3;

        return 2;


    }

    public function getEvaluationsList($client = NULL)
    {
      if (!$client)
        $evaluations = $this->all();
      else
        $evaluations = $this->findWhere(['client_id' => $client->id]);


      $result = array();
      foreach ($evaluations as $evaluation) {
          $result[$evaluation->id] = $evaluation->name;
      
      }

      return $result;
    }


}
