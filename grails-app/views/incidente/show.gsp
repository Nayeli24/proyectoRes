
<%@ page import="pruebaSeguridad.Incidente" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Detalle incidente</title>
<!--        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">-->
        <meta name="layout" content="main">
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
                                        <div class="clearfix">
                                            <h3 class="content-title pull-left">Detalle de incidente</h3>
                                        </div>
                                        <div class="description">Caracteristicas de incidente </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /PAGE HEADER -->
                            <div class="box border primary">
                                <div class="box-title">
                                    <h3 class="form-title">Detalle de incidente</h3>
                                </div>                                                    
                                <div>
                                   
                                    <g:if test="${flash.message}">
                                        <div class="message" role="status">${flash.message}</div>
                                    </g:if>
                                    <ol class="property-list incidente">
                                        <g:if test="${incidenteInstance?.tema}">
                                            <li class="fieldcontain">
                                                <span id="descripcion-label" class="property-label"><g:message code="incidente.tema.label" default="Tema" /></span>

                                                <span class="property-value" aria-labelledby="tema-label"><g:fieldValue bean="${incidenteInstance}" field="tema"/></span>

                                            </li>
                                        </g:if>

                                        <g:if test="${incidenteInstance?.descripcion}">
                                            <li class="fieldcontain">
                                                <span id="descripcion-label" class="property-label"><g:message code="incidente.descripcion.label" default="Descripcion" /></span>

                                                <span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${incidenteInstance}" field="descripcion"/></span>

                                            </li>
                                        </g:if>

                                        <g:if test="${incidenteInstance?.estatus}">
                                            <li class="fieldcontain">
                                                <span id="estatus-label" class="property-label"><g:message code="incidente.estatus.label" default="Estatus" /></span>

                                                <span class="property-value" aria-labelledby="estatus-label">${incidenteInstance?.estatus?.encodeAsHTML()}</span>

                                            </li>
                                        </g:if>

                                        <g:if test="${incidenteInstance?.folio}">
                                            <li class="fieldcontain">
                                                <span id="folio-label" class="property-label"><g:message code="incidente.folio.label" default="Folio" /></span>

                                                <span class="property-value" aria-labelledby="folio-label"><g:fieldValue bean="${incidenteInstance}" field="folio"/></span>

                                            </li>
                                        </g:if>

                                        <g:if test="${incidenteInstance?.registradoPor}">
                                            <li class="fieldcontain">
                                                <span id="registradoPor-label" class="property-label"><g:message code="incidente.registradoPor.label" default="Registrado Por" /></span>
                                            <sec:ifAnyGranted roles='ROLE_ADMIN'>
                                                <span class="property-value" aria-labelledby="registradoPor-label"><g:link controller="usuario" action="show" id="${incidenteInstance?.registradoPor?.id}">${incidenteInstance?.registradoPor?.username}</g:link></span>
                                                </sec:ifAnyGranted >
                                                <span class="property-value" aria-labelledby="asignadoA-label">${incidenteInstance?.registradoPor?.username}</span>
                                            </li>
                                        </g:if>
                                        <sec:ifAnyGranted roles='ROLE_ADMIN'>
                                            <g:if test="${incidenteInstance?.asignadoA}">
                                                <li class="fieldcontain">
                                                    <span id="asignadoA-label" class="property-label"><g:message code="incidente.asignadoA.label" default="Asignado A" /></span>
                                                    <span class="property-value" aria-labelledby="asignadoA-label"><g:link controller="usuario" action="show" id="${incidenteInstance?.asignadoA?.id}">${incidenteInstance?.asignadoA?.username}</g:link></span>
                                                    </li>
                                            </g:if>
                                        </sec:ifAnyGranted>

                                        <g:if test="${incidenteInstance?.fechaAsignacion}">
                                            <li class="fieldcontain">
                                                <span id="fechaAsignacion-label" class="property-label"><g:message code="incidente.fechaAsignacion.label" default="Fecha Asignacion" /></span>

                                                <span class="property-value" aria-labelledby="fechaAsignacion-label"><g:formatDate date="${incidenteInstance?.fechaAsignacion}" /></span>

                                            </li>
                                        </g:if>

                                        <g:if test="${incidenteInstance?.fechaRegistro}">
                                            <li class="fieldcontain">
                                                <span id="fechaRegistro-label" class="property-label"><g:message code="incidente.fechaRegistro.label" default="Fecha Registro" /></span>

                                                <span class="property-value" aria-labelledby="fechaRegistro-label"><g:formatDate format="dd / MM / yyyy" date="${incidenteInstance?.fechaRegistro}" /></span>

                                            </li>
                                        </g:if>

                                    </ol>
                                    <g:if test="${incidenteInstance?.estatus?.id==4}">
                                        <g:if test="${incidenteInstance?.solucion}">
                                            <li class="fieldcontain">
                                                <span id="descripcion-label" class="property-label"><g:message code="incidente.solucion.label" default="Solución" /></span>

                                                <span class="property-value" aria-labelledby="solucion-label"><g:fieldValue bean="${incidenteInstance}" field="solucion"/></span>

                                            </li>
                                        </g:if>
                                        <sec:ifAnyGranted roles='ROLE_CLIENTE'>
                                            <g:form url="[resource:incidenteInstance, action:'cerrarIncidente']">
                                                <fieldset class="buttons">
                                                    <g:actionSubmit   value="Cerrar Incidente"/> </fieldset>
                                                </g:form>

                                        </sec:ifAnyGranted>
                                    </g:if>
                                    <g:if test="${incidenteInstance?.estatus?.id==1}">
                                        <g:form url="[resource:incidenteInstance, action:'delete']" method="DELETE">
                                            <fieldset class="buttons">
                                                <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                            </fieldset>
                                        </g:form>
                                    </g:if>
                                    <g:if test="${incidenteInstance?.estatus?.id==5}">

                                        <sec:ifAnyGranted roles='ROLE_ADMIN'>
                                            <g:form url="[resource:incidenteInstance, action:'enviarEmail']">
                                                <fieldset class="buttons">
                                                    <g:actionSubmit value="Enviar Email"/> </fieldset>
                                                </g:form>

                                        </sec:ifAnyGranted>
                                    </g:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--PAGE-->
    </body>
</html>
