<?php

namespace App\Models;

use Eloquent as Model;
use Auth;

/**
 * Class Alert
 * @package App\Models
 */
class AlertUser extends BaseModel
{

    public $table = 'alerts_users';

    public $timestamps = false;

    public $fillable = [
        'alert_id',
        'user_id'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        
    ];

}