@extends('layouts.frontend')

@section('content')

@include('frontend.template-parts.content-header')

<div class="col-lg-12" id="objectives-container" >
    {!! Form::open() !!}
    {{-- */ $objnum = 0 /* --}} 
    @foreach ($objectives as $objective)
    <table class="table table-bordered objective-table">
        <thead>
    		<th colspan="6">@if ($objective->user_id)<a class="btn btn-xs btn-danger" onclick="removeObjective($(this).parent().parent().parent().parent(),{!! $objective->id !!}), 'Esta seguro de eliminar este objetivo?' "><i class="fa fa-trash"></i></a> @endif</th>
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
    			<td rowspan="2"><textarea  data-select="weight-selector-{!! $objnum !!}"  data-oid="{!! $objective->id !!}" data-id="{!! $objective->id !!}" data-pid="{!! $objective->post_id !!}" data-eid="{!! $objective->evaluator_id !!}" data-uid="{!! $objective->user_id !!}" data-stage="objective"  class="form-control objective-first-textarea @if ((!$objective->user_id) && (!$objective->evaluator_id) && ($current_stage != 1)) textarea-small-disabled @else textarea-small @endif">{!! $objective->getAttributeTranslate($objective->description) !!}</textarea></td>
    			<td rowspan="2" class="rating-column weight-column">
    				<select id="weight-selector-{!! $objnum !!}" class="form-control weight" @if ((!$objective->user_id) and ($objective->weight != '0%') && ($current_stage != 1)) disabled @endif>
    					<option @if ($objective->weight == '0%') selected @endif >0%</option>
                        <option @if ($objective->weight == '25%') selected @endif>25%</option>
                        <option @if ($objective->weight == '50%') selected @endif>50%</option>
                        <option @if ($objective->weight == '75%') selected @endif>75%</option>
                        <option @if ($objective->weight == '100%') selected @endif>100%</option>
                        
    				</select> 
    			</td>

                <!-- Reviews -->
                {{-- */ $review = $objective->getReviewsBy('half-year','user',$user->id) /* --}} 
                
    			<td><textarea data-select="half-year-user-selector-{!! $objnum !!}" data-oid="{!! $objective->id !!}" data-entry="user" data-pid="{!! $objective->post_id !!}" data-id="{!! $review->id !!}" data-uid="{!! $user->id !!}" data-eid="" data-stage="half-year" class="form-control @if ($is_logged_user && $current_stage == 2) textarea-small @else textarea-small-disabled @endif">{!! $review->description !!}</textarea></td>
    			<td class="rating-column ">
    				<select id="half-year-user-selector-{!! $objnum !!}" class="form-control" @if ((!$is_logged_user) || ($current_stage != 2)) disabled @endif>
                        @foreach( $rating->values as $value)
                            <option @if ($review->rating == $value->value) selected @endif>{!! $value->getAttributeTranslate($value->value) !!}</option>
                        @endforeach
    				</select> 
    			</td>

                {{-- */ $review = $objective->getReviewsBy('end-year','user', $user->id) /* --}}

    			<td><textarea  data-select="end-year-user-selector-{!! $objnum !!}" data-oid="{!! $objective->id !!}" data-entry="user" data-pid="{!! $objective->post_id !!}" data-id="{!! $review->id !!}" data-uid="{!! $user->id !!}" data-eid="" data-stage="end-year" class="form-control @if ($is_logged_user && $current_stage == 3) textarea-small @else textarea-small-disabled @endif">{!! $review->description !!}</textarea></td>
    			<td class="rating-column">
    				<select id="end-year-user-selector-{!! $objnum !!}" class="form-control" @if ((!$is_logged_user) || ($current_stage != 3)) disabled @endif>
                        @foreach( $rating->values as $value)
                            <option @if ($review->rating == $value->value) selected @endif>{!! $value->getAttributeTranslate($value->value) !!}</option>
                        @endforeach
    				</select> 
    			</td>
    		</tr>
    		<tr>
    			
                {{-- */ $review = $objective->getReviewsBy('half-year','evaluator', $user->id) /* --}}

    			<td><textarea data-select="half-year-manager-selector-{!! $objnum !!}" data-oid="{!! $objective->id !!}" data-pid="{!! $objective->post_id !!}" data-entry="evaluator" data-id="{!! $review->id !!}" data-uid="{!! $user->id !!}" data-eid="{!! Auth::user()->id !!}" data-stage="half-year" class="form-control @if ((!$is_logged_user) && ($current_stage == 2)) textarea-small @else textarea-small-disabled @endif">{!! $review->description !!}</textarea></td>
    			<td class="rating-column">
    				<select id="half-year-manager-selector-{!! $objnum !!}" class="form-control" @if (($is_logged_user) || ($current_stage != 2)) disabled @endif>
                        @foreach( $rating->values as $value)
                            <option @if ($review->rating == $value->value) selected @endif>{!! $value->getAttributeTranslate($value->value) !!}</option>
                        @endforeach
    				</select> 
    			</td>

                {{-- */ $review = $objective->getReviewsBy('end-year','evaluator', $user->id) /* --}}

    			<td><textarea data-select="end-year-manager-selector-{!! $objnum !!}" data-oid="{!! $objective->id !!}" data-pid="{!! $objective->post_id !!}" data-entry="evaluator" data-id="{!! $review->id !!}" data-uid="{!! $user->id !!}" data-eid="{!! Auth::user()->id !!}" data-stage="end-year" class="form-control @if ((!$is_logged_user) && ($current_stage == 3)) textarea-small @else textarea-small-disabled @endif">{!! $review->description !!}</textarea></td>
    			<td class="rating-column">
    				<select id="end-year-manager-selector-{!! $objnum !!}" class="form-control" @if (($is_logged_user) || ($current_stage != 3)) disabled @endif>
                        @foreach( $rating->values as $value)
                            <option @if ($review->rating == $value->value) selected @endif>{!! $value->getAttributeTranslate($value->value) !!}</option>
                        @endforeach
    				</select> 
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
    <button class="btn btn-success" id="add-objective" onclick="appendObjective(options)"><i class="fa fa-plus"></i> {!! $dictionary->translate('Agregar objetivo') !!}</button>
    <!--<button class="btn btn-success"><i class="fa fa-save"></i> {!! $dictionary->translate('Guardar') !!}</button>
    <button class="btn btn-danger pull-right"><i class="fa fa-eye"></i> {!! $dictionary->translate('Status') !!}</button>-->
</div>

<script type="text/javascript">
    var options = {
            delete:"Borrar", 
            objective:"Objetivos", 
            weight:"Ponderacion", 
            reviewHY:"Revision Medio Año",
            reviewFY:"Revision Fin de Año",
            uid: "{!! $user->id !!}",
            eid: "{!! Auth::user()->id !!}",
            objnum: "{!! $objnum !!}",
            rating: '{!! json_encode($rating->values); !!}',
            pid: '{!! $user->post_id !!}'
        };

    $(function(){

        // Guardado automatico objetivos

            setInterval(function() {
                objectivesSave();
            }, 5000);
    });

</script>



@endsection
