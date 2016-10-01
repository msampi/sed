@extends('layouts.frontend')

@section('content')

@include('frontend.template-parts.content-header')
    
    <div class="content">
        <div class="clearfix"></div>

        <div class="clearfix"></div>
        <div class="box box-primary">
            <div class="box-body">
                <table class="table table-responsive search-table" id="documents-table">
                  <thead>
                      <th>{!! $dictionary->translate('Nombre') !!}</th>
                  </thead>
                  <tbody>
                  @foreach($documents as $document)
                      <tr>
                          <td><a href="{!! URL::to('/'); !!}/uploads/{!! $document->name !!}" target="_blank">{!! $document->name !!}</a></td>
                      </tr>
                  @endforeach
                  </tbody>
              </table>
            </div>
        </div>
    </div>
@endsection
