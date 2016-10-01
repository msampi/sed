<?php

namespace App\Models;

use Eloquent as Model;
use Auth;
/**
 * Class Company
 * @package App\Models
 */
class BaseModel extends Model
{

	public function getName()
    {
        if (isset($this->name[Auth::user()->language_id]))
            return ucfirst($this->name[Auth::user()->language_id]);
        return NULL;
    }

    public function getDescription()
    {
        if (isset($this->description[Auth::user()->language_id]))
            return $this->description[Auth::user()->language_id];
        return NULL;
    }

    public function getAttributeTranslate($attr)
    {
    	if (isset($attr[Auth::user()->language_id]))
            return $attr[Auth::user()->language_id];
        return NULL;

    }

		public function listCurrentLang($value, $field)
    {
        $result = array();
				
        foreach ($this->all() as $post) {

						$result[$post->getAttribute($value)] = $post->getAttribute($field)[Auth::user()->language_id];

        }

        return $result;
    }


}
