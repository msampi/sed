@extends('layouts.app')

@section('content')
    <section class="content-header">
      <h1>
        {!! $dictionary->translate('Sistema')  !!}<b>SED</b>
      </h1>
      <h4>
        {!! $dictionary->translate('Sistema de Evaluación de Desempeño')  !!}
      </h4>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Widgets</li>
      </ol>
    </section>
    <section class="content">
    <div class="row">
        <div class="col-lg-4 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3>{!! $userCount !!}</h3>

              <p>{!! $dictionary->translate('Usuarios')!!}</p>
            </div>
            <div class="icon">
              <i class="ion ion-person-add"></i>
            </div>
            <a href="{!! URL::asset( 'admin/users' ) !!}" class="small-box-footer">
              {!! $dictionary->translate('Ver')!!} <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-4 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3>{!! $clientCount !!}</h3>

              <p>{!! $dictionary->translate('Clientes')!!}</p>
            </div>
            <div class="icon">
              <i class="ion ion-ios-people"></i>
            </div>
            <a href="{!! URL::asset( 'admin/clients' ) !!}" class="small-box-footer">
              {!! $dictionary->translate('Ver')!!} <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-4 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3>{!! $languageCount !!}</h3>

              <p>{!! $dictionary->translate('Idiomas')!!}</p>
            </div>
            <div class="icon">
              <i class="ion ion-flag"></i>
            </div>
            <a href="{!! URL::asset( 'admin/languages' ) !!}" class="small-box-footer">
              {!! $dictionary->translate('Ver')!!} <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-4 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3>{!! $evaluationCount !!}</h3>

              <p>{!! $dictionary->translate('Evaluaciones')!!}</p>
            </div>
            <div class="icon">
              <i class="ion ion-ios-paper"></i>
            </div>
            <a href="{!! URL::asset( 'admin/evaluations' ) !!}" class="small-box-footer">
              {!! $dictionary->translate('Ver')!!}  <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
        </div>
        <!-- ./col -->
        <!-- ./col -->
        <div class="col-lg-4 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-orange">
            <div class="inner">
              <h3>{!! $evaluationCount !!}</h3>

              <p>{!! $dictionary->translate('Mensajes')!!}</p>
            </div>
            <div class="icon">
              <i class="ion ion-ios-email"></i>
            </div>
            <a href="{!! URL::asset( 'admin/messages' ) !!}" class="small-box-footer">
              {!! $dictionary->translate('Ver')!!}  <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
        </div>
        <!-- ./col -->
        <!-- ./col -->
        <div class="col-lg-4 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-gray">
            <div class="inner">
              <h3>{!! $evaluationCount !!}</h3>

              <p>{!! $dictionary->translate('Ratings')!!}</p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
            <a href="{!! URL::asset( 'admin/ratings' ) !!}" class="small-box-footer">
              {!! $dictionary->translate('Ver')!!}  <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
        </div>
        <!-- ./col -->
      </div>
      <!-- /.row -->
      </section>

@endsection
