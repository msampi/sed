<table class="table table-bordered table-striped search-table" id="objectives-table">
    <thead>
        <th>{!! $dictionary->translate('Nombre') !!}</th>
        <th>{!! $dictionary->translate('Descripción') !!}</th>
        <th>{!! $dictionary->translate('Puesto') !!}</th>
        <th width="10%">Action</th>
    </thead>
    <tbody>
    @foreach($objectives as $objective)
        <tr>
            <td>{!! $objective->getName() !!}</td>
            <td>{!! $objective->getDescription() !!}</td>
            <td>@if ($objective->post) {!! $objective->post->getName() !!} @endif</td>
            <td>
                {!! Form::open(['route' => ['admin.objectives.destroy', $objective->id], 'method' => 'delete']) !!}
                <a href="{!! route('admin.objectives.edit', [$objective->id]) !!}" class='btn btn-default btn-sm'><i class="glyphicon glyphicon-edit"></i></a>
                {{-- */ $confirm = $dictionary->translate('Esta seguro de eliminar este objetivo?') /* --}} 
                {!! Form::button('<i class="glyphicon glyphicon-trash"></i>', ['type' => 'submit', 'class' => 'btn btn-danger btn-sm', 'onclick' => "return confirm('$confirm')"]) !!}
                {!! Form::close() !!}
            </td>
        </tr>
    @endforeach
    </tbody>
</table>