<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\AppBaseController;
use App\Repositories\LanguageRepository;
use App\Repositories\EvaluationRepository;
use App\Models\Client;
use View;
use App;
use Auth;

class AdminBaseController extends AppBaseController
{

    protected $languageRepository;
    protected $evaRepo;
    protected $superadmin;
    protected $clients;


    public function __construct()
    {
        $this->languageRepository = App::make(LanguageRepository::class);
        $this->evaRepo = App::make(EvaluationRepository::class);
        $this->superadmin = NULL;
        if (Auth::user()->role->id == 1){
          $this->superadmin = Auth::user();
          $this->clients = Client::lists('name', 'id');
        }
        else
            $this->clients = Client::where('id', Auth::user()->client_id)->lists('name','id');


        View::share('superadmin', $this->superadmin);
        parent::__construct();
    }

    public function loadLangScript(){
        $languages = $this->languageRepository->all(); ?>
             <script type="text/javascript">

                   var languages = new Array();
                    <?php foreach ($languages as $lang) :
                      if ($lang)
                      echo 'languages['.$lang->id.'] = "'.$lang->name.'";';

                    endforeach; ?>

            </script>
            <?php
    }

    public function random($length)
    {
        $key = '';
        $keys = array_merge(range(0, 9), range('a', 'z'));

        for ($i = 0; $i < $length; $i++) {
            $key .= $keys[array_rand($keys)];
        }

        return $key;
    }

    public function uploadImage($request, $field_name)
    {
        $imageName = NULL;
        if ($request->file($field_name)) :
            $imageName = $this->random(50).'.'.$request->file($field_name)->getClientOriginalExtension();
            $request->file($field_name)->move(base_path() . '/public/uploads/', $imageName);
        endif;

        return $imageName;
    }


}
