<!-- Objectives Field -->
<div class="form-group col-sm-6">
    {!! Form::label('objectives', 'Objectives:') !!}
    {!! Form::text('objectives', null, ['class' => 'form-control']) !!}
</div>

<!-- Comment Field -->
<div class="form-group col-sm-6">
    {!! Form::label('comment', 'Comment:') !!}
    {!! Form::text('comment', null, ['class' => 'form-control']) !!}
</div>

<!-- Competition Field -->
<div class="form-group col-sm-6">
    {!! Form::label('competition', 'Competition:') !!}
    {!! Form::text('competition', null, ['class' => 'form-control']) !!}
</div>

<!-- Valoration Field -->
<div class="form-group col-sm-6">
    {!! Form::label('valoration', 'Valoration:') !!}
    {!! Form::text('valoration', null, ['class' => 'form-control']) !!}
</div>

<!-- Final Field -->
<div class="form-group col-sm-6">
    {!! Form::label('final', 'Final:') !!}
    {!! Form::text('final', null, ['class' => 'form-control']) !!}
</div>

<!-- Submit Field -->
<div class="form-group col-sm-12">
    {!! Form::submit('Save', ['class' => 'btn btn-primary']) !!}
    <a href="{!! route('performances.index') !!}" class="btn btn-default">Cancel</a>
</div>
