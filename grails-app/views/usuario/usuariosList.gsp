<%@ page import="pruebaSeguridad.Usuario" %>
<%@ page import="pruebaSeguridad.Incidente" %>
<%@ page import="pruebaSeguridad.UsuarioRole" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Usuarios</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
        <meta name="layout" content="main">
    </head>
    <body>


<!-- PAGE -->
        <section id="page">

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
                                                <h3 class="content-title pull-left">Usuarios</h3>
                                            </div>
                                            <div class="description">Lista de usuarios</div>
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
                                            <h4>Lista usuarios</h4>

                                        </div>
                                        <div class="box-body">
                                            <table id="datatable1" cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>Username</th>
                                                        <th>Nombre completo</th>
                                                        <th>Cuenta activa</th>
                                                        <th class="hidden-xs">Tipo de usuario</th>
                                                        <th>Empresa</th>

                                                </thead>

                                                <tbody>
                                                    <g:if test="${usuarios}">
                                                        <g:each name="usuarios" in="${usuarios}">	
                                                            <tr class="gradeX" >
                                                                <td><g:link action="show" id="${it.id}">${it.username}</g:link></td>
                                                                <td> ${it.nombre} ${it.apellidoPat} ${it.apellidoMat}</td>
                                                                <td>${it.enabled}</td>
                                                                <td><g:join in="${it.authorities}"/></td>	
                                                                <td>${it.empresa}</td>
                                                            </tr>
                                                        </g:each>
                                                    </g:if>
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <th>Username</th>
                                                        <th>Cuenta activa</th>
                                                        <th class="hidden-xs">Tipo de usuario</th>
                                                        <th>Empresa</th>
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
       
    </body>
</html>