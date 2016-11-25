<?php

namespace App\Models;


use Eloquent as Model;

/**
 * Class EvaluationUserEvaluator
 * @package App\Models
 */
class EvaluationUserEvaluator extends BaseModel
{

    public $table = 'evaluation_user_evaluators';



    public $fillable = [
        'evaluation_id',
        'evaluator_id',
        'user_id',
        'post_id',
        'category'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'evaluation_id' => 'integer',
        'evaluator_id' => 'integer',
        'user_id' => 'integer',
        'status_objectives' => 'array',
        'status_competitions' => 'array',
        'status_valorations' => 'array'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [

    ];


    public function user()
    {
        return $this->belongsTo('App\Models\User');
    }

    public function post()
    {
        return $this->belongsTo('App\Models\Post');
    }

    public function evaluator()
    {
        return $this->belongsTo('App\Models\User','evaluator_id');
    }
    
     public function evaluation()
    {
        return $this->belongsTo('App\Models\Evaluation');
    }

    public function childrenEUA()
    {
        return $this->hasMany($this, 'evaluator_id', 'user_id');
    }

    public function allChildrenEUA()
    {
        return $this->childrenEUA()->with('allChildrenEUA');
    }
    
    public function completed()
    {
        if ($this->getFirstStageStatus() == 2 && $this->getSecondStageStatus() == 2 && $this->getThirdStageStatus() == 2)
            return true;
        return false;
            
    }
    
    public function getStageStatus($number, $section){
        
        if ($section == 'objectives')
            if (isset($this->status_objectives[$number]))
                return $this->status_objectives[$number];
        if ($section == 'competitions')
            if (isset($this->status_competitions[$number]))
                return $this->status_competitions[$number];
        if ($section == 'valorations')
            if (isset($this->status_valorations[$number]))
                return $this->status_valorations[$number];
        
        return 0;
            
    }
    
    public function getFirstStageStatus(){
        if (isset($this->status_objectives[0]))
            return $this->status_objectives[0];
        return 0;
    }
    
    public function getSecondStageStatus(){
        
        
        if (isset($this->status_objectives[1]) && isset($this->status_competitions[1]) && isset($this->status_valorations[1]))
            if ($this->status_objectives[1] == 2 && $this->status_competitions[1] == 2 && $this->status_valorations[1] == 2)
                return 2;
            else
                if ($this->status_objectives[1] == 0 && $this->status_competitions[1] == 0 && $this->status_valorations[1] == 0)
                    return 0; 
                else
                    return 1;
        else
            return 0;
    }
    
    public function getThirdStageStatus(){
        if (isset($this->status_objectives[2]) && isset($this->status_competitions[2]) && isset($this->status_valorations[2]))
            if ($this->status_objectives[2] == 2 && $this->status_competitions[2] == 2 && $this->status_valorations[2] == 2)
                return 2;
            else
                if ($this->status_objectives[2] == 0 && $this->status_competitions[2] == 0 && $this->status_valorations[2] == 0)
                    return 0;
                else
                    return 1; 
        else
            return 0;
    }
    

    
    public function setStatus($status, $stage, $section)
    {
        
        if ($status)
            if ($section == 'objectives'){
                $aux = $this->status_objectives;
                $aux[$stage-1] = $status;
                $this->status_objectives = $aux;
            }
            if ($section == 'competitions'){
                $aux = $this->status_competitions;
                $aux[$stage-1] = $status;
                $this->status_competitions = $aux;
            }
            if ($section == 'valorations'){
                $aux = $this->status_valorations;
                $aux[$stage-1] = $status;
                $this->status_valorations = $aux;
            }
              
    }


}
