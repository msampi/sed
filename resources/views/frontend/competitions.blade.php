@extends('layouts.frontend')

@section('content')

@include('frontend.template-parts.content-header')

<div class="col-lg-12">
  {!! Form::open() !!}
  @if ($competitions->isEmpty())
    <div class="empty-message">
      <div>ESTA EVALUACION NO TIENE COMPETENCIAS</div>
      <p>Contacte al administrador del sistema para resolver el problema.</p>
    </div>
  @else
  @foreach ($competitions as $competition)
  <table class="table table-bordered objective-table">
      <thead>
        <th width="10%"><div class="btn-xs btn-danger text-center"><strong>{!! $competition->weight !!}%</strong></div></th>
        <th>{!! $competition->getAttributeTranslate($competition->name) !!}</th>
        <th class="text-center">{!! $dictionary->translate('Mitad de Año') !!}</th>
        <th class="text-center">{!! $dictionary->translate('Fin de Año') !!}</th>
      </thead>
      <tbody>
        <tr>
          <td colspan="2" width="70%" class="gray-cell">{!! $competition->getAttributeTranslate($competition->description) !!}</td>
          <td class="gray-cell">
            <div class="btn-sm btn-success">
              {!! $dictionary->translate('Prom. Usuario') !!}:
              <span id="average-comp-user-half"></span>

            </div>
            <div class="btn-sm btn-success margin-top-3" >
              {!! $dictionary->translate('Prom. Evaluador') !!}:
              <span id="average-comp-evaluator-half"></span>
            </div>
          </td>
          <td class="gray-cell">
            <div class="btn-sm btn-success">
              {!! $dictionary->translate('Prom. Usuario') !!}:
              <span id="average-comp-user-full"></span>

            </div>
            <div class="btn-sm btn-success margin-top-3" >
              {!! $dictionary->translate('Prom. Evaluador') !!}:
              <span id="average-comp-evaluator-full"></span>
            </div>
          </td>

        </tr>

        @foreach ($competition->behaviours as $behaviour)
        <tr>
          <td class="gray-cell" colspan="2"><blockquote>{!! $behaviour->getAttributeTranslate($behaviour->description) !!}</blockquote></td>
          <td>
            {{-- */ $bhrating = $behaviour->getBehaviourRating('half-year','user', $user->id) /* --}}

            <select data-id="" data-entry="user" data-uid="{!! $user->id !!}"  data-eid="" data-stage="half-year" data-bid="{!! $behaviour->id !!}" class="form-control bh-selector sel-us-half" @if (!$is_logged_user) disabled @endif>
                @foreach( $rating->values as $value)
                    <option @if ($bhrating->rating == $value->getAttributeTranslate($value->value)) selected="selected" @endif>{!! $value->getAttributeTranslate($value->value) !!}</option>
                @endforeach
            </select>
            {{-- */ $bhrating = $behaviour->getBehaviourRating('half-year','evaluator', $user->id) /* --}}

            <select data-id="" data-entry="evaluator" data-uid="{!! $user->id !!}" data-eid="{!! Auth::user()->id !!}" data-stage="half-year" data-bid="{!! $behaviour->id !!}" class="form-control  bh-selector sel-ev-half margin-top-3" @if ($is_logged_user) disabled @endif>
                @foreach( $rating->values as $value)
                    <option @if ($bhrating->rating == $value->getAttributeTranslate($value->value)) selected="selected" @endif>{!! $value->getAttributeTranslate($value->value) !!}</option>
                @endforeach
            </select>
          </td>
          <td>
            {{-- */ $bhrating = $behaviour->getBehaviourRating('end-year','user', $user->id) /* --}}
            <select data-id="" data-entry="user" data-uid="{!! $user->id !!}" data-eid="" data-stage="end-year" data-bid="{!! $behaviour->id !!}" class="form-control bh-selector sel-us-full" @if (!$is_logged_user) disabled @endif>
                @foreach( $rating->values as $value)
                    <option @if ($bhrating->rating == $value->getAttributeTranslate($value->value)) selected="selected" @endif>{!! $value->getAttributeTranslate($value->value) !!}</option>
                @endforeach
            </select>
            {{-- */ $bhrating = $behaviour->getBehaviourRating('end-year','evaluator', $user->id) /* --}}
            <select data-id="" data-entry="evaluator" data-uid="{!! $user->id !!}" data-eid="{!! Auth::user()->id !!}" data-stage="end-year" data-bid="{!! $behaviour->id !!}" class="form-control bh-selector sel-ev-full margin-top-3" @if ($is_logged_user) disabled @endif>
                @foreach( $rating->values as $value)
                    <option @if ($bhrating->rating == $value->getAttributeTranslate($value->value)) selected="selected" @endif>{!! $value->getAttributeTranslate($value->value) !!}</option>
                @endforeach
            </select>
          </td>

        </tr>
        @endforeach

      </tbody>
    </table>
    <table class="table table-bordered objective-table">
        <thead>
          <th width="50%">{!! $dictionary->translate('Comentarios Mitad de Año') !!}</th>
          <th>{!! $dictionary->translate('Comentarios Fin de Año') !!}</th>
        </thead>
        <tbody>
          <tr>
            {{-- */ $comment = $competition->getComment('half-year','user', $user->id) /* --}}
            <td><textarea placeholder="Comentarios Empleado" data-id="{!! $comment->id !!}" data-entry="user" data-cid="{!! $competition->id!!}" data-stage="half-year" data-uid="{!! $user->id !!}" data-eid="" class="form-control" @if (!$is_logged_user) disabled @endif>{!! $comment->comment !!}</textarea></td>
            {{-- */ $comment = $competition->getComment('end-year','user', $user->id) /* --}}
            <td><textarea placeholder="Comentarios Empleado" data-id="{!! $comment->id !!}" data-entry="user" data-cid="{!! $competition->id!!}" data-stage="end-year" data-uid="{!! $user->id !!}" data-eid="" class="form-control" @if (!$is_logged_user) disabled @endif>{!! $comment->comment !!}</textarea></td>
          </tr>
          <tr>
            {{-- */ $comment = $competition->getComment('half-year','evaluator', $user->id) /* --}}
            <td><textarea placeholder="Comentarios Manager" data-entry="evaluator" data-id="{!! $comment->id !!}" data-cid="{!! $competition->id!!}" data-stage="half-year" data-uid="{!! $user->id !!}" data-eid="{!! Auth::user()->id !!}" class="form-control" @if ($is_logged_user) disabled @endif>{!! $comment->comment !!}</textarea></td>
            {{-- */ $comment = $competition->getComment('end-year','evaluator', $user->id) /* --}}
            <td><textarea placeholder="Comentarios Manager" data-entry="evaluator" data-id="{!! $comment->id !!}" data-cid="{!! $competition->id!!}" data-stage="end-year" data-uid="{!! $user->id !!}" data-eid="{!! Auth::user()->id !!}" class="form-control" @if ($is_logged_user) disabled @endif>{!! $comment->comment !!}</textarea></td>
          </tr>
        </tbody>
    </table>
    @endforeach

    {!! Form::close() !!}
</div>
<!--<div class="col-lg-12 buttons-pad">
    <button class="btn btn-success" onclick=""><i class="fa fa-save"></i> {!! $dictionary->translate('Guardar') !!}</button>
    <button class="btn btn-danger pull-right"><i class="fa fa-eye"></i> {!! $dictionary->translate('Status') !!}</button>
</div>-->
<script type="text/javascript">

  $(function(){

        // Guardado automatico objetivos

            setInterval(function() {
                competitionsSave();
            }, 5000);
    });
</script>
@endif
@endsection
