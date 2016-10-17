@extends('layouts.frontend')

@section('content')
    <section class="content-header">
        <h1>
            {!! $dictionary->translate('Visualización Global')!!}
        </h1>
    </section>
    <div class="content">
        <div class="box box-primary">
            <div class="box-body">
                <div class="row" style="padding-left: 20px">
                    @include('frontend.performances.show_fields')
                    <a href="{!! route('frontend.home') !!}" class="btn btn-default">{!! $dictionary->translate('Volver')!!}</a>
                </div>
            </div>
        </div>
    </div>
@endsection
