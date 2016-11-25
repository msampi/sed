<!-- Id Field -->
<div class="col-md-6">
  <h4>{!! $dictionary->translate('Promedio Empleado') !!}: {!! $avgUser !!} </h4>
  <div class="form-group col-sm-12">
      {!! Form::label('user_comment', $dictionary->translate('Comentarios Empleado')) !!}
      {!! $performance->user_comment !!}
  </div>
  <div class="form-group col-sm-12">
      {!! Form::label('user_comment', $dictionary->translate('Conforme')) !!}?
      {!! ($performance->user_agree) ? $dictionary->translate('Si') : $dictionary->translate('No') !!}
  </div>
  <div class="form-group col-sm-12">
      {!! Form::label('user_result', $dictionary->translate('Resultado de desempeño empleado')) !!}
      {!! $performance->user_result !!}
  </div>
  <div class="form-group col-sm-12">
      {!! Form::label('final_score', $dictionary->translate('Puntuación final')) !!}
      {!! $performance->final_score !!}
  </div>
</div>
<div class="col-md-6">
  <h4>{!! $dictionary->translate('Promedio Manager') !!}: {!! $avgEvaluator !!} </h4>
  <div class="form-group col-sm-12">
      {!! Form::label('evaluator_comment', $dictionary->translate('Comentarios Manager')) !!}
      {!! $performance->evaluator_comment !!}
  </div>
  
  <div class="form-group col-sm-12">
      {!! Form::label('evaluator_result', $dictionary->translate('Resultado de desempeño manager')) !!}
      {!! $performance->evaluator_result !!}
  </div>
</div>
<div class="row clearfix"></div>
