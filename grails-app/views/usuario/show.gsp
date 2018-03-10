
<%@ page import="pruebaSeguridad.Usuario" %>
<%@ page import="pruebaSeguridad.Incidente" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Detalle usuario</title>

        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
        <meta name="layout" content="main">
        <g:javascript library="prototype" />
    </head>
    <body>

<!-- PAGE -->
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
                                        <!-- BREADCRUMBS -->
                                        <ul class="breadcrumb">
                                            <li> <i class="fa  fa-eye"></i>Detalle usuario</li>
                                            <li>
                                                <i class="fa fa-pencil-square-o"></i> <g:link class="" action="edit" resource="${usuarioInstance}">Modificar usuario</g:link>
                                                </li>

                                        </ul>
                                        <!-- /BREADCRUMBS -->
                                        <div class="clearfix">
                                            <h3 class="content-title pull-left">Detalle de usuario</h3>
                                        </div>
                                        <div class="description">Caracteristicas de usuario </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /PAGE HEADER -->
                            <div class="box border primary">
                                <div class="box-title">
                                    <h3 class="form-title">Detalle de usuario</h3>
                                </div>                                                    
                                <g:if test="${usuarioInstance?.username}">
                                    <div class="form-group">
                                        <br>
                                        <label class="control-label col-md-3">Username:</label>
                                        <g:fieldValue bean="${usuarioInstance}" field="username"/>
                                    </div>
                                </g:if>
                                <g:if test="${usuarioInstance?.nombre}">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Nombre:</label>
                                        <g:fieldValue bean="${usuarioInstance}" field="nombre"/>
                                    </div>
                                </g:if>
                                <g:if test="${usuarioInstance?.apellidoPat}">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Apellido Paterno:</label>
                                        <g:fieldValue bean="${usuarioInstance}" field="apellidoPat"/>
                                    </div>
                                </g:if>
                                <g:if test="${usuarioInstance?.apellidoMat}">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Apellido Materno:</label>
                                        <g:fieldValue bean="${usuarioInstance}" field="apellidoMat"/>                                  
                                    </div>
                                </g:if>
                                <g:if test="${usuarioInstance?.areaDpto}">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Área o Departamento:</label>
                                        <g:fieldValue bean="${usuarioInstance}" field="areaDpto"/>                                  
                                    </div>
                                </g:if>
                                <g:if test="${usuarioInstance?.empresa}">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Empresa:</label>
                                        ${usuarioInstance?.empresa?.encodeAsHTML()}
                                    </div>
                                </g:if>                                    
                                <g:if test="${usuarioInstance?.email}">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Correo electrónico:</label>
                                        <g:fieldValue bean="${usuarioInstance}" field="email"/>
                                    </div>
                                </g:if>
                                <g:if test="${usuarioInstance?.enabled}">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Cuenta Activa:</label>
                                        <g:formatBoolean boolean="${usuarioInstance?.enabled}"  true="Sí" false="No"  />
                                    </div>
                                </g:if>
                                <g:if test="${usuarioInstance?.accountLocked}">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Cuenta Bloqueada:</label>
                                        <g:formatBoolean boolean="${usuarioInstance?.accountLocked}"  true="Sí" false="No"  />
                                    </div><br>
                                </g:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--PAGE-->

    </body>
</html>
