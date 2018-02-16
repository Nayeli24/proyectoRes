
<%@ page import="pruebaSeguridad.Incidente" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'incidente.label', default: 'Incidente')}" />
        <title><g:message code="Detalle incidente" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-incidente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/incidente/index')}"><g:message code="Página principal"/></a></li> 
                <li><a  href="${createLink(uri: '/incidente/listarRevision')}"><g:message code="Incidentes en Revisión"/></a></li>
                <li>   <li><g:link controller="comentario" action="index" id="${detalle.id}">Comentarios</g:link></li></li>
                <li><g:link class="create" controller="comentario" action="create" id="${detalle.id}"><g:message code="Nuevo Comentario" args="[entityName]" /></g:link></li>
                </ul>
            </div>
            <div id="show-incidente" class="content scaffold-show" role="main">
                <h1><g:message code="Detalle Incidente Asignado" args="[entityName]" /></h1>
            <g:if test="${detalle}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <ol class="property-list incidente">
                <g:if test="${detalle.folio}">
                    <li class="fieldcontain">
                        <span id="descripcion-label" class="property-label"><g:message code="folioIncidente.folio" default="Folio " /></span>

                        <span class="property-value" aria-labelledby="folio-label">${detalle.folio}</span>
                    </li>
                </g:if>
                <g:if test="${detalle.tema}">
                    <li class="fieldcontain">
                        <span id="descripcion-label" class="property-label"><g:message code="folioIncidente.tema" default="Tema" /></span>

                        <span class="property-value" aria-labelledby="folio-label">${detalle.tema}</span>

                    </li>
                </g:if>                         
                <g:if test="${detalle.descripcion}">
                    <li class="fieldcontain">
                        <span id="descripcion-label" class="property-label"><g:message code="folioIncidente.descripcion" default="Descripción" /></span>

                        <span class="property-value" aria-labelledby="folio-label">${detalle.descripcion}</span>

                    </li>
                </g:if>
                <g:if test="${detalle.fechaAsignacion}">
                    <li class="fieldcontain">
                        <span id="descripcion-label" class="property-label"><g:message code="fechaAsisgnacion" default="Fecha De Asignación" /></span>

                        <span class="property-value" aria-labelledby="folio-label"><g:formatDate format="dd / MM / yyyy" date="${detalle.fechaAsignacion}"/></span>

                    </li>
                </g:if>
                <g:if test="${detalle.registradoPor}">
                    <li class="fieldcontain">
                        <span id="descripcion-label" class="property-label"><g:message code="folioIncidente.registradoPor" default="Usuario Que Registró" /></span>

                        <span class="property-value" aria-labelledby="folio-label">${detalle.registradoPor.username}</span>

                    </li>
                </g:if>
                <g:if  test="${detalle.estatus?.id == 4}">
                    <li class="fieldcontain">
                        <span id="descripcion-label" class="property-label"><g:message code="detalle.respuestaPeticion" default="Solucion Peticion" /></span>

                        <span class="property-value" aria-labelledby="folio-label"> ${detalle.respuestaPeticion }</span>

                    </li>
                </g:if>   
            </ol>
            <g:form >
                <fieldset class="buttons">  
                    <g:if test="${detalle.estatus?.id == 3}">
                        <g:form controller="incidente" action="atender">
                            <g:hiddenField name="id"  value="${detalle.id}"/>
                            <g:textArea cols="30" rows="4" name="respuesta"  style="width:400px; height: 200px;"/>
                            <g:actionSubmit  class="edit" value="Atender"/>
                        </g:form>
                    </g:if>
                        <!--<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />-->
                </fieldset>
            </g:form>


        </div>
    </body>
</html>
