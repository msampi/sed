<?php
namespace App\Criteria;

use Prettus\Repository\Contracts\RepositoryInterface;
use Prettus\Repository\Contracts\CriteriaInterface;


class EqualCriteria implements CriteriaInterface {

	private $field;
	private $equal;

	public function __construct($field, $equal)
	{
		$this->field = $field;
		$this->equal = $equal;
	}

    public function apply($model, RepositoryInterface $repository)
    {
    	
        $model = $model->where($this->field,'=', $this->equal);
        return $model;
        
    }
}
