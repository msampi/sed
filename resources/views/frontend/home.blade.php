@extends('layouts.frontend')

@section('content')


    <div class="col-md-12">
      <h2>{!! $evaluation->name !!}</h2>
      <p>
        {!! $evaluation->instructions !!}
      </p>

    </div>

@endsection
