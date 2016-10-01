<!-- Words Field -->

@foreach ($languages as $language)
<div class="form-group col-sm-6">
    {!! Form::label('words['.$language->id.']', $language->name.':') !!}
    {!! Form::text('words['.$language->id.']', null, ['class' => 'form-control']) !!}
</div>
@endforeach
<!-- Submit Field -->
<div class="form-group col-sm-12">
    {!! Form::submit($dictionary->translate('Guardar'), ['class' => 'btn btn-primary']) !!}
    <a href="{!! route('translations.index') !!}" class="btn btn-default">{!! $dictionary->translate('Cancelar') !!}</a>
</div>
