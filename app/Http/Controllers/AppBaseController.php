<?php

namespace App\Http\Controllers;

use InfyOm\Generator\Utils\ResponseUtil;
use Response;
use App\Library\Dictionary;
use Auth;

/**
 * @SWG\Swagger(
 *   basePath="api/v1",
 *   @SWG\Info(
 *     title="Laravel Generator APIs",
 *     version="1.0.0",
 *   )
 * )
 * This class should be parent class for other API controllers
 * Class AppBaseController
 */
class AppBaseController extends Controller
{
	
    protected $dictionary;

    public function __construct()
    {

        $this->dictionary = new Dictionary();
        
    }

    public function sendResponse($result, $message)
    {

        return Response::json(ResponseUtil::makeResponse($message, $result));

    }

    

    
}

