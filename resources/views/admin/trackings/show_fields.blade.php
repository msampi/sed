<!-- Id Field -->
<div class="form-group">
    {!! Form::label('id', 'Id:') !!}
    <p>{!! $tracking->id !!}</p>
</div>

<!-- Browser Field -->
<div class="form-group">
    {!! Form::label('browser', 'Browser:') !!}
    <p>{!! $tracking->browser !!}</p>
</div>

<!-- Created At Field -->
<div class="form-group">
    {!! Form::label('created_at', 'Created At:') !!}
    <p>{!! $tracking->created_at !!}</p>
</div>

<!-- Updated At Field -->
<div class="form-group">
    {!! Form::label('updated_at', 'Updated At:') !!}
    <p>{!! $tracking->updated_at !!}</p>
</div>

