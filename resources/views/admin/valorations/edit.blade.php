@extends('layouts.app')

@section('content')
   <section class="content-header">
           <h1>
               {!! $dictionary->translate('Editar Valoración') !!}
           </h1>
   </section>
   <div class="content">
       @include('adminlte-templates::common.errors')
       <div class="box box-primary">

           <div class="box-body">
               <div class="row">
                   {!! Form::model($valoration, ['route' => ['admin.valorations.update', $valoration->id], 'method' => 'patch']) !!}

                    @include('admin.valorations.fields')

                   {!! Form::close() !!}
               </div>
           </div>
       </div>
   </div>
@endsection