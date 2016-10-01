<?php
namespace App\Criteria;

use Prettus\Repository\Contracts\RepositoryInterface;
use Prettus\Repository\Contracts\CriteriaInterface;


class OrCriteria implements CriteriaInterface {

	private $criteria1;
	private $criteria2;

	public function __construct(CriteriaInterface $criteria1, CriteriaInterface $criteria2)
	{
		$this->criteria1 = $criteria1;
		$this->criteria2 = $criteria2;
	}

    public function apply($model, RepositoryInterface $repository)
    {
    	
        $model1 = $this->criteria1->apply($model,$repository);
        $model2 = $this->criteria1->apply($model,$repository);
        $model3 = $model1->orWhere(function($query)
            {
                $query = $model2;
            
            });

        return $model3;
        
    }
}
