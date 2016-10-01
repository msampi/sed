<table class="table table-bordered table-striped search-table" id="valorations-table">
    <thead>
        <th>{!! $dictionary->translate('Nombre') !!}</th>
        <th>{!! $dictionary->translate('Descripción') !!}</th>
        <th>{!! $dictionary->translate('Puesto') !!}</th>
        <th width="10%">{!! $dictionary->translate('Acción') !!}</th>
    </thead>
    <tbody>
    @foreach($valorations as $valoration)
        <tr>
            <td>{!! $valoration->getName() !!}</td>
            <td>{!! $valoration->getDescription() !!}</td>
            <td>@if ($valoration->post) {!! $valoration->post->getName() !!} @endif</td>
            <td>
                {!! Form::open(['route' => ['admin.valorations.destroy', $valoration->id], 'method' => 'delete']) !!}
                
                    <a href="{!! route('admin.valorations.edit', [$valoration->id]) !!}" class='btn btn-default btn-sm'><i class="glyphicon glyphicon-edit"></i></a>
                    {{-- */ $confirm = $dictionary->translate('Esta seguro de eliminar esta valoración?') /* --}} 
                    {!! Form::button('<i class="glyphicon glyphicon-trash"></i>', ['type' => 'submit', 'class' => 'btn btn-danger btn-sm', 'onclick' => "return confirm('$confirm')"]) !!}
               
                
                {!! Form::close() !!}
            </td>
        </tr>
    @endforeach
    </tbody>
</table>