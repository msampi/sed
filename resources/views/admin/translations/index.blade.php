@extends('layouts.app')

@section('content')
    <section class="content-header">
        <h1 class="pull-left">{!! $dictionary->translate('Traducciones') !!}</h1>
        <h1 class="pull-right">
           <a class="btn btn-primary pull-right" style="margin-top: -10px;margin-bottom: 5px" href="{!! route('admin.translations.create') !!}">{!! $dictionary->translate('Nueva Traducción') !!}</a>
            <a class="btn btn-primary pull-right" style="margin-top: -10px;margin-bottom: 5px; margin-right:10px" href="{!! route('languages.index') !!}">{!! $dictionary->translate('Volver a Idiomas') !!}</a>
        </h1>
    </section>
    <div class="content">
        <div class="clearfix"></div>

        @include('flash::message')

        <div class="clearfix"></div>
        <div class="box box-primary">
            <div class="box-body">
                    @include('admin.translations.table')
            </div>
        </div>
    </div>
@endsection

