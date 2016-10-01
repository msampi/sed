<table class="table table-bordered table-striped search-table" id="translations-table">
    <thead>
        @foreach ($languages as $language)
        <th>{!! $language->name !!}</th>
        @endforeach
        <th width="10%">{!! $dictionary->translate('Acción') !!}</th>
    </thead>
    <tbody>
    @foreach($translations as $translation)
        <tr>
            @foreach ($languages as $language)
            <td>{!! $translation->getWordByLanguage($language->id) !!}</td>
            @endforeach
            <td>
                {!! Form::open(['route' => ['admin.translations.destroy', $translation->id], 'method' => 'delete']) !!}
                <div class='btn-group'>
                    <a href="{!! route('admin.translations.edit', [$translation->id]) !!}" class='btn btn-default btn-sm'><i class="glyphicon glyphicon-edit"></i></a>
                    {!! Form::button('<i class="glyphicon glyphicon-trash"></i>', ['type' => 'submit', 'class' => 'btn btn-danger btn-sm', 'onclick' => "return confirm('Are you sure?')"]) !!}
                </div>
                {!! Form::close() !!}
            </td>
        </tr>
    @endforeach
    </tbody>
</table>