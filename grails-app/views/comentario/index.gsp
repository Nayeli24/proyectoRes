
<%@ page import="pruebaSeguridad.Comentario" %>
<%@ page import="pruebaSeguridad.Incidente" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'comentario.label', default: 'Comentario')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-comentario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><g:link controller="incidente" action="show" id="${id}">Regresar</g:link></li>
                </ul>
            </div>
            <div id="list-comentario" class="content scaffold-list" role="main">
                <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <thead>
                    <tr>
                        <th><g:message code="comentario.usuario.label" default="Usuario" /></th>
                            <g:sortableColumn property="descripcion" title="${message(code: 'comentario.comentario.label', default: 'Comentario')}" />
                    </tr>
                </thead>
                <tbody>
                    <g:if test="${comentariosVer}">
                        <g:each name="comentariosVer" in="${comentariosVer}">	
                            <tr >
                                <td>${it?.usuario?.username}</td>
                                <td><g:link action="show" id="${it.id}">${it.descripcion}</g:link></td>
                                </tr>
                        </g:each>
                    </g:if>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${comentarioInstanceCount ?: 0}" />
            </div>
        </div>
    </body>
</html>
