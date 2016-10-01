<table class="table table-responsive" id="values-table">
    <thead>
        <th>Value</th>
        <th>Order</th>
        <th>Valoration Id</th>
        <th colspan="3">Action</th>
    </thead>
    <tbody>
    @foreach($values as $value)
        <tr>
            <td>{!! $value->value !!}</td>
            <td>{!! $value->order !!}</td>
            <td>{!! $value->valoration_id !!}</td>
            <td>
                {!! Form::open(['route' => ['values.destroy', $value->id], 'method' => 'delete']) !!}
                <div class='btn-group'>
                    <a href="{!! route('values.show', [$value->id]) !!}" class='btn btn-default btn-xs'><i class="glyphicon glyphicon-eye-open"></i></a>
                    <a href="{!! route('values.edit', [$value->id]) !!}" class='btn btn-default btn-xs'><i class="glyphicon glyphicon-edit"></i></a>
                    {!! Form::button('<i class="glyphicon glyphicon-trash"></i>', ['type' => 'submit', 'class' => 'btn btn-danger btn-xs', 'onclick' => "return confirm('Are you sure?')"]) !!}
                </div>
                {!! Form::close() !!}
            </td>
        </tr>
    @endforeach
    </tbody>
</table>