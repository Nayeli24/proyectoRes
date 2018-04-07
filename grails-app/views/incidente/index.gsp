<%@ page import="pruebaSeguridad.Usuario" %>
<%@ page import="pruebaSeguridad.Incidente" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Incidentes</title>
<!--        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">-->
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
                                                    <th class="hidden-xs">Envío de correo</th>
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
                                                                <td class="center"><g:formatDate format="dd MMMMM yyyy" date="${it.fechaRegistro}" /></td>
                                                        <sec:ifAnyGranted roles='ROLE_DESARROLLADOR, ROLE_ADMIN'>
                                                            <td class="hidden-xs">${it?.registradoPor?.nombre} ${it?.registradoPor?.apellidoPat} ${it?.registradoPor?.apellidoMat}</td>
                                                            <td class="center"><g:formatDate format="dd MMMMM yyyy "  date="${it?.fechaAsignacion}" /></td>
                                                        </sec:ifAnyGranted>
                                                        <sec:ifAnyGranted roles='ROLE_ADMIN'>
                                                            <td class="center hidden-xs">${it?.asignadoA?.nombre} ${it?.asignadoA?.apellidoPat} ${it?.asignadoA?.apellidoMat}</td>
                                                            <g:if test="${it?.estatus?.tipoEstatus=='Cerrado'}"> 

                                                                <td id="td">
                                                                 
                                                                    <g:if test="${it.envioCorreo==true}">
                                                                        <div class="message" role="status"><i class="fa fa-thumbs-o-up"> Hecho</i></div>
                                                                    </g:if>
                                                                    <g:else><g:link controller="incidente" action="enviarEmail" id="${it.id}">   <i class="fa fa-envelope"></i>
                                                                        </g:link></g:else>
                                                                    </td>
                             <!-- <td><g:link controller="incidente" action="enviarEmail" id="${it.id}">Enviar </g:link></td>-->

                                                            </g:if>
                                                            <g:else>
                                                                <td>Sin finalizar</td>
                                                            </g:else>
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
                                                    <th class="hidden-xs">Envío de correo</th>
                                                </sec:ifAnyGranted>

                                                </tr>
                                                </tfoot>
                                            </table>
                                            <div id="message"></div>
                                            <div id="error"></div>
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