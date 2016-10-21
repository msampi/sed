<div class="form-group col-sm-3">
    {!! Form::label('evaluation', $dictionary->translate('Evaluacion').':') !!}
    {!! Form::select('evaluation_id', $evaluations, null, ['class' => 'form-control']) !!}
</div>

<div class="form-group col-sm-12 multilang-group">
    {!! Form::label('description', $dictionary->translate('Descripción').':') !!}

        @foreach ($languages as $language)
            <div class="multilang" data-lang="{!! $language->name !!}">
            {!! Form::textarea('description['.$language->id.']', null, ['class' => 'form-control']) !!}
            </div>
        @endforeach
    </div>
</div>


<!-- Submit Field -->
<div class="form-group col-sm-12">
    {!! Form::submit($dictionary->translate('Guardar'), ['class' => 'btn btn-primary']) !!}
    <a href="{!! route('admin.alerts.index') !!}" class="btn btn-default">{!! $dictionary->translate('Cancelar') !!}</a>
</div>
