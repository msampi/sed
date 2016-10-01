<input type="hidden" name="evaluation_id" value="{!! $evaluation_id !!}">
<div class="form-group col-sm-7 multilang-group">
    {!! Form::label('name', $dictionary->translate('Nombre').':') !!}
    @foreach ($languages as $language)
      
      {!! Form::text('name['.$language->id.']', null, ['class' => 'form-control multilang', 'data-lang' => $language->name]) !!}

    @endforeach
   
</div>
<div class="col-md-2">
        {!! Form::label('new_post', $dictionary->translate('Nuevo Puesto').':') !!}
        {!! Form::text('new_post', null , ['class' => 'form-control new-post']) !!}
</div> 
<div class="form-group col-sm-2">
    {!! Form::label('post', $dictionary->translate('Puesto').':') !!}
    {!! Form::select('post_id', $posts, null, ['class' => 'form-control']) !!}
</div>
<div class="form-group col-sm-1">
    {!! Form::label('weight', $dictionary->translate('Peso').':') !!}
    {!! Form::text('weight', null, ['class' => 'form-control']) !!}
</div>
<div class="form-group col-sm-12 multilang-group">
    {!! Form::label('description', $dictionary->translate('Descripción').':') !!}
    @foreach ($languages as $language)
      <div class="multilang" data-lang="{!! $language->name !!}">
       {!! Form::textarea('description['.$language->id.']', null, ['class' => 'form-control textarea']) !!}
      </div>
    @endforeach
</div>

<!-- Submit Field -->
<div class="form-group col-sm-12">
    {!! Form::submit($dictionary->translate('Guardar'), ['class' => 'btn btn-primary']) !!}
    <a href="{!! route('admin.objectives.index','search='.$evaluation_id) !!}" class="btn btn-default">{!! $dictionary->translate('Cancelar') !!}</a>
</div>
