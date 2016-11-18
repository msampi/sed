<table class="table table-bordered table-striped search-table" id="alerts-table">
    <thead>
        <th>{!! $dictionary->translate('Descripción') !!}</th>
        <th>{!! $dictionary->translate('Evaluación') !!}</th>
        <th width="10%">{!! $dictionary->translate('Acción') !!}</th>
    </thead>
    <tbody>
    @foreach($alerts as $alert)
        <tr>
            <td>{!! $alert->getDescription() !!}</td>
            <td>@if ($alert->evaluation) {!! $alert->evaluation->name !!} @endif</td>
            <td>
                {!! Form::open(['route' => ['admin.alerts.destroy', $alert->id], 'method' => 'delete']) !!}

                    <a href="{!! route('admin.alerts.edit', [$alert->id]) !!}" class='btn btn-default btn-sm'><i class="glyphicon glyphicon-edit"></i></a>
                    {{-- */ $confirm = $dictionary->translate('Esta seguro de eliminar esta alerta?') /* --}}
                    {!! Form::button('<i class="glyphicon glyphicon-trash"></i>', ['type' => 'submit', 'class' => 'btn btn-danger btn-sm', 'onclick' => "return confirm('$confirm')"]) !!}


                {!! Form::close() !!}
            </td>
        </tr>
    @endforeach
    </tbody>
</table>
