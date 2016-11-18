<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use App\Library\Dictionary;
class Request extends FormRequest
{
    protected $dictionary;
    
    public function __construct()
    {
        $this->dictionary = new Dictionary();
    }

    
    public function messages()
    {
        return [
            'name.required' => $this->dictionary->translate('Debe completar el campo nombre'),
            'last_name.required' => $this->dictionary->translate('Debe completar el campo apellido'),
            'client_id.required' => $this->dictionary->translate('Debe completar el campo cliente'),
            'code.required' => $this->dictionary->translate('Debe completar el campo código'),
            'email.required' => $this->dictionary->translate('Debe completar el campo email'),
            'code.unique' => $this->dictionary->translate('Ya existe otro usuario con el código ingresado'),
            'email.unique' => $this->dictionary->translate('Ya existe otro usuario con el email ingresado'),
            'prefix.required' => $this->dictionary->translate('Debe completar el campo prefijo'),
            'first_stage.required' => $this->dictionary->translate('Debe completar el campo primera etapa'),
            'second_stage.required' => $this->dictionary->translate('Debe completar el campo segunda etapa'),
            'third_stage.required' => $this->dictionary->translate('Debe completar el campo tercera etapa'),
            'mandatory_sections.required' => $this->dictionary->translate('Debe seleccionar al menos una sección'),
        ];
    }
}
