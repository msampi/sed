@extends('layouts.app')

@section('content')
    <section class="content-header">
        <h1>
            Tracking
        </h1>
   </section>
   <div class="content">
       @include('adminlte-templates::common.errors')
       <div class="box box-primary">
           <div class="box-body">
               <div class="row">
                   {!! Form::model($tracking, ['route' => ['trackings.update', $tracking->id], 'method' => 'patch']) !!}

                        @include('trackings.fields')

                   {!! Form::close() !!}
               </div>
           </div>
       </div>
   </div>
@endsection