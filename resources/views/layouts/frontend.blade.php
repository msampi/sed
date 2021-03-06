<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="csrf-token" content="{{ csrf_token() }}" />
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>SED | Sistema de Evaluación de Desempeño</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>
    <link href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700" rel='stylesheet' type='text/css'>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    {{-- <link href="{{ elixir('css/app.css') }}" rel="stylesheet"> --}}
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="{{ URL::asset('css/AdminLTE.min.css') }}">
    <link rel="stylesheet" href="{{ URL::asset('css/skins/_all-skins.min.css') }}">
    <link rel="stylesheet" href="{{ URL::asset('plugins/iCheck/flat/blue.css') }}">

    <!-- Morris chart -->
    <link rel="stylesheet" href="{{ URL::asset('plugins/morris/morris.css') }}">
    <!-- jvectormap -->
    <link rel="stylesheet" href="{{ URL::asset('plugins/jvectormap/jquery-jvectormap-1.2.2.css') }}">
    <!-- Date Picker -->
    <link rel="stylesheet" href="{{ URL::asset('plugins/datepicker/datepicker3.css') }}">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="{{ URL::asset('plugins/daterangepicker/daterangepicker-bs3.css') }}">
    <!-- bootstrap wysihtml5 - text editor -->
    <link rel="stylesheet" href="{{ URL::asset('plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css') }}">

    <link rel="stylesheet" href="{{ URL::asset('plugins/datatables/dataTables.bootstrap.css') }}">

    <link rel="stylesheet" href="{{ URL::asset('plugins/select2/select2.min.css') }}">

    <link rel="stylesheet" href="{{ URL::asset('css/style.css') }}">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="{{ URL::asset('plugins/jQuery/jQuery-2.1.4.min.js') }}"></script>

  </head>
  <body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">
        <header class="main-header">
        <!-- Logo -->
        <a href="index2.html" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini"><b>SED</b></span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg">{!! $dictionary->translate('Sistema')  !!}<b>SED</b></span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">{!! $dictionary->translate('Navegacion') !!}</span>
          </a>
          <div class="navbar-custom-menu" style="float: right;">
            <ul class="nav navbar-nav">

              <!-- Notifications: style can be found in dropdown.less -->
              <li class="dropdown notifications-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-bell-o"></i>
                  <span class="label label-warning">{!! $alerts->count() !!}</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">{!! $dictionary->translate('Tienes')!!} {!! $alerts->count() !!} {!! $dictionary->translate('notificaciones')!!}</li>
                  <li>
                    <!-- inner menu: contains the actual data -->
                    <ul class="menu hand">
                      @foreach ($alerts as $alert)

                      <li> 
                        <a key="{!! $alert->id !!}" @if( $alert->alertByUser( Auth::user()->id )->count() > 0 )  style="font-weight:initial;" @endif >

                          <i class="fa fa-warning text-yellow"></i> {!! $alert->getDescription()!!}
                        </a>
                      </li>
                      @endforeach
                    </ul>
                  </li>
                </ul>
              </li>

              <!-- User Account: style can be found in dropdown.less -->
              <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <img src="{{ URL::asset('uploads/'.Auth::user()->image) }}" class="user-image" alt="User Image">
                   @if (Auth::user())
                  <span class="hidden-xs">{{ Auth::user()->name }} {{ Auth::user()->last_name }} </span>
                  @endif
                </a>
                <ul class="dropdown-menu">
                  <!-- User image -->
                  <li class="user-header">
                    <img src="{{ URL::asset('uploads/'.Auth::user()->image) }}" class="img-circle" alt="User Image">
                    <p>
                    @if (Auth::user())
                      {{ Auth::user()->name }} {{ Auth::user()->last_name }}

                    </p>
                    @endif
                  </li>

                  <!-- Menu Footer-->
                  <li class="user-footer">

                      <a href="{{ url('quit') }}" class="btn btn-default btn-flat">{!! $dictionary->translate('Salir') !!}</a>

                  </li>
                </ul>
              </li>

            </ul>
          </div>
        </nav>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
          <div class="user-panel">
            <div class="pull-left image">
              <img src="{{ URL::asset('uploads/'.Auth::user()->image) }}" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
               @if (Auth::user())<p>{{ Auth::user()->name }} {{ Auth::user()->last_name }} </p>@endif
               <span>{!! $eue->getAttributeTranslate($eue->post->name) !!}</span>
            </div>
          </div>


          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="header">{!! $dictionary->translate('NAVEGACIÓN PRINCIPAL') !!}</li>
            <li>
              <a href="{!! URL::asset( 'home' ) !!}">
                <i class="fa fa-dashboard"></i> <span>{!! $dictionary->translate('Dashboard') !!}</span>

              </a>
            </li>
            <li>
              <a href="{!! URL::asset( 'users' ) !!}">
                <i class="fa fa-users"></i> <span>{!! $dictionary->translate('Evaluados') !!}</span>

              </a>
            </li>
            @if ($enabledObjectives) 
            <li>
              <a href="{!! URL::asset( 'objectives' ) !!}">
                <i class="fa fa-calendar-check-o"></i> <span>{!! $dictionary->translate('Objetivos') !!}</span>

              </a>
            </li>
            @endif
            @if ($enabledCompetitions) 
            <li>
              <a href="{!! URL::asset( 'competitions' ) !!}">
                <i class="fa fa-suitcase"></i> <span>{!! $dictionary->translate('Competencias') !!}</span>

              </a>
            </li>
            @endif
            @if ($enabledValorations) 
            <li>
              <a href="{!! URL::asset( 'valorations' ) !!}">
                <i class="fa fa-tasks"></i> <span>{!! $dictionary->translate('Valores') !!}</span>

              </a>
            </li>
            @endif
            <li>
              <a href="{!! URL::asset( 'pdp' ) !!}">
                <i class="fa fa-bars"></i> <span>{!! $dictionary->translate('PDP') !!}</span>

              </a>
            </li>
            <li>
              <a href="{!! URL::asset( 'documents' ) !!}">
                <i class="fa fa-file-text-o"></i> <span>{!! $dictionary->translate('Documentos') !!}</span>

              </a>
            </li>    
            <li>
              <a href="{!! URL::asset( 'performances' ) !!}">
                <i class="fa fa-bar-chart"></i> <span>{!! $dictionary->translate('Valoración Global') !!}</span>

              </a>
            </li>
            
            </ul>
        </section>
    </aside>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Main content -->
        <section class="content">
            <!-- Small boxes (Stat box) -->
            <div class="row">
                @yield('content')
            </div>
        </section>
    </div>

    </div>


      <div class="alert-modal hiden modal fade">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span></button>
              <h4 class="modal-title">Alerta</h4>
            </div>
            <div class="modal-body">
              <p id="contenido">
                
              </p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->


    <!-- JavaScripts -->


    {{-- <script src="{{ elixir('js/app.js') }}"></script> --}}

    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <script>
      $.widget.bridge('uibutton', $.ui.button);
    </script>
    <!-- Bootstrap 3.3.5 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <!-- Morris.js charts -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    <!--<script src="{{ URL::asset('plugins/morris/morris.min.js') }}"></script>-->
    <!-- Sparkline -->
    <script src="{{ URL::asset('plugins/sparkline/jquery.sparkline.min.js') }}"></script>
    <!-- jvectormap -->
    <script src="{{ URL::asset('plugins/jvectormap/jquery-jvectormap-1.2.2.min.js') }}"></script>
    <script src="{{ URL::asset('plugins/jvectormap/jquery-jvectormap-world-mill-en.js') }}"></script>
    <!-- jQuery Knob Chart -->
    <script src="{{ URL::asset('plugins/knob/jquery.knob.js') }}"></script>
    <!-- daterangepicker -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"></script>
    <script src="{{ URL::asset('plugins/daterangepicker/daterangepicker.js') }}"></script>
    <!-- datepicker -->
    <script src="{{ URL::asset('plugins/datepicker/bootstrap-datepicker.js') }}"></script>
    <!-- Bootstrap WYSIHTML5 -->
    <script src="{{ URL::asset('plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js') }}"></script>
    <!-- Slimscroll -->
    <script src="{{ URL::asset('plugins/slimScroll/jquery.slimscroll.min.js') }}"></script>
    <!-- FastClick -->
    <script src="{{ URL::asset('plugins/fastclick/fastclick.min.js') }}"></script>
    <!-- AdminLTE App -->
    <script src="{{ URL::asset('js/app.min.js') }}"></script>

    <script src="{{ URL::asset('plugins/datatables/jquery.dataTables.js') }}"></script>
    <script src="{{ URL::asset('plugins/datatables/dataTables.bootstrap.min.js') }}"></script>

    <script src="{{ URL::asset('plugins/select2/select2.full.min.js') }}"></script>


    <script src="{{ URL::asset('js/scripts.js') }}"></script>
    <script src="{{ URL::asset('js/frontend.js') }}"></script>

    <script type="text/javascript">
      var BASE_URL = '{!! url('/') !!}';

      $(function () {
        $.ajaxSetup({
            headers: { 'X-CSRF-TOKEN': '<?php echo csrf_token(); ?>' }
        });        
        $('.hand li a').click(function(){
          $(this).css('font-weight','initial');
          $.ajax({
            type: "POST",
            url: BASE_URL+'/alert',
            data: { id: $(this).attr('key') },
            success: function(resp) {
              
              $('#contenido').html(resp);
              $('.alert-modal').modal('show');
            },
            error: function() {
            },
          });
        });

        $('.search-table').DataTable({
          "order": [[ 1, "asc" ]],
          "paging": true,
          "lengthChange": false,
          "searching": true,
          "ordering": true,
          "info": true,
          "autoWidth": false,
          "oLanguage": {
                  "oPaginate": {
                  "sFirst": "First page", // This is the link to the first page
                  "sPrevious": "<", // This is the link to the previous page
                  "sNext": ">", // This is the link to the next page
                  "sLast": "Last page" // This is the link to the last page
                  },
                  "sSearch" : '<i class="fa fa-search"></i>'
          }
        });

      });
    </script>
</body>
</html>
