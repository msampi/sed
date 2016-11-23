<input type="hidden" name="user_id" value="{!! $viewControlls->userId !!}">
<input type="hidden" name="evaluation_id" value="{!! $viewControlls->evaluationId  !!}">
<input type="hidden" name="evaluator_id" value="{!! $viewControlls->evaluatorId !!}">
<div class="col-md-6">
  <h4>{!! $dictionary->translate('Promedio Evaluado') !!}: {!! $avgUser!!} </h4>
  <div class="form-group col-sm-12">
      {!! Form::label('user_comment', $dictionary->translate('Comentarios Evaluado')) !!}
      @if ($viewControlls->isEmpleado)
        {!! Form::textarea('user_comment', null, ['class' => 'form-control textarea-small']) !!}
      @else
        {!! Form::textarea('user_comment', null, ['class' => 'form-control textarea-small-disabled']) !!}
      @endif
  </div>
  <div class="form-group col-sm-12">
      {!! Form::label('user_comment', $dictionary->translate('Conforme')) !!}?
      @if ($viewControlls->isEmpleado)
        Si {!! Form::radio('user_agree', '1', true); !!}
        No {!! Form::radio('user_agree', '0', false); !!}
      @else
        Si {!! Form::radio('user_agree', '1', true,['disabled']); !!}
        No {!! Form::radio('user_agree', '0', false, ['disabled']); !!}
      @endif
  </div>
  <div class="form-group col-sm-12">
      {!! Form::label('user_final_score', $dictionary->translate('Puntuación final evaluado')) !!}
      @if ($viewControlls->isEmpleado)
        {!! Form::text('user_final_score', null, ['class' => 'form-control']) !!}
      @else
        {!! Form::text('user_final_score', null, ['class' => 'form-control', 'disabled']) !!}
      @endif
  </div>
</div>
<div class="col-md-6">
  <h4>{!! $dictionary->translate('Promedio Manager') !!}: {!! $avgEvaluator!!}</h4>
  <div class="form-group col-sm-12">
      {!! Form::label('evaluator_comment', $dictionary->translate('Comentarios Manager')) !!}
      @if ($viewControlls->isEmpleado)
        {!! Form::textarea('evaluator_comment', null, ['class' => 'form-control textarea-small-disabled']) !!}
      @else
        {!! Form::textarea('evaluator_comment', null, ['class' => 'form-control textarea-small']) !!}
      @endif

  </div>
  <div class="form-group col-sm-12">
      {!! Form::label('evaluator_final_score', $dictionary->translate('Puntuación final manager')) !!}
      @if ($viewControlls->isEmpleado)
        {!! Form::text('evaluator_final_score', null, ['class' => 'form-control', 'disabled']) !!}
      @else
        {!! Form::text('evaluator_final_score', null, ['class' => 'form-control']) !!}
      @endif
  </div>
</div>


<!-- Submit Field -->
<div class="form-group col-sm-12">
    {!! Form::submit($dictionary->translate('Guardar'), ['class' => 'btn btn-primary']) !!}
    <a href="{!! route('frontend.home') !!}" class="btn btn-default">{!! $dictionary->translate('Cancelar') !!}</a>
</div>
