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
            @if($visualization_st1)
              <div class="btn-sm btn-success margin-top-3" >
                {!! $dictionary->translate('Prom. Evaluador') !!}:
                <span id="average-comp-evaluator-half"></span>
              </div>
            @endif
          </td>
          <td class="gray-cell">
            <div class="btn-sm btn-success">
              {!! $dictionary->translate('Prom. Usuario') !!}:
              <span id="average-comp-user-full"></span>

            </div>
            @if($visualization_st2)
              <div class="btn-sm btn-success margin-top-3" >
                {!! $dictionary->translate('Prom. Evaluador') !!}:
                <span id="average-comp-evaluator-full"></span>
              </div>
            @endif
          </td>

        </tr>

        @foreach ($competition->behaviours as $behaviour)
        <tr>
          <td class="gray-cell" colspan="2"><blockquote>{!! $behaviour->getAttributeTranslate($behaviour->description) !!}</blockquote></td>
          <td>
            {{-- */ $bhrating = $behaviour->getBehaviourRating('half-year','user', $user->id) /* --}}

            <select data-id="" data-entry="user" data-uid="{!! $user->id !!}"  data-eid="" data-stage="half-year" data-bid="{!! $behaviour->id !!}" class="form-control bh-selector sel-us-half" @if (!$is_logged_user || !$is_stage_two) disabled @endif>
                @foreach( $rating->values as $value)
                    <option value="{!! $value->value !!}" @if ($bhrating->rating == $value->value) selected="selected" @endif>{!! $value->getAttributeTranslate($value->name) !!}</option>
                @endforeach
            </select>
            {{-- */ $bhrating = $behaviour->getBehaviourRating('half-year','evaluator', $user->id) /* --}}
            @if($visualization_st1)
            <select data-id="" data-entry="evaluator" data-uid="{!! $user->id !!}" data-eid="{!! Auth::user()->id !!}" data-stage="half-year" data-bid="{!! $behaviour->id !!}" class="form-control  bh-selector sel-ev-half margin-top-3" @if ($is_logged_user || !$is_stage_two) disabled @endif>
                @foreach( $rating->values as $value)
                    <option value="{!! $value->value !!}" @if ($bhrating->rating == $value->value) selected="selected" @endif>{!! $value->getAttributeTranslate($value->name) !!}</option>
                @endforeach
            </select>
            @endif
          </td>
          <td>
            {{-- */ $bhrating = $behaviour->getBehaviourRating('end-year','user', $user->id) /* --}}
            <select data-id="" data-entry="user" data-uid="{!! $user->id !!}" data-eid="" data-stage="end-year" data-bid="{!! $behaviour->id !!}" class="form-control bh-selector sel-us-full" @if (!$is_logged_user || !$is_stage_three) disabled @endif>
                @foreach( $rating->values as $value)
                    <option value="{!! $value->value !!}" @if ($bhrating->rating == $value->value)) selected="selected" @endif>{!! $value->getAttributeTranslate($value->name) !!}</option>
                @endforeach
            </select>
            {{-- */ $bhrating = $behaviour->getBehaviourRating('end-year','evaluator', $user->id) /* --}}
            @if($visualization_st2)
            <select data-id="" data-entry="evaluator" data-uid="{!! $user->id !!}" data-eid="{!! Auth::user()->id !!}" data-stage="end-year" data-bid="{!! $behaviour->id !!}" class="form-control bh-selector sel-ev-full margin-top-3" @if ($is_logged_user || !$is_stage_three) disabled @endif>
                @foreach( $rating->values as $value)
                    <option value="{!! $value->value !!}" @if ($bhrating->rating == $value->value)) selected="selected" @endif>{!! $value->getAttributeTranslate($value->name) !!}</option>
                @endforeach
            </select>
            @endif
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
            <td><textarea placeholder="Comentarios Evaluado" data-id="{!! $comment->id !!}" data-entry="user" data-cid="{!! $competition->id!!}" data-stage="half-year" data-uid="{!! $user->id !!}" data-eid="" class="form-control" @if (!$is_logged_user || !$is_stage_two) disabled @endif>{!! $comment->comment !!}</textarea></td>
            {{-- */ $comment = $competition->getComment('end-year','user', $user->id) /* --}}
            <td><textarea placeholder="Comentarios Evaluado" data-id="{!! $comment->id !!}" data-entry="user" data-cid="{!! $competition->id!!}" data-stage="end-year" data-uid="{!! $user->id !!}" data-eid="" class="form-control" @if (!$is_logged_user || !$is_stage_three) disabled @endif>{!! $comment->comment !!}</textarea></td>
          </tr>
          <tr>
            {{-- */ $comment = $competition->getComment('half-year','evaluator', $user->id) /* --}}
            <td>
              @if($visualization_st1)
              <textarea placeholder="Comentarios Manager" data-entry="evaluator" data-id="{!! $comment->id !!}" data-cid="{!! $competition->id!!}" data-stage="half-year" data-uid="{!! $user->id !!}" data-eid="{!! Auth::user()->id !!}" class="form-control" @if ($is_logged_user || !$is_stage_two) disabled @endif>{!! $comment->comment !!}</textarea>
              @endif
              </td>
            {{-- */ $comment = $competition->getComment('end-year','evaluator', $user->id) /* --}}
            <td>
              @if($visualization_st2)
              <textarea placeholder="Comentarios Manager" data-entry="evaluator" data-id="{!! $comment->id !!}" data-cid="{!! $competition->id!!}" data-stage="end-year" data-uid="{!! $user->id !!}" data-eid="{!! Auth::user()->id !!}" class="form-control" @if ($is_logged_user || !$is_stage_three) disabled @endif>{!! $comment->comment !!}</textarea>
              @endif
              </td>
          </tr>
        </tbody>
    </table>
    @endforeach

    {!! Form::close() !!}
</div>
<div class="col-lg-12 buttons-pad">
    @if ($is_logged_user)
        @if ($status == 2)
            <button class="btn btn-warning" onclick="competitionsSave(true,1);"> {!! $dictionary->translate('Volver a estado iniciado') !!}</button>
        @else
            <button class="btn btn-danger " onclick="competitionsSave(true,2);"> {!! $dictionary->translate('Haga clic aquí para cambiar de estado Iniciado a Finalizado') !!}</button>
        @endif
      @endif
      <br><br>
      <button class="btn btn-success" onclick="competitionsSave(true)"><i class="fa fa-save"></i> {!! $dictionary->translate('Guardar') !!}</button>
</div>
<script type="text/javascript">

  $(function(){

        // Guardado automatico objetivos

            setInterval(function() {
                competitionsSave();
            }, 2000);
    });
</script>
@endif
@endsection
