@extends('layouts.frontend')

@section('content')
    <section class="content-header">
        <h1>
            Performance
        </h1>
    </section>
    <div class="content">
        @include('adminlte-templates::common.errors')
        <div class="box box-primary">

            <div class="box-body">
                <div class="row">
                    {!! Form::open(['route' => 'performances.store']) !!}

                        @include('frontend.performances.fields')

                    {!! Form::close() !!}
                </div>
            </div>
        </div>
    </div>
@endsection
