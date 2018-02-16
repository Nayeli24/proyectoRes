
<%@ page import="pruebaSeguridad.Comentario" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'comentario.label', default: 'Comentario')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-comentario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/incidente/index')}"><g:message code="Pagina principal"/></a></li>
                <sec:access expression="hasRole('ROLE_DESARROLLADOR')">
                    <li><a  href="${createLink(uri: '/incidente/listarRevision')}"><g:message code="Incidentes en revisión"/></a></li>
                </sec:access>
                <li><g:link action="index" id="${comentarioInstance.incidente.id}"><g:message code="Comentarios" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create" id="${comentarioInstance.incidente.id}"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
            <div id="show-comentario" class="content scaffold-show" role="main">
                <h1><g:message code="Detalle Comentario" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <ol class="property-list comentario">

                <g:if test="${comentarioInstance?.incidente}">
                    <li class="fieldcontain">
                        <span id="incidente-label" class="property-label"><g:message code="comentario.incidente.label" default="Tema Incidente" /></span>

                        <span class="property-value" aria-labelledby="incidente-label"><g:link controller="incidente" action="show" id="${comentarioInstance?.incidente?.id}">${comentarioInstance?.incidente?.tema}</g:link></span>

                    </li>
                </g:if>

                <g:if test="${comentarioInstance?.descripcion}">
                    <li class="fieldcontain">
                        <span id="descripcion-label" class="property-label"><g:message code="comentario.descripcion.label" default="Descripcion" /></span>

                        <span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${comentarioInstance}" field="descripcion"/></span>

                    </li>
                </g:if>

                <g:if test="${comentarioInstance?.usuario}">
                    <li class="fieldcontain">
                        <span id="usuario-label" class="property-label"><g:message code="comentario.usuario.label" default="Usuario" /></span>

                        <span class="property-value" aria-labelledby="usuario-label">${comentarioInstance?.usuario?.username}</span>

                    </li>
                </g:if>

            </ol>
            <g:form url="[resource:comentarioInstance, action:'delete']" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${comentarioInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                   <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
