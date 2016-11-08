<?php

/**
 *
 */
namespace App\Library;

use Mail;
use App\Models\Message;
use App\Models\Evaluation;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Password;
use Illuminate\Foundation\Auth\ResetsPasswords;

class EmailSend
{
  use ResetsPasswords;

  private $message_id;
  private $user;
  private $evaluation_id;
  private $pass;
  private $request = false;
  private $controller = null;

  /**
   * { function_description }
   *
   * @param      <type>   $message_id     The message identifier
   * @param      <type>   $evaluation_id  The evaluation identifier
   * @param      <type>   $user           The user
   * @param      <type>   $pass           The pass
   * @param      boolean  $request        The request
   * @param      <type>   $controller     The controller
   */
  public function __construct($message_id, $evaluation_id, $user, $pass = NULL, $request = false, $controller = null)
  {
      $this->message_id = $message_id;
      $this->evaluation_id = $evaluation_id;
      $this->user = $user;
      $this->pass = $pass;
      $this->request = $request;
      $this->controller = $controller;
  }

  /**
   * { function_description }
   */
  public function send()
	{
      if ( $this->request == false ) {
  			$config = array();
  		  $msg = Message::where('id',$this->message_id)->first();

        $msg->message = $msg->getAttributeTranslate($msg->message, $this->user->language_id);

      	$msg->message = str_replace("user_name", $this->user->name, $msg->message);
        $msg->message = str_replace("user_last_name", $this->user->last_name, $msg->message);
        $msg->message = str_replace("user_email", $this->user->email, $msg->message);

        if (strpos($msg->message, 'user_password') !== false){ // reset password
          $msg->message = str_replace("user_password", $this->pass, $msg->message);
        }

        $msg->message = str_replace("client_name", $this->user->client->name, $msg->message);
        $msg->message = str_replace("evaluation_name", $this->user->client->name, $msg->message);

        if (strpos($msg->message, 'evaluation_name') !== false){
          $evaluation = Evaluation::where('id',$this->evaluation_id)->first();
          $msg->message = str_replace("evaluation_name", $evaluation->name, $msg->message);
        }

        
        $msg->message = str_replace("web_link", \URL::to('/'), $msg->message);

        $config = array();


  	    $config = [
  	        'driver' => 'smtp',
  	        'host' => 'evaluaciononline.es',
  	        'port' => '25',
  	        'username' => 'sed@evaluaciononline.es',
  	        'password' => 'kyfC10&4',
  	        ];
          \Config::set('mail',$config);

  		$send = Mail::send(['html' => 'emails.message'], [ 'msg' => $msg->message, 'link' => '' ], function($message) use ($msg)
  		{
  				  $message->from( 'sed@people-experts.com', 'Evaluaciones Online' );
  				  $message->to( $this->user->email, $this->user->name.' '.$this->user->last_name)->subject($msg->getAttributeTranslate($msg->subject, $this->user->language_id));

        });
      }
      else
        $this->controller->postEmail($this->request);
	}
}

/*      if ( $this->send_link ) {
        $broker = $this->getBroker();
        $user = Password::broker($broker)->getUser(['email' => $this->user->email]);
        // echo '<pre>';
        // print_r($user);
        $user->forceFill([
            'password' => bcrypt($this->send_link['password']),
            'remember_token' => ($token = Str::random(60)),
        ])->save();

        Auth::guard($this->getGuard())->login($user);
        // dd($user);
      } else $token = "";
      */
?>
