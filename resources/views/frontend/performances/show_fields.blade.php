<!-- Id Field -->
<div class="col-md-6">
  <h4>{!! $dictionary->translate('Promedio Empleado') !!}: </h4>
  <div class="form-group col-sm-12">
      {!! Form::label('user_comment', $dictionary->translate('Comentarios Empleado')) !!}
      {!! $performance->user_comment !!}
  </div>
  <div class="form-group col-sm-12">
      {!! Form::label('user_comment', $dictionary->translate('Conforme')) !!}?
      {!! ($performance->user_agree) ? $dictionary->translate('Si') : $dictionary->translate('No') !!}
  </div>
  <div class="form-group col-sm-12">
      {!! Form::label('user_final_score', $dictionary->translate('Puntuación final empleado')) !!}
      {!! $performance->user_final_score !!}
  </div>
</div>
<div class="col-md-6">
  <h4>{!! $dictionary->translate('Promedio Manager') !!}: </h4>
  <div class="form-group col-sm-12">
      {!! Form::label('evaluator_comment', $dictionary->translate('Comentarios Manager')) !!}
      {!! $performance->evaluator_comment !!}
  </div>
  <div class="form-group col-sm-12">
      {!! Form::label('evaluator_agree', $dictionary->translate('Conforme')) !!}?
      {!! ($performance->evaluator_agree) ? $dictionary->translate('Si') : $dictionary->translate('No') !!}
  </div>
  <div class="form-group col-sm-12">
      {!! Form::label('evaluator_final_score', $dictionary->translate('Puntuación final manager')) !!}
      {!! $performance->evaluator_final_score !!}
  </div>
</div>
