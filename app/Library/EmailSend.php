<?php

/**
 *
 */
namespace App\Library;
use App\Models\Message;
use App\Models\Evaluation;
use Mail;

class EmailSend
{
  private $message_id;
  private $user;
  private $evaluation_id;
  private $pass;


  public function __construct($message_id, $evaluation_id, $user, $pass = NULL)
  {
      $this->message_id = $message_id;
      $this->evaluation_id = $evaluation_id;
      $this->user = $user;
      $this->pass = $pass;
  }


  public function send()
	{

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

      //$msg->message = str_replace("web_link", URL::to('/'), $msg->message);


			$send = Mail::send(['html' => 'emails.message'], [ 'msg' => $msg->message ], function($message) use ($msg)
			{
				  $message->from( 'centro@centromultimedia.com.ar', 'Evaluaciones Online' );
				  $message->to( $this->user->email, $this->user->name.' '.$this->user->last_name)->subject($msg->getAttributeTranslate($msg->subject, $this->user->language_id));

      });



	}
}

?>
