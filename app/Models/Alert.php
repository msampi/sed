<?php

namespace App\Models;

use Eloquent as Model;
use Auth;

/**
 * Class Alert
 * @package App\Models
 */
class Alert extends BaseModel
{

    public $table = 'alerts';

    public $fillable = [
        'name',
        'description',
        'evaluation_id',
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'name' => 'array',
        'description' => 'array',
        'evaluation_id' => 'integer'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        
    ];

    /**
     * Obtiene las evaluaciones relacionadas con la alerta.
     *
     * @return     <type>  ( description_of_the_return_value )
     */
    public function evaluation()
    {
        return $this->belongsTo('App\Models\Evaluation');
    }

    /**
     * Obtiene el estado de la alerta por usuarios (leida o no leida).
     *
     * @return     <type>  ( description_of_the_return_value )
     */
    public function alerts()
    {
        return $this->hasMany('App\Models\AlertUser', 'alert_id');
    }

    /**
     * Devuelve el estado de la alerta segun el usuario especificado.
     *
     * @param      <type>  $user_id  The user identifier
     *
     * @return     <type>  ( description_of_the_return_value )
     */
    public function alertByUser( $user_id )
    {
        return $this->hasMany( 'App\Models\AlertUser', 'alert_id' )->where( 'user_id', $user_id );
    }
}