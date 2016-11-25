@extends('layouts.frontend')

@section('content')

    <div class="col-md-4 col-sm-6 col-xs-12">
      <div class="info-box bg-orange">
        <span class="info-box-icon"><i class="ion ion-person-stalker"></i></span>

        <div class="info-box-content">
          <span class="info-box-text">{!! $dictionary->translate('Evaluaciones Completadas') !!}</span>
          <span class="info-box-number">{!! number_format(($completed/$total_evaluations)*100, 2, '.', ''); !!}%</span>

          <div class="progress">
            <div style="width: {!! number_format(($completed/$total_evaluations)*100, 2, '.', ''); !!}%" class="progress-bar"></div>
          </div>
              <span class="progress-description">
                {!! $completed !!} / {!! $total_evaluations !!} {!! $dictionary->translate('evaluaciones completadas') !!}
              </span>
        </div>
        <!-- /.info-box-content -->
      </div>
      <!-- /.info-box -->
    </div>
    <div class="col-md-4 col-sm-6 col-xs-12">
      <div class="info-box bg-red">
        <span class="info-box-icon"><i class="ion ion-arrow-graph-up-right"></i></span>

        <div class="info-box-content">
          <span class="info-box-text">{!! $dictionary->translate('Resultado Global') !!}</span>
          <span class="info-box-number">{!! number_format($global_performance, 2, '.', '') !!}</span>

          <div class="progress">
            <div style="width: 100%" class="progress-bar"></div>
          </div>
              <span class="progress-description">
                De 3 participantes
              </span>
        </div>
        <!-- /.info-box-content -->
      </div>
      <!-- /.info-box -->
    </div>
    <div class="col-md-4 col-sm-6 col-xs-12">
      <div class="info-box bg-green">
        <span class="info-box-icon"><i class="ion ion-code-working"></i></span>

        <div class="info-box-content">
          <span class="info-box-text">{!! $dictionary->translate('Ratio de conformidad') !!}</span>
          <span class="info-box-number">0</span>

          <div class="progress">
            <div style="width: 70%" class="progress-bar"></div>
          </div>
              <span class="progress-description">
                De 3 participantes
              </span>
        </div>
        <!-- /.info-box-content -->
      </div>
      <!-- /.info-box -->
    </div>
    <div class="col-md-12">
    	<table class="table table-bordered table-striped search-table" id="users-front-table">
		    <thead>
		        <th>ID</th>
                <th>Or.</th>
		        <th>{!! $dictionary->translate('Evaluado') !!}</th>
		        <th>{!! $dictionary->translate('Fecha') !!}</th>
		        <th>{!! $dictionary->translate('Primera etapa') !!}</th>
                <th>{!! $dictionary->translate('Segunda etapa') !!}</th>
                <th>{!! $dictionary->translate('Tercera etapa') !!}</th>
		        <th>{!! $dictionary->translate('Puesto') !!}</th>
		        <th>{!! $dictionary->translate('Manager') !!}</th>
            <th>{!! $dictionary->translate('Puntuación') !!}</th>
		        <th>{!! $dictionary->translate('Informe') !!}</th>
		        <th>Sel</th>
		    </thead>
		    <tbody>

            @foreach($evaluationUserEvaluators as $ev)
		        <tr>
		            <td>{!! $ev->user->id !!}</td>
                    <td>1</td>
		            <td><a href="{{ url('/objectives/'.$ev->user->id) }}">{!! $ev->user->name !!} {!! $ev->user->last_name !!}</a></td>
		            <td>{!! $ev->created_at->format('d/m/Y') !!}</td>
		            <td>
                        @if ($ev->getFirstStageStatus() == 0)
                        <small class="label bg-red">{!! $dictionary->translate('No iniciado') !!}</small>
                        @elseif  ($ev->getFirstStageStatus() == 1)
                        <small class="label bg-orange">{!! $dictionary->translate('Iniciado') !!}</small>
                        @else
                        <small class="label bg-green">{!! $dictionary->translate('Completado') !!}</small>
                        @endif
                    </td>
                    <td>
                        @if ($ev->getSecondStageStatus() == 0)
                        <small class="label bg-red">{!! $dictionary->translate('No iniciado') !!}</small>
                        @elseif  ($ev->getSecondStageStatus() == 1)
                        <small class="label bg-orange">{!! $dictionary->translate('Iniciado') !!}</small>
                        @else
                        <small class="label bg-green">{!! $dictionary->translate('Completado') !!}</small>
                        @endif
                    </td>
                    <td>
                        @if ($ev->getThirdStageStatus() == 0)
                        <small class="label bg-red">{!! $dictionary->translate('No iniciado') !!}</small>
                        @elseif  ($ev->getThirdStageStatus() == 1)
                        <small class="label bg-orange">{!! $dictionary->translate('Iniciado') !!}</small>
                        @else
                        <small class="label bg-green">{!! $dictionary->translate('Completado') !!}</small>
                        @endif
                    </td>
		            <td>{!! $ev->getAttributeTranslate($ev->post->name) !!}</td>
		            <td>{!! $ev->evaluator->name !!} {!! $ev->evaluator->last_name !!} </td>
                <td>{!! $dictionary->translate('N/A') !!}</td>
		            <td>{!! $dictionary->translate('N/D') !!}</td>
		            <td><input type="checkbox"> </td>
		        </tr>
            @endforeach

            @foreach($evaluationUserEvaluators as $ev)
                @foreach($ev->childrenEUA as $eua)
                <tr>
                    <td>{!! $eua->user->id !!}</td>
                    <td>2</td>
                    <td>{!! $eua->user->name !!} {!! $eua->user->last_name !!}</td>
                    <td>{!! $eua->created_at->format('d/m/Y') !!}</td>
                    <td>
                        @if ($ev->getStageStatus(0) == 0)
                        <small class="label bg-red">{!! $dictionary->translate('No iniciado') !!}</small>
                        @elseif  ($ev->getStageStatus(0) == 1)
                        <small class="label bg-orange">{!! $dictionary->translate('Iniciado') !!}</small>
                        @else
                        <small class="label bg-green">{!! $dictionary->translate('Completado') !!}</small>
                        @endif
                    </td>
                    <td>
                        @if ($ev->getStageStatus(1) == 0)
                        <small class="label bg-red">{!! $dictionary->translate('No iniciado') !!}</small>
                        @elseif  ($ev->getStageStatus(1) == 1)
                        <small class="label bg-orange">{!! $dictionary->translate('Iniciado') !!}</small>
                        @else
                        <small class="label bg-green">{!! $dictionary->translate('Completado') !!}</small>
                        @endif
                    </td>
                    <td>
                        @if ($ev->getStageStatus(2) == 0)
                        <small class="label bg-red">{!! $dictionary->translate('No iniciado') !!}</small>
                        @elseif  ($ev->getStageStatus(2) == 1)
                        <small class="label bg-orange">{!! $dictionary->translate('Iniciado') !!}</small>
                        @else
                        <small class="label bg-green">{!! $dictionary->translate('Completado') !!}</small>
                        @endif
                    </td>
                    <td>{!! $ev->getAttributeTranslate($ev->post->name) !!}</td>
                    <td>{!! $eua->evaluator->name !!} {!! $eua->evaluator->last_name !!} </td>
                    <td>{!! $dictionary->translate('N/A') !!}</td>
                    <td>{!! $dictionary->translate('N/D') !!}</td>
                    <td><input type="checkbox"> </td>
                </tr>
                @endforeach
            @endforeach

		    </tbody>
		</table>
    </div>

@endsection
