<!-- Name Field -->
<input type="hidden" name="evaluation_id" value="{!! $evaluation_id !!}">
<input type="hidden" name="client_id" value="{!! $client_id !!}">
<div class="form-group col-sm-12 multilang-group">
    
    {!! Form::label('name', $dictionary->translate('Nombre').': ') !!}
	@foreach ($languages as $language)
	    
	    {!! Form::text('name['.$language->id.']', null, ['class' => 'form-control multilang', 'data-lang' => $language->name]) !!}
	
	@endforeach
</div>

<!-- Submit Field -->
<div class="form-group col-sm-12">
    {!! Form::submit($dictionary->translate('Guardar'), ['class' => 'btn btn-primary']) !!}
    <a href="{!! route('admin.posts.index', 'search='.$evaluation_id) !!}" class="btn btn-default">{!! $dictionary->translate('Cancelar') !!}</a>
</div>
