<!-- Name Field -->
<div class="form-group col-sm-6">
    {!! Form::label('name', 'Name:') !!}
    {!! Form::file('name') !!}
</div>
<div class="clearfix"></div>

<!-- Evaluation Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('evaluation_id', 'Evaluation Id:') !!}
    {!! Form::text('evaluation_id', null, ['class' => 'form-control']) !!}
</div>

<!-- Submit Field -->
<div class="form-group col-sm-12">
    {!! Form::submit('Save', ['class' => 'btn btn-primary']) !!}
    <a href="{!! route('documents.index') !!}" class="btn btn-default">Cancel</a>
</div>
