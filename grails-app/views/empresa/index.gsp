
<%@ page import="pruebaSeguridad.Empresa" %>
<%@ page import="pruebaSeguridad.Incidente"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Empresas</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
        <meta name="description" content="">
        <meta name="author" content="">
    </head>
    <body>
        <!--<g:render template="/layouts/header" />
        <!-- PAGE-->
        <section id="page">
              <!-- SIDEBAR
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
                                                <h3 class="content-title pull-left">Empresas</h3>
                                            </div>
                                            <div class="description">Lista de empresas</div>
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
                                            <h4>Empresas</h4>

                                        </div>
                                        <div class="box-body">
                                            <g:if test="${flash.message}">
                                                <div class="message" role="status">${flash.message}</div>
                                            </g:if>
                                            <table id="datatable1" cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>No.</th>
                                                        <th>Nombre de empresa</th>
                                                    </tr>
                                                </thead>

                                                <tbody>
                                                    <g:each in="${empresaInstanceList}" status="i" var="empresaInstance">
                                                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                                            <td>${empresaInstance.id}</td>
                                                            <td><g:link action="show" id="${empresaInstance.id}">${fieldValue(bean: empresaInstance, field: "nombreEmpresa")}</g:link></td>

                                                        </tr>
                                                    </g:each>
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <th>No.</th>
                                                        <th>Nombre de empresa</th>
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