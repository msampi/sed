<table class="table table-bordered search-table" id="plans-table">
    <thead>
        <th>{!! $dictionary->translate('Nombre') !!}</th>
        <th>{!! $dictionary->translate('Puesto') !!}</th>
        <th width="10%">Action</th>
    </thead>
    <tbody>
    @foreach($plans as $plan)
        <tr>
            <td>{!! $plan->getName() !!}</td>
            <td>@if ($plan->post) {!! $plan->post->getName() !!} @endif</td>
            <td>
                {!! Form::open(['route' => ['admin.plans.destroy', $plan->id], 'method' => 'delete']) !!}
                {{-- */ $confirm = $dictionary->translate('Esta seguro de eliminar este PDP?') /* --}}

                    <a href="{!! route('admin.plans.edit', [$plan->id]) !!}" class='btn btn-default btn-sm'><i class="glyphicon glyphicon-edit"></i></a>
                    {!! Form::button('<i class="glyphicon glyphicon-trash"></i>', ['type' => 'submit', 'class' => 'btn btn-danger btn-sm', 'onclick' => "return confirm('$confirm')"]) !!}

                {!! Form::close() !!}
            </td>
        </tr>
    @endforeach
    </tbody>
</table>
