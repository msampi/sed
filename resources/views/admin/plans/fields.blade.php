<!-- Name Field -->
<input type="hidden" name="evaluation_id" value="{!! $evaluation_id !!}">
<input type="hidden" name="remove-item-list" id="remove-item-list">
<div class="form-group col-sm-9 multilang-group">
    {!! Form::label('name', $dictionary->translate('Nombre').':') !!}
    @foreach ($languages as $language)
      
      {!! Form::text('name['.$language->id.']', null, ['class' => 'form-control multilang', 'data-lang' => $language->name]) !!}

    @endforeach
    
</div>
<div class="form-group col-sm-3">
    {!! Form::label('post', $dictionary->translate('Puesto').':') !!}
    {!! Form::select('post_id', $posts, null, ['class' => 'form-control']) !!}
</div>

<div class="form-group col-sm-12">
	<a role="button" class="btn btn-success many-list-button"><span class="glyphicon glyphicon-plus"></span> &nbsp;Agregar Acción</a>
</div>
<div class="form-group col-sm-12">
	<div class="panel panel-default many-list">
  		<div class="panel-heading">
    		<h3 class="panel-title"><i class="fa fa-th"></i> <strong>{!! $dictionary->translate('Acciones') !!}</strong></h3>
  		</div>
  		<div class="panel-body">
  			<div class="row">
	  			<div class="col-md-10">
	  				<label>{!! $dictionary->translate('Acción') !!}</label>
	  			</div>
	  			<div class="col-md-2">
	  				<label>{!! $dictionary->translate('Opciones') !!}</label>
	  			</div>
  			</div>
            @if (empty($plan->actions) || $plan->actions->isEmpty())
            	<div class="callout callout-info">
                 	<p>{!! $dictionary->translate('Este plan no tiene acciones') !!}</p>
            	</div>
            @else
	            @foreach ($plan->actions as $action)
	            <div class="row">
	            	<div class="col-md-10 multilang-group">
	            		@foreach ($languages as $language)
      
		                    <input type="text" class="form-control multilang" data-lang="{{ $language->name }}" name="values[{!! $action->id !!}][{!! $language->id !!}]" value="{{ $action->description[$language->id] or '' }}">
		                
		                @endforeach
	                    
	                </div>
	                <div class="col-md-2">
	                    <a class="btn btn-danger" onclick="removeManyListItem(this); addItemToRemove({!! $action->id !!})"><i class="glyphicon glyphicon-trash"></i> Eliminar</a>
	                </div>
	            </div>
	            @endforeach
	        @endif
            
  		</div>
	</div>
</div>

<!-- Submit Field -->
<div class="form-group col-sm-12">
    {!! Form::submit($dictionary->translate('Guardar'), ['class' => 'btn btn-primary']) !!}
    <a href="{!! route('admin.plans.index','search='.$evaluation_id) !!}" class="btn btn-default">{!! $dictionary->translate('Cancelar') !!}</a>
</div>
