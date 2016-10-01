<table class="table table-bordered table-striped search-table" id="posts-table">
    <thead>
        <th>{!! $dictionary->translate('Nombre')!!}</th>
        <th>{!! $dictionary->translate('Cliente')!!}</th>
        <th>{!! $dictionary->translate('Evaluación')!!}</th>
        <th width="10%">{!! $dictionary->translate('Acción')!!}</th>
    </thead>
    <tbody>
    @foreach($posts as $post)
        <tr>
            <td>{!! $post->getName() !!}</td>
            <td>@if ($post->client) {!! $post->client->name !!} @endif</td>
            <td>@if ($post->evaluation) {!! $post->evaluation->name !!} @endif</td>
            <td>
                {!! Form::open(['route' => ['admin.posts.destroy', $post->id], 'method' => 'delete']) !!}
                
                <a href="{!! route('admin.posts.edit', [$post->id]) !!}" class='btn btn-default btn-sm'><i class="glyphicon glyphicon-edit"></i></a>
                
                {{-- */ $confirm = $dictionary->translate('Esta seguro de eliminar este puesto?') /* --}} 
                {!! Form::button('<i class="glyphicon glyphicon-trash"></i>', ['type' => 'submit', 'class' => 'btn btn-danger btn-sm', 'onclick' => "return confirm('$confirm')"]) !!}
            
                {!! Form::close() !!}
            </td>
        </tr>
    @endforeach
    </tbody>
</table>