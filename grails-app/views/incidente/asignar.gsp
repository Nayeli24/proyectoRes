
<%@ page import="pruebaSeguridad.Incidente" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Asignar incidente</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
        <meta name="description" content="">
        <meta name="author" content="">
    </head>
    <body>


        <g:render template="/layouts/header" />

<!-- PAGE -->
        <section id="page">
              <!-- SIDEBAR-->
            <g:render template="/layouts/navbar" />
                   <!-- /SIDEBAR -->
            <div id="main-content">

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

                                        <div class="clearfix">
                                            <h3 class="content-title pull-left">Asignar incidente</h3>
                                        </div>
                                        <div class="description">Asignar incidente a un usuario</div>
                                    </div>
                                </div>
                            </div>
                            <!-- /PAGE HEADER -->
                            <div class="box border primary">
                                <div class="box-title">
                                    <h3 class="form-title">Asignar incidente</h3>
                                </div>                                                    
                                <div class="box-body big">
                                    <g:if test="${flash.message}">
                                        <div class="message" role="status">${flash.message}</div>
                                    </g:if>
                                    <g:form controller="incidente" action="asignarIncidente" >
                                        <g:if test="${detalle}">
                                            <div class="message" role="status">${flash.message}</div>
                                        </g:if>
                                        <fieldset>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label" for="asignadoA"> Usuario asignado:</label>
                                                <div class="col-sm-9">
                                                    <g:select id="asignadoA" name="asignadoA" from="${detalle.usuarios}" optionKey="id" value="${detalle.usuarios?.nombre}" class="form-control" noSelection="['': 'Selecciona un usuario']"/>
                                                </div>
                                            </div>
                                        </fieldset><p>
                                        <fieldset>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label" for="incidente"> Incidente a asignar:</label>
                                                <div class="col-sm-9">
                                                    <g:select id="incidente" name="incidente" from="${detalle.incidentes}" optionKey="id" value="${detalle.incidentes?.id}" class="form-control" noSelection="['': 'Selecciona un incidente']"/>
                                                </div>
                                            </div>
                                        </fieldset>
                                        <fieldset class="buttons">
                                            <g:if  test="${detalle.incidentes}">
                                                <g:submitButton name="asignar" class="save" value="Asignar" />
                                            </g:if> 
                                            <g:else>
                                                <div class="alert alert-danger">
                                                    ${flash.error?.encodeAsHTML()}
                                                </div>
                                            </g:else>
                                        </fieldset>
                                    </g:form>
                                </div>
                            </div>

                        </div>
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
