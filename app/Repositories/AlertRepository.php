<?php

namespace App\Repositories;

use App\Models\Alert;
use App\Models\AlertUser;
use InfyOm\Generator\Common\BaseRepository;

class AlertRepository extends AdminBaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'evaluation_id'
    ];

    /**
     * Configure the Model
     **/
    public function model()
    {
        return Alert::class;
    }

    /**
     * { function_description }
     *
     * @param      <type>  $alert_id     The identifier
     * @param      <type>  $null         The null
     *
     * @return     <type>  ( description_of_the_return_value )
     */
    public function findByID( $alert_id, $user = null) {
        $alert = Alert::findOrFail( $alert_id );

        // Marcar como leido
        if ( $user != null && AlertUser::where('user_id', $user->id)->count() == 0 ) 
            $alert->alerts()->save( new AlertUser([ 'alert_id' => $alert_id, 'user_id' => $user->id ]) );

        return $alert;
    }

    /**
     * { function_description }
     *
     * @param      <type>  $alert_id  The alert identifier
     */
    public function alertIsRead( $alert_id ) {
        return Alert::findOrFail( $alert_id )->alertByUser( Auth::user()->id )->count() > 0;
    }
}
