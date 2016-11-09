<?php

namespace App\Repositories;

use App\Models\Alert;
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
     * @param      <type>  $id     The identifier
     *
     * @return     <type>  ( description_of_the_return_value )
     */
    public function findByID( $id, $read ) {
        $alert = Alert::findOrFail( $id );

        // Marcar como leido
        if ( $read ) {
            $alert->read = 1;
            $alert->save();
        }

        return $alert;
    }
}
