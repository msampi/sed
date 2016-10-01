
<table class="table table-bordered table-striped search-table" id="users-table">
    <thead>
        <th width="5%"></th>
        <th>{{$dictionary->translate('Codigo')}}</th>
        <th>{{$dictionary->translate('Nombre')}}</th>
        <th>{{$dictionary->translate('Email')}}</th>
        <th>{{$dictionary->translate('Cliente')}}</th>  
        <th>{{$dictionary->translate('Idioma')}}</th>
        <th width="10%">{{$dictionary->translate('Acción')}}</th>
    </thead>
    <tbody>
    @foreach($users as $user)
        <tr>
            <td><img src={!! URL('/uploads/'.$user->image) !!} width="50" height="50" /></td>
            <td>{!! $user->code !!}</td>
            <td>{!! $user->name !!} {!! $user->last_name !!}</td>
            <td>{!! $user->email !!}</td>
            <td>{!! $user->client->name or '' !!}</td>
            <td>{!! $user->language->name or '' !!}</td>
            
            <td>
                {!! Form::open(['route' => ['admin.users.destroy', $user->id], 'method' => 'delete']) !!}
                {{-- */ $confirm = $dictionary->translate('Esta seguro de eliminar este usuario?') /* --}} 
                <a href="{!! route('admin.users.edit', [$user->id]) !!}" class='btn btn-default btn-sm'><i class="glyphicon glyphicon-edit"></i></a>
                {!! Form::button('<i class="glyphicon glyphicon-trash"></i>', ['type' => 'submit', 'class' => 'btn btn-danger btn-sm', 'onclick' => "return confirm('$confirm')"]) !!}</td>
                {!! Form::close() !!}
            </td>
        </tr>
    @endforeach
    </tbody>
</table>
