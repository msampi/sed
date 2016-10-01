@extends('layouts.app')

@section('content')
   <section class="content-header">
           <h1>
               Value
           </h1>
   </section>
   <div class="content">
       @include('adminlte-templates::common.errors')
       <div class="box box-primary">

           <div class="box-body">
               <div class="row">
                   {!! Form::model($value, ['route' => ['values.update', $value->id], 'method' => 'patch']) !!}

                    @include('values.fields')

                   {!! Form::close() !!}
               </div>
           </div>
       </div>
   </div>
@endsection