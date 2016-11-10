<table class="table table-bordered table-striped search-table" id="evaluations-table">
    <thead>
        <th></th>
        <th>{!! $dictionary->translate('Nombre Usuario') !!}</th>
        <th>{!! $dictionary->translate('Email Usuario') !!}</th>
        <th>{!! $dictionary->translate('Puesto Usuario') !!}</th>
        <th>{!! $dictionary->translate('Categoria Usuario') !!}</th>
        <th>{!! $dictionary->translate('Nombre Evaluador') !!}</th>
        <th>{!! $dictionary->translate('Email Evaluador') !!}</th>
        <th width="10%">{!! $dictionary->translate('Acción') !!}</th>
    </thead>
    <tbody>
    @foreach($evaluation_users as $evaluation)
        <tr>
            <td><input type="checkbox" name="user[]" value="{!! $evaluation->user->id or '' !!}"></td>
            <td>{!! $evaluation->user->name or '' !!} {!! $evaluation->user->last_name or '' !!}</td>
            <td>{!! $evaluation->user->email or '' !!}</td>
            <td>@if ($evaluation->post) {!! $evaluation->post->getName() !!} @endif</td>
            <td>{!! $evaluation->category !!}</td>
            <td>{!! $evaluation->evaluator['name'] !!} {!! $evaluation->evaluator['last_name'] !!}</td>
            <td>{!! $evaluation->evaluator['email'] !!}</td>

            <td>
                {!! Form::open(['route' => ['admin.evaluationUserEvaluators.destroy', $evaluation->id], 'method' => 'delete']) !!}
                 <a href="{!! route('admin.evaluationUserEvaluators.edit', [$evaluation->id]) !!}" class='btn btn-default btn-sm' data-toggle="tooltip" data-placement="top" title="Editar / Administrar"><i class="glyphicon glyphicon-edit"></i></a>
                {{-- */ $confirm = $dictionary->translate('Esta seguro de eliminar este usuario?') /* --}}
                {!! Form::button('<i class="glyphicon glyphicon-trash"></i>', ['type' => 'submit', 'class' => 'btn btn-danger btn-sm', 'onclick' => "return confirm('$confirm')"]) !!}

                {!! Form::close() !!}
            </td>
        </tr>
    @endforeach
    </tbody>
</table>

<br />

{!! Form::open(['route' => ['admin.evaluationUserEvaluators.send'], 'method' => 'post', 'id' => "send"]) !!}
    <div class="col-xs-3">
        <select name="mensaje" class="form-control">
            @foreach($mensajes as $item)
                <option value="{{$item->id}}">{{$item->subject[1]}}</option>
            @endforeach
        </select>
    </div>
    <div class="col-xs-3">
        <input type="button" id="sub" class="btn btn-primary" value="Enviar a usuarios seleccionados">
    </div>
    <div class="col-xs-12">
        <input type="checkbox" name="clave" value="true">Enviar reseteo de clave.
    </div>
    <input type="hidden" name="users" id="users" value="">
{!! Form::close() !!}

<script type="text/javascript">
    $(document).ready(function(){

        $("#sub").click(function(event){
            event.preventDefault();
            var searchIDs = $("#evaluations-table input:checkbox:checked").map(function(){
              return $(this).val();
            }).get(); 
            $('#users').val( searchIDs );
            $('#send').submit();
        });

    })
</script>