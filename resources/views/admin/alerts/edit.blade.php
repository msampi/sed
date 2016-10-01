@extends('layouts.app')

@section('content')
   <section class="content-header">
           <h1>
               {!! $dictionary->translate('Editar Alerta') !!}
           </h1>
   </section>
   <div class="content">
       @include('adminlte-templates::common.errors')
       <div class="box box-primary">

           <div class="box-body">
               <div class="row">
                   {!! Form::model($alert, ['route' => ['admin.alerts.update', $alert->id], 'method' => 'patch']) !!}

                    @include('admin.alerts.fields')

                   {!! Form::close() !!}
               </div>
           </div>
       </div>
   </div>
@endsection
