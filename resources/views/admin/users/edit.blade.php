@extends('layouts.app')

@section('content')
   <section class="content-header">
           <h1>
               {!! $dictionary->translate('Editar Usuario') !!}
           </h1>
   </section>
   <div class="content">
       @include('adminlte-templates::common.errors')
       <div class="box box-primary">

           <div class="box-body">
               <div class="row">
                   {!! Form::model($user, ['route' => ['admin.users.update', $user->id], 'method' => 'patch', 'files' => true]) !!}

                    @include('admin.users.fields')

                   {!! Form::close() !!}
               </div>
           </div>
       </div>
   </div>
@endsection