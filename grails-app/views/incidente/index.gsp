<%@ page import="pruebaSeguridad.Usuario" %>
<%@ page import="pruebaSeguridad.Incidente" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Inicio</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- STYLESHEETS --><!--[if lt IE 9]><script src="js/flot/excanvas.min.js"></script><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script><![endif]-->
        <link rel="stylesheet" type="text/css" href="../css/cloud-admin.css" >
        <link rel="stylesheet" type="text/css"  href="../css/themes/night.css" id="skin-switcher" >
        <link rel="stylesheet" type="text/css"  href="../css/responsive.css" >

        <link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <!-- JQUERY UI-->
        <link rel="stylesheet" type="text/css" href="../js/jquery-ui-1.10.3.custom/css/custom-theme/jquery-ui-1.10.3.custom.min.css" />
        <!-- DATE RANGE PICKER -->
        <link rel="stylesheet" type="text/css" href="../js/bootstrap-daterangepicker/daterangepicker-bs3.css" />
        <!-- DATA TABLES -->
        <link rel="stylesheet" type="text/css" href="../js/datatables/media/css/jquery.dataTables.min.css" />
        <link rel="stylesheet" type="text/css" href="../js/datatables/media/assets/css/datatables.min.css" />
        <link rel="stylesheet" type="text/css" href="../js/datatables/extras/TableTools/media/css/TableTools.min.css" />
        <!-- FONTS -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700' rel='stylesheet' type='text/css'>
    </head>
    <body>
        <g:render template="/layouts/header" />
         
<!-- PAGE -->
            <section id="page">
                  <!-- SIDEBAR-->
         <g:render template="/layouts/navbar" />
                <!-- /SIDEBAR -->
                <div id="main-content">
                        <!-- SAMPLE BOX CONFIGURATION MODAL FORM-->
                    <div class="modal fade" id="box-config" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title">Box Settings</h4>
                                </div>
                                <div class="modal-body">
                                    Here goes box setting content.
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary">Save changes</button>
                                </div>
                            </div>
                        </div>
                    </div>
                  <!-- /SAMPLE BOX CONFIGURATION MODAL FORM-->
                    <div class="container">
                        <div class="row">
                            <div id="content" class="col-lg-12">
                                    <!-- PAGE HEADER-->
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="page-header">
                                                <!-- STYLER -->

<!-- /STYLER -->
<!-- BREADCRUMBS -->
                                            <ul class="breadcrumb">
                                                <!--<li>
                                                    <i class="fa fa-home"></i>
                                                    <a href="index.html">Home</a>
                                                </li>
                                                <li>
                                                    <a href="#">Tables</a>
                                                </li>
                                                <li>Dynamic Tables</li>
                                            </ul>
                                            <!-- /BREADCRUMBS -->
                                                <div class="clearfix">
                                                    <h3 class="content-title pull-left">Incidentes</h3>
                                                </div>
                                                <div class="description">Lista de incidentes</div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /PAGE HEADER -->
                                <!-- DATA TABLES -->
                                <div class="row">
                                    <div class="col-md-12">
                                            <!-- BOX -->
                                        <div class="box border green">
                                            <div class="box-title">
                                                <h4>Lista incidentes</h4>

                                            </div>
                                            <div class="box-body">
                                                <table id="datatable1" cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th>Folio</th>
                                                            <th>Tema</th>
                                                            <th class="hidden-xs">Estatus</th>
                                                            <th>Fecha de registro</th>
                                                    <sec:ifAnyGranted roles='ROLE_DESARROLLADOR, ROLE_ADMIN'>
                                                        <th class="hidden-xs">Registrado por</th>
                                                        <th>Fecha de asignación</th>
                                                    </sec:ifAnyGranted>
                                                    <sec:ifAnyGranted roles='ROLE_ADMIN'>
                                                        <th class="hidden-xs">Asignado a</th>
                                                    </sec:ifAnyGranted>

                                                    </tr>
                                                    </thead>
                                                    <tbody>

                                                        <g:if test="${incidentesVer}">
                                                            <g:each name="incidentesVer" in="${incidentesVer}">	
                                                                <tr class="gradeX" >
                                                                    <td><g:link action="show" id="${it.id}">${it.folio}</g:link></td>
                                                                    <td>${it.tema}</td>
                                                                    <td class="hidden-xs">${it.estatus}</td>
                                                                    <td class="center"><g:formatDate format="dd / MM / yyyy" date="${it.fechaRegistro}" /></td>
                                                            <sec:ifAnyGranted roles='ROLE_DESARROLLADOR, ROLE_ADMIN'>
                                                                <td class="hidden-xs">${it?.registradoPor?.username}</td>
                                                                <td class="center"><g:formatDate  date="${it.fechaAsignacion}" /></td>
                                                            </sec:ifAnyGranted>
                                                            <sec:ifAnyGranted roles='ROLE_ADMIN'>
                                                                <td class="center hidden-xs">${it?.asignadoA?.username}</td>
                                                            </sec:ifAnyGranted>
                                                            </tr>
                                                        </g:each>
                                                    </g:if>

                                                    </tbody>
                                                    <tfoot>
                                                        <tr>
                                                            <th>Folio</th>
                                                            <th>Tema</th>
                                                            <th class="hidden-xs">Estatus</th>
                                                            <th>Fecha de registro</th>
                                                    <sec:ifAnyGranted roles='ROLE_DESARROLLADOR, ROLE_ADMIN'>
                                                        <th class="hidden-xs">Registrado por</th>
                                                        <th>Fecha de asignación</th>
                                                    </sec:ifAnyGranted>
                                                    <sec:ifAnyGranted roles='ROLE_ADMIN'>
                                                        <th class="hidden-xs">Asignado a</th>
                                                    </sec:ifAnyGranted>

                                                    </tr>
                                                    </tfoot>
                                                </table>
                                            </div>
                                        </div>
                                        <!-- /BOX -->
                                    </div>
                                </div>



<!-- /EXPORT TABLES -->
                                <div class="footer-tools">
                                    <span class="go-top">
                                        <i class="fa fa-chevron-up"></i> Top
                                    </span>
                                </div>
                            </div><!-- /CONTENT-->
                        </div>
                    </div>
                </div>
            </section>
            <!--/PAGE -->
            <!-- JAVASCRIPTS -->
            <!-- Placed at the end of the document so the pages load faster -->
            <!-- JQUERY -->
            <script src="../js/jquery/jquery-2.0.3.min.js"></script>
            <!-- JQUERY UI-->
            <script src="../js/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
            <!-- BOOTSTRAP -->
            <script src="../bootstrap-dist/js/bootstrap.min.js"></script>


<!-- DATE RANGE PICKER -->
            <script src="../js/bootstrap-daterangepicker/moment.min.js"></script>

            <script src="../js/bootstrap-daterangepicker/daterangepicker.min.js"></script>
            <!-- SLIMSCROLL -->
            <script type="text/javascript" src="../js/jQuery-slimScroll-1.3.0/jquery.slimscroll.min.js"></script><script type="text/javascript" src="js/jQuery-slimScroll-1.3.0/slimScrollHorizontal.min.js"></script>
            <!-- BLOCK UI -->
            <script type="text/javascript" src="../js/jQuery-BlockUI/jquery.blockUI.min.js"></script>
            <!-- DATA TABLES -->
            <script type="text/javascript" src="../js/datatables/media/js/jquery.dataTables.min.js"></script>
            <script type="text/javascript" src="../js/datatables/media/assets/js/datatables.min.js"></script>
            <script type="text/javascript" src="../js/datatables/extras/TableTools/media/js/TableTools.min.js"></script>
            <script type="text/javascript" src="../js/datatables/extras/TableTools/media/js/ZeroClipboard.min.js"></script>
            <!-- COOKIE -->
            <script type="text/javascript" src="../js/jQuery-Cookie/jquery.cookie.min.js"></script>
            <!-- CUSTOM SCRIPT -->
            <script src="../js/script.js"></script>
            <script>
                jQuery(document).ready(function() {		
                App.setPage("dynamic_table");  //Set current page
                App.init(); //Initialise plugins and elements
                });
            </script>
            <!-- /JAVASCRIPTS -->
    </body>
</html>