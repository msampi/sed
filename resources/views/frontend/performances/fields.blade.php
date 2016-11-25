<input type="hidden" name="user_id" value="{!! $viewControlls->userId !!}">
<input type="hidden" name="evaluation_id" value="{!! $viewControlls->evaluationId  !!}">
<input type="hidden" name="evaluator_id" value="{!! $viewControlls->evaluatorId !!}">
<div class="col-md-6">
  <h4>{!! $dictionary->translate('Promedio Evaluado') !!}: {!! $avgUser!!} </h4>
  <div class="form-group col-sm-12">
      {!! Form::label('user_comment', $dictionary->translate('Comentarios Evaluado')) !!}
      @if ($viewControlls->isEmpleado && $viewControlls->is_stage_three)
        {!! Form::textarea('user_comment', null, ['class' => 'form-control textarea-small']) !!}
      @else
        {!! Form::textarea('user_comment', null, ['class' => 'form-control textarea-small-disabled']) !!}
      @endif
  </div>
  <div class="form-group col-sm-12">
      {!! Form::label('user_comment', $dictionary->translate('Conforme')) !!}?
      @if ($viewControlls->isEmpleado && $viewControlls->is_stage_three)
        Si {!! Form::radio('user_agree', '1', true); !!}
        No {!! Form::radio('user_agree', '0', false); !!}
      @else
        Si {!! Form::radio('user_agree', '1', true,['disabled']); !!}
        No {!! Form::radio('user_agree', '0', false, ['disabled']); !!}
      @endif
  </div>
  <div class="form-group col-sm-7">
      {!! Form::label('user_result', $dictionary->translate('Resultado de desempeño evaluado')) !!}
      @if ($viewControlls->isEmpleado && $viewControlls->is_stage_three)
        {!! Form::text('user_result', null, ['class' => 'form-control']) !!}
      @else
        {!! Form::text('user_result', null, ['class' => 'form-control', 'disabled']) !!}
      @endif
  </div>
  <div class="form-group col-sm-5">
      {!! Form::label('final_score', $dictionary->translate('Puntuación final')) !!}
      @if ($viewControlls->isEmpleado && $viewControlls->is_stage_three)
        {!! Form::text('final_score', null, ['class' => 'form-control']) !!}
      @else
        {!! Form::text('final_score', null, ['class' => 'form-control', 'disabled']) !!}
      @endif
  </div>
</div>
<div class="col-md-6">
  <h4>{!! $dictionary->translate('Promedio Manager') !!}: {!! $avgEvaluator!!}</h4>
  <div class="form-group col-sm-12">
      {!! Form::label('evaluator_comment', $dictionary->translate('Comentarios Manager')) !!}
      @if (!$viewControlls->isEmpleado && $viewControlls->is_stage_three)
        {!! Form::textarea('evaluator_comment', null, ['class' => 'form-control textarea-small']) !!}
      @else
        {!! Form::textarea('evaluator_comment', null, ['class' => 'form-control textarea-small-disabled']) !!}
        
      @endif

  </div>
  <div class="form-group col-sm-12">
      {!! Form::label('evaluator_result', $dictionary->translate('Resultado de desempeño manager')) !!}
      @if (!$viewControlls->isEmpleado && $viewControlls->is_stage_three)
        {!! Form::text('evaluator_result', null, ['class' => 'form-control']) !!}
      @else
        {!! Form::text('evaluator_result', null, ['class' => 'form-control', 'disabled']) !!}
      @endif
  </div>
</div>


<!-- Submit Field -->
@if ($viewControlls->is_stage_three)
<div class="form-group col-sm-12">
    {!! Form::submit($dictionary->translate('Guardar'), ['class' => 'btn btn-primary']) !!}
    <a href="{!! route('frontend.home') !!}" class="btn btn-default">{!! $dictionary->translate('Cancelar') !!}</a>
</div>
@endif