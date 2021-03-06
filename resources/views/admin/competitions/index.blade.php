@extends('layouts.app')

@section('content')
    <section class="content-header">
        <h1 class="pull-left">{!! $dictionary->translate('Competencias de la evaluación').': '.$evaluation->name!!}</h1>
        <h1 class="pull-right">  
           <a class="btn btn-primary pull-right" style="margin-top: -10px;margin-bottom: 5px" href="{!! route('admin.competitions.create','search='.$evaluation->id) !!}">{!! $dictionary->translate('Nueva Competencia')!!}</a>
            <a class="btn btn-primary pull-right" style="margin-top: -10px;margin-bottom: 5px" href="{!! url( 'admin/evaluations/'.$evaluation->id.'/edit' ) !!}">{!! $dictionary->translate('Volver a la Evaluación')!!}</a>          
           
        </h1>
    </section>
    <div class="content">
        <div class="clearfix"></div>

        @include('flash::message')

        <div class="clearfix"></div>
        <div class="box box-primary">
            <div class="box-body">
                    @include('admin.competitions.table')
            </div>
        </div>
    </div>
@endsection

