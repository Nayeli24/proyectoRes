
<%@ page import="pruebaSeguridad.Incidente" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'incidente.label', default: 'Incidente')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-incidente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/incidente/index')}"><g:message code="Regresar"/></a></li>
                 <sec:ifAnyGranted roles='ROLE_CLIENTE'>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                 </sec:ifAnyGranted>
                </ul>
            </div>
            <div id="show-incidente" class="content scaffold-show" role="main">
                <h1><g:message code="default.show.label" args="[entityName]" /></h1>
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

                        <span class="property-value" aria-labelledby="estatus-label"><g:link controller="estatus" action="show" id="${incidenteInstance?.estatus?.id}">${incidenteInstance?.estatus?.encodeAsHTML()}</g:link></span>

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

                        <span class="property-value" aria-labelledby="registradoPor-label"><g:link controller="usuario" action="show" id="${incidenteInstance?.registradoPor?.id}">${incidenteInstance?.registradoPor?.username}</g:link></span>

                    </li>
                </g:if>

                <g:if test="${incidenteInstance?.asignadoA}">
                    <li class="fieldcontain">
                        <span id="asignadoA-label" class="property-label"><g:message code="incidente.asignadoA.label" default="Asignado A" /></span>

                        <span class="property-value" aria-labelledby="asignadoA-label"><g:link controller="usuario" action="show" id="${incidenteInstance?.asignadoA?.id}">${incidenteInstance?.asignadoA?.encodeAsHTML()}</g:link></span>

                    </li>
                </g:if>

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
            <g:if test="${incidenteInstance?.estatus?.id==1}">
                <g:form url="[resource:incidenteInstance, action:'delete']" method="DELETE">
                    <fieldset class="buttons">
                        <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </fieldset>
                </g:form>
            </g:if>
            <sec:ifAnyGranted roles='ROLE_DESARROLLADOR'>
                <g:form >
                    <fieldset class="buttons">
                        <g:if  test="${incidenteInstance?.estatus?.id == 2}">
                            <g:link class="edit" action="revisar" resource="${incidenteInstance}" id="${incidenteInstance.id}"><g:message code="default.button.revisar.label" default="Revisar" /></g:link>

                        </g:if>    
                        <g:elseif test="${incidenteInstance?.estatus?.id == 3}">
                            <g:form controller="incidente" action="atender">
                                <g:hiddenField name="id"  value="${incidenteInstance.id}"/>
                                <g:textArea cols="30" rows="4" name="respuesta"  style="width:400px; height: 200px;"/>
                                <g:actionSubmit  class="edit" value="Atender"/>
                            </g:form>
                        </g:elseif>
                            <!--<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />-->
                    </fieldset>
                </g:form>
            </sec:ifAnyGranted>

        </div>
    </body>
</html>
