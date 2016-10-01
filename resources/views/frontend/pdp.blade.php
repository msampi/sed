@extends('layouts.frontend')

@section('content')

@include('frontend.template-parts.content-header')

<div class="col-lg-12">
  {!! Form::open() !!}

  <table class="table table-bordered objective-table">
      <thead>
        <th width="24%">{!! $dictionary->translate('Mejora en objetivos') !!}</th>
        <th width="24%">{!! $dictionary->translate('Metas') !!}</th>
        <th width="24%">{!! $dictionary->translate('Acciones de desarrollo') !!}</th>
        <th width="24%">{!! $dictionary->translate('Recursos necesarios') !!}</th>
        <th width="4%">&nbsp;</th>
      </thead>
      <tbody id="pdp-objective">
        @foreach ($plan_improvements as $pi)

            <tr>
              <td><textarea class="form-control" @if (!$is_logged_user) disabled @endif>{!! $pi->objectives !!}</textarea></td>
              <td><textarea class="form-control" @if (!$is_logged_user) disabled @endif>{!! $pi->meta !!}</textarea></td>
              <td><textarea class="form-control" @if (!$is_logged_user) disabled @endif>{!! $pi->dev_action !!}</textarea></td>
              <td><textarea class="form-control" @if (!$is_logged_user) disabled @endif>{!! $pi->resources !!}</textarea></td>
              <td><a onclick="$(this).parent().parent().remove()" class="btn btn-danger btn-sm"><i class="fa fa-trash" style="font-size:16px"></i></a></td>
            </tr>


        @endforeach
      </tbody>
  </table>
</div>
<div class="col-lg-12 buttons-pad">
    <a class="btn btn-success" onclick="appendPDPObjective()"><i class="fa fa-plus"></i> {!! $dictionary->translate('Agregar Objetivo') !!}</a>
</div>
<div class="col-lg-12 buttons-pad">
  <table class="table table-bordered objective-table">
      <thead>
        <th width="50%">{!! $dictionary->translate('Comentarios del primer semestre') !!}</th>
        <th>{!! $dictionary->translate('Comentarios del segundo semestre') !!}</th>
      </thead>
      <tbody>
        <tr>
          <td><textarea placeholder="{!! $dictionary->translate('Comentarios empleado') !!}" data-id="" data-entry="user" data-cid="" data-stage="half-year" data-uid="" data-eid="" class="form-control" @if (!$is_logged_user) disabled @endif>@if ( $comment = $plan_comments->getComment($evaluation_id, $user->id, 'half-year', 'user', 1)){!! $comment->comment !!}@endif</textarea>
          </td>

          <td><textarea placeholder="{!! $dictionary->translate('Comentarios empleado') !!}" data-id="" data-entry="user" data-cid="" data-stage="end-year" data-uid="" data-eid="" class="form-control" @if (!$is_logged_user) disabled @endif>@if ( $comment = $plan_comments->getComment($evaluation_id, $user->id, 'end-year', 'user', 1) ){!! $comment->comment !!}@endif</textarea>
          </td>
        </tr>
        <tr>
          <td><textarea placeholder="{!! $dictionary->translate('Comentarios manager') !!}" data-id="" data-entry="user" data-cid="" data-stage="half-year" data-uid="" data-eid="" class="form-control" @if ($is_logged_user) disabled @endif>@if ( $comment = $plan_comments->getComment($evaluation_id, $user->id, 'half-year', 'evaluator', 1)){!! $comment->comment !!}@endif</textarea>
          </td>

          <td><textarea placeholder="{!! $dictionary->translate('Comentarios manager') !!}" data-id="" data-entry="user" data-cid="" data-stage="end-year" data-uid="" data-eid="" class="form-control" @if ($is_logged_user) disabled @endif>@if ( $comment = $plan_comments->getComment($evaluation_id, $user->id, 'end-year', 'evaluator', 1)){!! $comment->comment !!}@endif</textarea></td>
        </tr>
      </tbody>
  </table>
</div>
<div class="col-lg-12">
  <table class="table table-bordered objective-table">
      <thead>
        <th width="30%">{!! $dictionary->translate('Areas de mejora (Primer Semestre)') !!}</th>
        <th>{!! $dictionary->translate('Acciones de desarrollo (Primer Semestre)') !!}</th>
      </thead>
      <tbody>
        <tr>
          <td>
            <select class="form-control pdp-selector" data-child="pdp-selector-1">
                @foreach ($plans as $plan)
                  <option value="{!! $plan->id !!}">{!! $plan->getAttributeTranslate($plan->name) !!}</option>
                @endforeach
            </select>
          </td>
          <td>
            <select class="form-control" id="pdp-selector-1">
               @foreach ($plans[0]->actions as $action)
                  <option>{!! $action->getAttributeTranslate($action->description) !!}</option>
                @endforeach
            </select>
          </td>
        </tr>
        <tr class='add-plan'>
          <td>
            <input type="text" name="name" class="form-control" value="" readonly>
          </td>
          <td>
            <input type="text" name="name" value="" class="form-control" readonly>
          </td>
        </tr>
      </tbody>
  </table>
</div>
<div class="col-lg-12 buttons-pad">
    <a class="btn btn-success" onclick="appendPDPArea"><i class="fa fa-plus"></i> {!! $dictionary->translate('Agregar Mejora') !!}</a>
</div>
<div class="col-lg-12">
  <table class="table table-bordered objective-table">
      <thead>
        <th>{!! $dictionary->translate('Comentarios (Primer Semestre)') !!}</th>
      </thead>
      <tbody>
        <tr>
          <td>
            <textarea class="form-control" placeholder="{!! $dictionary->translate('Comentarios empleado') !!}" @if (!$is_logged_user) disabled @endif>@if ( $comment = $plan_comments->getComment($evaluation_id, $user->id, 'half-year', 'user', 2)){!! $comment->comment !!}@endif</textarea><br>
            <textarea class="form-control" placeholder="{!! $dictionary->translate('Comentarios manager') !!}" @if ($is_logged_user) disabled @endif>@if ( $comment = $plan_comments->getComment($evaluation_id, $user->id, 'half-year', 'evaluator', 2)){!! $comment->comment !!}@endif</textarea>
          </td>

        </tr>
      </tbody>
  </table>
</div>
<div class="col-lg-12">
  <table class="table table-bordered objective-table">
      <thead>
        <th width="30%">{!! $dictionary->translate('Areas de mejora (Segundo Semestre)') !!}</th>
        <th>{!! $dictionary->translate('Acciones de desarrollo (Segundo Semestre)') !!}</th>
      </thead>
      <tbody>
       <tr>
          <td>
            <select class="form-control pdp-selector" data-child="pdp-selector-2">
                @foreach ($plans as $plan)
                  <option value="{!! $plan->id !!}">{!! $plan->getAttributeTranslate($plan->name) !!}</option>
                @endforeach
            </select>
          </td>
          <td>
            <select class="form-control" id="pdp-selector-2">
               @foreach ($plans[0]->actions as $action)
                  <option>{!! $action->getAttributeTranslate($action->description) !!}</option>
                @endforeach
            </select>
          </td>
        </tr>
      </tbody>
  </table>
</div>
<div class="col-lg-12">
  <table class="table table-bordered objective-table">
      <thead>
        <th>{!! $dictionary->translate('comentarios (Segundo Semestre)') !!}</th>
      </thead>
      <tbody>
        <tr>
          <td>
            <textarea class="form-control" placeholder="{!! $dictionary->translate('Comentarios empleado') !!}" @if (!$is_logged_user) disabled @endif>@if ( $comment = $plan_comments->getComment($evaluation_id, $user->id, 'half-year', 'user', 3)){!! $comment->comment !!}@endif</textarea><br>
            <textarea class="form-control" placeholder="{!! $dictionary->translate('Comentarios manager') !!}" @if ($is_logged_user) disabled @endif>@if ( $comment = $plan_comments->getComment($evaluation_id, $user->id, 'half-year', 'evaluator', 3)){!! $comment->comment !!}@endif</textarea>
          </td>

        </tr>
      </tbody>
  </table>
</div>

{!! Form::close() !!}


@endsection
