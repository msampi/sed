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
            <tr class="pdp-improvement" data-id="{!! $pi->id  !!}" data-uid="{!! $user->id !!}">
              <td><textarea class="form-control"  data-field='objective' @if (!$is_logged_user) disabled @endif>{!! $pi->objectives !!}</textarea></td>
              <td><textarea class="form-control"  data-field='meta' @if (!$is_logged_user) disabled @endif>{!! $pi->meta !!}</textarea></td>
              <td><textarea class="form-control"  data-field='action' @if (!$is_logged_user) disabled @endif>{!! $pi->dev_action !!}</textarea></td>
              <td><textarea class="form-control"  data-field='resource' @if (!$is_logged_user) disabled @endif>{!! $pi->resources !!}</textarea></td>
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
          {{-- */ $comment = $plan_comments->getComment($user->id, 'half-year', 'user', 1) /* --}}
          <td><textarea placeholder="{!! $dictionary->translate('Comentarios empleado') !!}" data-id="{!! $comment->id !!}" data-entry="user"  data-stage="half-year" data-uid="{!! $user->id !!}" data-eid="" class="form-control comment" @if (!$is_logged_user) disabled @endif>{!! $comment->comment !!}</textarea>
          </td>
          {{-- */ $comment = $plan_comments->getComment($user->id, 'end-year', 'user', 1) /* --}}
          <td><textarea placeholder="{!! $dictionary->translate('Comentarios empleado') !!}" data-id="{!! $comment->id !!}" data-entry="user"  data-stage="end-year" data-uid="{!! $user->id !!}" data-eid="" class="form-control comment" @if (!$is_logged_user) disabled @endif>{!! $comment->comment !!}</textarea>
          </td>
        </tr>
        <tr>
          {{-- */ $comment = $plan_comments->getComment($user->id, 'half-year', 'evaluator', 1) /* --}}
          <td><textarea placeholder="{!! $dictionary->translate('Comentarios manager') !!}" data-id="{!! $comment->id !!}" data-entry="evaluator"  data-stage="half-year" data-uid="{!! $user->id !!}" data-eid="{!! Auth::user()->id !!}" class="form-control comment" @if ($is_logged_user) disabled @endif>{!! $comment->comment !!}</textarea>
          </td>
          {{-- */ $comment = $plan_comments->getComment($user->id, 'end-year', 'evaluator', 1) /* --}}
          <td><textarea placeholder="{!! $dictionary->translate('Comentarios manager') !!}" data-id="{!! $comment->id !!}" data-entry="evaluator"  data-stage="end-year" data-uid="{!! $user->id !!}" data-eid="{!! Auth::user()->id !!}" class="form-control comment" @if ($is_logged_user) disabled @endif>{!! $comment->comment !!}</textarea></td>
        </tr>
      </tbody>
  </table>
</div>
<div class="col-lg-12">
  <table class="table table-bordered objective-table">
      <thead>
        <th width="30%">{!! $dictionary->translate('Areas de mejora (Primer Semestre)') !!}</th>
        <th colspan="2">{!! $dictionary->translate('Acciones de desarrollo (Primer Semestre)') !!}</th>
      </thead>
      <tbody id="add-action-half">
        <tr>
          <td>
            <select id="half_areas_selector" class="form-control pdp-selector" data-child="pdp-selector-1">
                @foreach ($plans as $plan)
                  <option value="{!! $plan->id !!}">{!! $plan->getAttributeTranslate($plan->name) !!}</option>
                @endforeach
            </select>
          </td>
          <td colspan="2">
            <select class="form-control" id="pdp-selector-1">
              @if (isset($plans[0]))
                @foreach ($plans[0]->actions as $action)
                  <option>{!! $action->getAttributeTranslate($action->description) !!}</option>
                @endforeach
              @endif
            </select>
          </td>
        </tr>

      </tbody>
  </table>
</div>
<div class="col-lg-12 buttons-pad">
    <a class="btn btn-success" onclick="appendPDPArea('half_areas_selector','add-action-half')"><i class="fa fa-plus"></i> {!! $dictionary->translate('Agregar Mejora') !!}</a>
</div>
<div class="col-lg-12">
  <table class="table table-bordered objective-table">
      <thead>
        <th>{!! $dictionary->translate('Comentarios (Primer Semestre)') !!}</th>
      </thead>
      <tbody>
        <tr>
          <td>
            {{-- */ $comment = $plan_comments->getComment($user->id, 'half-year', 'user', 2) /* --}}
            <textarea data-id="{!! $comment->id !!}" data-entry="user"  data-stage="half-year" data-eid="" data-uid="{!! $user->id !!}" class="form-control comment" placeholder="{!! $dictionary->translate('Comentarios empleado') !!}" @if (!$is_logged_user) disabled @endif>{!! $comment->comment !!}</textarea><br>
            {{-- */ $comment = $plan_comments->getComment($user->id, 'half-year', 'evaluator', 2) /* --}}
            <textarea data-id="{!! $comment->id !!}" data-entry="evaluator"  data-stage="half-year" data-eid="{!! Auth::user()->id !!}" data-uid="{!! $user->id !!}" class="form-control comment" placeholder="{!! $dictionary->translate('Comentarios manager') !!}" @if ($is_logged_user) disabled @endif>{!! $comment->comment !!}</textarea>
          </td>

        </tr>
      </tbody>
  </table>
</div>
<div class="col-lg-12">
  <table class="table table-bordered objective-table">
      <thead>
        <th width="30%">{!! $dictionary->translate('Areas de mejora (Segundo Semestre)') !!}</th>
        <th colspan="2">{!! $dictionary->translate('Acciones de desarrollo (Segundo Semestre)') !!}</th>
      </thead>
      <tbody id="add-action-end">
       <tr>
          <td>
            <select id="end_areas_selector" class="form-control pdp-selector" data-child="pdp-selector-2">
                @foreach ($plans as $plan)
                  <option value="{!! $plan->id !!}">{!! $plan->getAttributeTranslate($plan->name) !!}</option>
                @endforeach
            </select>
          </td>
          <td colspan="2">
            <select class="form-control" id="pdp-selector-2">
                @if (isset($plans[0]))
                  @foreach ($plans[0]->actions as $action)
                    <option>{!! $action->getAttributeTranslate($action->description) !!}</option>
                  @endforeach
                @endif
            </select>
          </td>
        </tr>
      </tbody>
  </table>
</div>
<div class="col-lg-12 buttons-pad">
    <a class="btn btn-success" onclick="appendPDPArea('end_areas_selector','add-action-end')"><i class="fa fa-plus"></i> {!! $dictionary->translate('Agregar Mejora') !!}</a>
</div>
<div class="col-lg-12">
  <table class="table table-bordered objective-table">
      <thead>
        <th>{!! $dictionary->translate('comentarios (Segundo Semestre)') !!}</th>
      </thead>
      <tbody>
        <tr>
          <td>
            {{-- */ $comment = $plan_comments->getComment($user->id, 'end-year', 'user', 2) /* --}}
            <textarea data-id="{!! $comment->id !!}" data-uid="{!! $user->id !!}" data-entry="user"  data-stage="end-year" data-eid="" class="form-control comment" placeholder="{!! $dictionary->translate('Comentarios empleado') !!}" @if (!$is_logged_user) disabled @endif>{!! $comment->comment !!}</textarea><br>
            {{-- */ $comment = $plan_comments->getComment($user->id, 'end-year', 'evaluator', 2) /* --}}
            <textarea data-id="{!! $comment->id !!}" data-uid="{!! $user->id !!}" data-entry="evaluator"  data-stage="end-year" data-eid="" class="form-control comment" placeholder="{!! $dictionary->translate('Comentarios manager') !!}" @if ($is_logged_user) disabled @endif>{!! $comment->comment !!}</textarea>
          </td>

        </tr>
      </tbody>
  </table>
</div>
<div class="col-lg-12 buttons-pad">
    <button class="btn btn-success" onclick="pdpSave(true)"><i class="fa fa-save"></i> {!! $dictionary->translate('Guardar') !!}</button>
    
</div>

{!! Form::close() !!}

<script type="text/javascript">
var options = {
        uid: "{!! $user->id !!}",
    };
$(function(){

    // Guardado automatico

        setInterval(function() {
            pdpSave();
        }, 10000);


});

</script>


@endsection
