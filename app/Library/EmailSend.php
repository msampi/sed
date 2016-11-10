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
use App\Http\Controllers\AppBaseController;

class EmailSend extends AppBaseController
{
  use ResetsPasswords;

  private $message_id;
  private $user;
  private $evaluation_id;
  private $request = false;
  

  /**
   * { function_description }
   *
   * @param      <type>   $message_id     The message identifier
   * @param      <type>   $evaluation_id  The evaluation identifier
   * @param      <type>   $user           The user
   * @param      boolean  $request        The request
   
   */
  public function __construct($message_id, $evaluation_id, $user, $request = false)
  {
      $this->message_id = $message_id;
      $this->evaluation_id = $evaluation_id;
      $this->user = $user;
      $this->request = $request;
      
  }

  /**
   * { function_description }
   */
  public function send()
	{
      
  		$config = array();
  		$msg = Message::where('id',$this->message_id)->first();
        
        $msg->message = $msg->getAttributeTranslate($msg->message, $this->user->language_id);
      	$msg->message = str_replace("user_name", $this->user->name, $msg->message);
        $msg->message = str_replace("user_last_name", $this->user->last_name, $msg->message);
        $msg->message = str_replace("user_email", $this->user->email, $msg->message);

        $msg->message = str_replace("client_name", $this->user->client->name, $msg->message);
        $msg->message = str_replace("evaluation_name", $this->user->client->name, $msg->message);

        if (strpos($msg->message, 'evaluation_name') !== false){
          $evaluation = Evaluation::where('id',$this->evaluation_id)->first();
          $msg->message = str_replace("evaluation_name", $evaluation->name, $msg->message);
        }

        
        $msg->message = str_replace("web_link", \URL::to('/'), $msg->message);

        $config = array();


  		$send = Mail::send(['html' => 'emails.message'], [ 'msg' => $msg->message, 'link' => '' ], function($message) use ($msg)
  		{
  				  $message->from( 'sed@people-experts.com', 'Evaluaciones Online' );
  				  $message->to( $this->user->email, $this->user->name.' '.$this->user->last_name)->subject($msg->getAttributeTranslate($msg->subject, $this->user->language_id));

        });
        if ( $this->request ) 
            $this->postEmail($this->request);
	}
}
?>
