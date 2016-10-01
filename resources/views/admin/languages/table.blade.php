<table class="table table-bordered table-striped " id="languages-table">
    <thead>
        <th>{{$dictionary->translate('Nombre')}}</th>
        <th>{{$dictionary->translate('Prefijo')}}</th>
        <th width="10%">{{$dictionary->translate('Acción')}}</th>
    </thead>
    <tbody>
    @foreach($languages as $language)
        <tr>
            <td>{!! $language->name !!}</td>
            <td>{!! $language->prefix !!}</td>
            <td>
                {!! Form::open(['route' => ['admin.languages.destroy', $language->id], 'method' => 'delete']) !!}     
                    <a href="{!! route('admin.languages.edit', [$language->id]) !!}" class='btn btn-default btn-sm'><i class="glyphicon glyphicon-edit"></i></a>
                    {!! Form::button('<i class="glyphicon glyphicon-trash"></i>', ['type' => 'submit', 'class' => 'btn btn-danger btn-sm', 'onclick' => "return confirm('Are you sure?')"]) !!}
                {!! Form::close() !!}
            </td>
        </tr>
    @endforeach
    </tbody>
</table>