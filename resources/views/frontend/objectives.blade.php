@extends('layouts.frontend')

@section('content')

@include('frontend.template-parts.content-header')

<div class="col-lg-12" id="objectives-container" >
    {!! Form::open() !!}
    {{-- */ $objnum = 0 /* --}}
    @foreach ($objectives as $objective)
    <table class="table table-bordered objective-table">
        <thead>
    		<th colspan="6">@if ($objective->user_id)<a class="btn btn-xs btn-danger" onclick="removeObjective($(this).parent().parent().parent().parent(),{!! $objective->id !!}, 'Esta seguro de eliminar este objetivo?') "><i class="fa fa-trash"></i></a> @endif</th>
    	</thead>
    	<tbody>
    		<tr>
    			<td width="22%"><strong>{!! $dictionary->translate('Objetivo') !!}</strong></td>
    			<td class="rating-column weight-column font-white"><strong>{!! $dictionary->translate('Ponderacion') !!}</strong></td>
    			<td><strong>{!! $dictionary->translate('Review mitad año') !!}</strong></td>
    			<td class="rating-column"><strong>Rating</strong></td>
    			<td><strong>{!! $dictionary->translate('Review año completo') !!}</strong></td>
    			<td class="rating-column"><strong>Rating</strong></td>
    		</tr>
    		<tr>
    			<td rowspan="2"><textarea  data-select="weight-selector-{!! $objnum !!}"  data-oid="{!! $objective->id !!}" data-id="{!! $objective->id !!}" data-pid="{!! $objective->post_id !!}" data-eid="{!! $objective->evaluator_id !!}" data-uid="{!! $objective->user_id !!}" data-stage="objective"  class="form-control objective-first-textarea @if (($is_logged_user) || ((!$objective->user_id) && (!$objective->evaluator_id)))  textarea-small-disabled  @else textarea-small @endif">{!! $objective->getAttributeTranslate($objective->description) !!}</textarea></td>
    			<td rowspan="2" class="rating-column weight-column">
    				<select id="weight-selector-{!! $objnum !!}" class="form-control weight" @if (($is_logged_user) || ((!$objective->user_id) && (!$objective->evaluator_id))) disabled  @endif>
    					<option value="0" @if ($objective->weight == '0') selected @endif >0%</option>
                        <option value="0" @if ($objective->weight == '0') selected @endif>0%</option>
                        <option value="5" @if ($objective->weight == '5') selected @endif>5%</option>
                        <option value="10" @if ($objective->weight == '10') selected @endif>10%</option>
                        <option value="15" @if ($objective->weight == '15') selected @endif>15%</option>
                        <option value="20" @if ($objective->weight == '20') selected @endif>20%</option>
                        <option value="25" @if ($objective->weight == '25') selected @endif>25%</option>
                        <option value="30" @if ($objective->weight == '30') selected @endif>30%</option>
                        <option value="35" @if ($objective->weight == '35') selected @endif>35%</option>
                        <option value="40" @if ($objective->weight == '40') selected @endif>40%</option>
                        <option value="45" @if ($objective->weight == '45') selected @endif>45%</option>
                        <option value="50" @if ($objective->weight == '50') selected @endif>50%</option>
                        <option value="55" @if ($objective->weight == '55') selected @endif>55%</option>
                        <option value="60" @if ($objective->weight == '60') selected @endif>60%</option>
                        <option value="65" @if ($objective->weight == '65') selected @endif>65%</option>
                        <option value="70" @if ($objective->weight == '70') selected @endif>70%</option>
                        <option value="75" @if ($objective->weight == '75') selected @endif>75%</option>
                        <option value="80" @if ($objective->weight == '80') selected @endif>80%</option>
                        <option value="85" @if ($objective->weight == '85') selected @endif>85%</option>
                        <option value="90" @if ($objective->weight == '90') selected @endif>90%</option>
                        <option value="95" @if ($objective->weight == '95') selected @endif>95%</option>
                        <option value="100" @if ($objective->weight == '100') selected @endif>100%</option>

    				</select>
    			</td>

                <!-- Reviews -->
                {{-- */ $review = $objective->getReviewsBy('half-year','user',$user->id) /* --}}

    			<td><textarea data-select="half-year-user-selector-{!! $objnum !!}" data-oid="{!! $objective->id !!}" data-entry="user" data-pid="{!! $objective->post_id !!}" data-id="{!! $review->id !!}" data-uid="{!! $user->id !!}" data-eid="" data-stage="half-year" class="form-control @if ($is_logged_user && $is_stage_two) textarea-small @else textarea-small-disabled @endif">{!! $review->description !!}</textarea></td>
    			<td class="rating-column ">
    				<select id="half-year-user-selector-{!! $objnum !!}" class="form-control" @if ((!$is_logged_user) || (!$is_stage_two)) disabled @endif>
                        @foreach( $rating->values as $value)
                            <option value="{!! $value->value !!}" @if ($review->rating == $value->value) selected @endif>{!! $value->getAttributeTranslate($value->name) !!}</option>
                        @endforeach
    				</select>
    			</td>

                {{-- */ $review = $objective->getReviewsBy('end-year','user', $user->id) /* --}}

    			<td><textarea  data-select="end-year-user-selector-{!! $objnum !!}" data-oid="{!! $objective->id !!}" data-entry="user" data-pid="{!! $objective->post_id !!}" data-id="{!! $review->id !!}" data-uid="{!! $user->id !!}" data-eid="" data-stage="end-year" class="form-control @if ($is_logged_user && $is_stage_three) textarea-small @else textarea-small-disabled @endif">{!! $review->description !!}</textarea></td>
    			<td class="rating-column">
    				<select id="end-year-user-selector-{!! $objnum !!}" class="form-control" @if ((!$is_logged_user) || (!$is_stage_three)) disabled @endif>
                        @foreach( $rating->values as $value)
                            <option value="{!! $value->value !!}" @if ($review->rating == $value->value) selected @endif>{!! $value->getAttributeTranslate($value->name) !!}</option>
                        @endforeach
    				</select>
    			</td>
    		</tr>
    		<tr>

                {{-- */ $review = $objective->getReviewsBy('half-year','evaluator', $user->id) /* --}}

    			<td>
            @if($visualization_st1)
              <textarea data-select="half-year-manager-selector-{!! $objnum !!}"
                        data-oid="{!! $objective->id !!}"
                        data-pid="{!! $objective->post_id !!}"
                        data-entry="evaluator"
                        data-id="{!! $review->id !!}"
                        data-uid="{!! $user->id !!}"
                        data-eid="{!! Auth::user()->id !!}"
                        data-stage="half-year"
                        class="form-control @if ((!$is_logged_user) && ($is_stage_two)) textarea-small @else textarea-small-disabled @endif"> {!! $review->description !!} </textarea>
            @endif
          </td>
    			<td class="rating-column">
            @if($visualization_st1)
    				<select id="half-year-manager-selector-{!! $objnum !!}" class="form-control" @if (($is_logged_user) || (!$is_stage_two)) disabled @endif>

                        @foreach( $rating->values as $value)
                            <option value="{!! $value->value !!}" @if ($review->rating == $value->value) selected @endif>{!! $value->getAttributeTranslate($value->name) !!}</option>
                        @endforeach

    				</select>
            @endif
    			</td>

                {{-- */ $review = $objective->getReviewsBy('end-year','evaluator', $user->id) /* --}}

    			<td>
            @if($visualization_st2)
                <textarea data-select="end-year-manager-selector-{!! $objnum !!}"
                          data-oid="{!! $objective->id !!}"
                          data-pid="{!! $objective->post_id !!}"
                          data-entry="evaluator"
                          data-id="{!! $review->id !!}"
                          data-uid="{!! $user->id !!}"
                          data-eid="{!! Auth::user()->id !!}"
                          data-stage="end-year" class="form-control @if ((!$is_logged_user) && ($is_stage_three)) textarea-small @else textarea-small-disabled @endif">{!! $review->description !!} </textarea>
            @endif
          </td>
    			<td class="rating-column">
            @if($visualization_st2)
              <select id="end-year-manager-selector-{!! $objnum !!}" class="form-control" @if (($is_logged_user) || (!$is_stage_three)) disabled @endif>

                        @foreach( $rating->values as $value)
                            <option value="{!! $value->value !!}" @if ($review->rating == $value->value) selected @endif>{!! $value->getAttributeTranslate($value->name) !!}</option>
                        @endforeach

    				  </select>
            @endif
    			</td>
    		</tr>

            <!-- / Reviews -->
    	</tbody>
    </table>
    {{-- */ $objnum++ /* --}}
    @endforeach
    {!! Form::close() !!}

</div>

<div class="col-lg-12 buttons-pad">
  @if (!$is_logged_user && $is_stage_one)
    <button class="btn btn-success" id="add-objective" onclick="appendObjective(options)"><i class="fa fa-plus"></i> {!! $dictionary->translate('Agregar objetivo') !!}</button>
  @endif
  <button class="btn btn-success" onclick="objectivesSave(true);"><i class="fa fa-save"></i> {!! $dictionary->translate('Guardar') !!}</button>
  @if ($is_logged_user)
    @if ($status == 2)
        <button class="btn btn-warning pull-right" onclick="objectivesSave(true,1);"> {!! $dictionary->translate('Volver a estado iniciado') !!}</button>
    @else
        <button class="btn btn-danger pull-right" onclick="objectivesSave(true, 2);"> {!! $dictionary->translate('Finalizar') !!}</button>
    @endif
  @endif
</div>

<script type="text/javascript">
    var options = {
            delete:"Borrar",
            objective:"Objetivos",
            weight:"Ponderacion",
            reviewHY:"Revision Medio Año",
            reviewFY:"Revision Fin de Año",
            stage_two:"{!! $is_stage_two !!}",
            stage_three:"{!! $is_stage_three !!}",
            uid: "{!! $user->id !!}",
            eid: "{!! Auth::user()->id !!}",
            objnum: "{!! $objnum !!}",
            rating: '{!! json_encode($rating->values); !!}',
            pid: '{!! $eue->post_id !!}',
            lang: "{!! $user->language_id!!}"
        };

    $(function(){
        // Guardado automatico objetivos

            setInterval(function() {
                objectivesSave();
            }, 2000);

            changeWeightColor();
            $('.weight-column select').change(function(){
                changeWeightColor();
            })
    });

</script>



@endsection
