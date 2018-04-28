
<%@ page import="pruebaSeguridad.Empresa" %>
<%@ page import="pruebaSeguridad.Incidente"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Empresas</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
        <meta name="layout" content="main">
    </head>
    <body>
        <!-- PAGE-->
        <section id="page">
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
                                                        <th>Activa</th>
                                                    </tr>
                                                </thead>

                                                <tbody>
                                                    <g:each in="${empresaInstanceList}" status="i" var="empresaInstance">
                                                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                                            <td><g:remoteLink controller="empresa" action="edit" id="${empresaInstance.id}" update ="[success:'message',failure:'error']">${empresaInstance.id}</g:remoteLink></td>
                                                            <td>${fieldValue(bean: empresaInstance, field: "nombreEmpresa")}</td>
                                                            <td> <g:formatBoolean boolean="${empresaInstance?.enabled}"  true="Sí" false="No"  />
                                                            </td>
                                                        </tr>
                                                    </g:each>
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <th>No.</th>
                                                        <th>Nombre de empresa</th>
                                                        <th>Activa</th>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>
                                    <div id="error"></div>
                                    <div id="message"></div>
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