<!-- Name Field -->
<div class="form-group col-sm-6">
    {!! Form::label('name', $dictionary->translate('Nombre') .':') !!}
    {!! Form::text('name', null, ['class' => 'form-control']) !!}
</div>

<!-- Prefix Field -->
<div class="form-group col-sm-6">
    {!! Form::label('prefix', $dictionary->translate('Prefijo') .':') !!}
    {!! Form::text('prefix', null, ['class' => 'form-control']) !!}
</div>

<!-- Submit Field -->
<div class="form-group col-sm-12">
    {!! Form::submit($dictionary->translate('Guardar'), ['class' => 'btn btn-primary']) !!}
    <a href="{!! route('languages.index') !!}" class="btn btn-default">{!! $dictionary->translate('Cancelar') !!}</a>
</div>
