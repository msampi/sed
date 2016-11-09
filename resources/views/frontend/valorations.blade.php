@extends('layouts.frontend')

@section('content')

@include('frontend.template-parts.content-header')

<div class="col-lg-12">
  {!! Form::open() !!}
  @if ($valorations->isEmpty())
    <div class="empty-message">
      <div>ESTA EVALUACION NO TIENE VALORES</div>
      <p>Contacte al administrador del sistema para resolver el problema.</p>
    </div>
  @else
  @foreach ($valorations as $valoration)
  <table class="table table-bordered objective-table">
      <thead>
        <th width="10%"><div class="btn-xs btn-danger text-center"><strong>{!! $valoration->weight !!}%</strong></div></th>
        <th>{!! $valoration->getAttributeTranslate($valoration->name) !!}</th>
        <th>{!! $dictionary->translate('Mitad de Año') !!}</th>
        <th>{!! $dictionary->translate('Fin de Año') !!}</th>
      </thead>
      <tbody>

        <tr>
          <td colspan="2" width="70%" class="gray-cell">{!! $valoration->getAttributeTranslate($valoration->description) !!}</td>
          <td>
            {{-- */ $valrating = $valoration->getValorationRating('half-year','user', $user->id) /* --}}

            <select data-id="" data-entry="user" data-uid="{!! $user->id !!}"  data-eid="" data-stage="half-year" data-bid="{!! $valoration->id !!}" class="form-control bh-selector" @if (!$is_logged_user || !$is_stage_two) disabled @endif>
                @foreach( $rating->values as $value)
                    <option @if ($valrating->rating == $value->getAttributeTranslate($value->value)) selected="selected" @endif>{!! $value->getAttributeTranslate($value->value) !!}</option>
                @endforeach
            </select>

            {{-- */ $valrating = $valoration->getValorationRating('half-year','evaluator', $user->id) /* --}}
            @if($visualization_st1)
            <select data-id="" data-entry="evaluator" data-uid="{!! $user->id !!}"  data-eid="" data-stage="half-year" data-bid="{!! $valoration->id !!}" class="form-control bh-selector margin-top-3" @if ($is_logged_user || !$is_stage_two) disabled @endif>
                @foreach( $rating->values as $value)
                    <option @if ($valrating->rating == $value->getAttributeTranslate($value->value)) selected="selected" @endif>{!! $value->getAttributeTranslate($value->value) !!}</option>
                @endforeach
            </select>
          @endif

          </td>
          <td>
            {{-- */ $valrating = $valoration->getValorationRating('end-year','user', $user->id) /* --}}

            <select data-id="" data-entry="user" data-uid="{!! $user->id !!}"  data-eid="" data-stage="end-year" data-bid="{!! $valoration->id !!}" class="form-control bh-selector" @if (!$is_logged_user || !$is_stage_three) disabled @endif>
                @foreach( $rating->values as $value)
                    <option @if ($valrating->rating == $value->getAttributeTranslate($value->value)) selected="selected" @endif>{!! $value->getAttributeTranslate($value->value) !!}</option>
                @endforeach
            </select>

            {{-- */ $valrating = $valoration->getValorationRating('end-year','evaluator', $user->id) /* --}}
            @if($visualization_st2)
            <select data-id="" data-entry="evaluator" data-uid="{!! $user->id !!}"  data-eid="" data-stage="end-year" data-bid="{!! $valoration->id !!}" class="form-control bh-selector margin-top-3" @if ($is_logged_user || !$is_stage_three) disabled @endif>
                @foreach( $rating->values as $value)
                    <option @if ($valrating->rating == $value->getAttributeTranslate($value->value)) selected="selected" @endif>{!! $value->getAttributeTranslate($value->value) !!}</option>
                @endforeach
            </select>
          @endif
          </td>
        </tr>
      </tbody>
    </table>
    <table class="table table-bordered objective-table">
        <thead>
          <th width="50%">{!! $dictionary->translate('Comentarios Mitad de Año') !!}</th>
          <th>{!! $dictionary->translate('Comentarios Fin de Año') !!}</th>
        </thead>
        <tbody>
          <tr>
            {{-- */ $comment = $valoration->getComment('half-year','user', $user->id) /* --}}
            <td><textarea placeholder="Comentarios Empleado" data-id="{!! $comment->id !!}" data-entry="user" data-cid="{!! $valoration->id!!}" data-stage="half-year" data-uid="{!! $user->id !!}" data-eid="" class="form-control" @if (!$is_logged_user || !$is_stage_two) disabled @endif>{!! $comment->comment !!}</textarea></td>
            {{-- */ $comment = $valoration->getComment('end-year','user', $user->id) /* --}}
            <td><textarea placeholder="Comentarios Empleado" data-id="{!! $comment->id !!}" data-entry="user" data-cid="{!! $valoration->id!!}" data-stage="end-year" data-uid="{!! $user->id !!}" data-eid="" class="form-control" @if (!$is_logged_user || !$is_stage_three) disabled @endif>{!! $comment->comment !!}</textarea></td>
          </tr>
          <tr>
            {{-- */ $comment = $valoration->getComment('half-year','evaluator', $user->id) /* --}}
            <td>
              @if($visualization_st1)
              <textarea placeholder="Comentarios Manager" data-entry="evaluator" data-id="{!! $comment->id !!}" data-cid="{!! $valoration->id!!}" data-stage="half-year" data-uid="{!! $user->id !!}" data-eid="{!! Auth::user()->id !!}" class="form-control" @if ($is_logged_user || !$is_stage_two) disabled @endif>{!! $comment->comment !!}</textarea>
              @endif
              </td>
            {{-- */ $comment = $valoration->getComment('end-year','evaluator', $user->id) /* --}}
            <td>
              @if($visualization_st2)
              <textarea placeholder="Comentarios Manager" data-entry="evaluator" data-id="{!! $comment->id !!}" data-cid="{!! $valoration->id!!}" data-stage="end-year" data-uid="{!! $user->id !!}" data-eid="{!! Auth::user()->id !!}" class="form-control" @if ($is_logged_user || !$is_stage_three) disabled @endif>{!! $comment->comment !!}</textarea>
              @endif
              </td>
          </tr>
        </tbody>
    </table>
    @endforeach
    {!! Form::close() !!}
</div>
<div class="col-lg-12 buttons-pad">
    <button class="btn btn-success" onclick="valorationsSave(true)"><i class="fa fa-save"></i> {!! $dictionary->translate('Guardar') !!}</button>
</div>
<script type="text/javascript">

  $(function(){

        // Guardado automatico objetivos

            setInterval(function() {
                valorationsSave();
            }, 2000);
    });
</script>
@endif
@endsection
