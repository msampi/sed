<?php

namespace App\Library;
use App\Models\Translation;
use Auth;


/* Singleton */

class Dictionary { 


	private $dictionary;

	public function __construct()
	{
		$this->dictionary = $this->loadDictionary();
	}

	private function loadDictionary()
    {
        
        $translations = Translation::all();

        foreach ($translations as $translation) {
        
            $this->dictionary[$translation->words[1]] = $translation->words;
    
        }


        return $this->dictionary;

    }

    public function translate($word)
    {
        if (isset($this->dictionary[$word]))
            return $this->dictionary[$word][Auth::user()->language->id];
        return $word;
        //use App\Library\Dictionary;
    }

	

}

?>