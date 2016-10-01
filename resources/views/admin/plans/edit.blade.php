@extends('layouts.app')

@section('content')
    <section class="content-header">
        <h1>
            {!! $dictionary->translate('Editar PDP') !!}
        </h1>
   </section>
   <div class="content">
       @include('adminlte-templates::common.errors')
       <div class="box box-primary">
           <div class="box-body">
               <div class="row">
                   {!! Form::model($plan, ['route' => ['admin.plans.update', $plan->id], 'method' => 'patch']) !!}

                        @include('admin.plans.fields')

                   {!! Form::close() !!}
               </div>
           </div>
       </div>
   </div>
@endsection