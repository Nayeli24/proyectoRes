
<%@ page import="pruebaSeguridad.Usuario" %>
<%@ page import="pruebaSeguridad.Incidente" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-usuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                  <li><a class="home" href="${createLink(uri: '/incidente/index')}"><g:message code="Regresar"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
            <div id="list-usuario" class="content scaffold-list" role="main">
                <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <thead>
                    <tr>

                        <g:sortableColumn property="username" title="${message(code: 'usuario.username.label', default: 'Username')}" />

                        <g:sortableColumn property="password" title="${message(code: 'usuario.password.label', default: 'Password')}" />

                        <g:sortableColumn property="nombre" title="${message(code: 'usuario.nombre.label', default: 'Nombre')}" />

                        <g:sortableColumn property="apellidoPat" title="${message(code: 'usuario.apellidoPat.label', default: 'Apellido Pat')}" />

                        <g:sortableColumn property="apellidoMat" title="${message(code: 'usuario.apellidoMat.label', default: 'Apellido Mat')}" />

                        <g:sortableColumn property="areaDpto" title="${message(code: 'usuario.areaDpto.label', default: 'Area Dpto')}" />

                    </tr>
                </thead>
                <tbody>
                    <g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                            <td><g:link action="show" id="${usuarioInstance.id}">${fieldValue(bean: usuarioInstance, field: "username")}</g:link></td>

                            <td>${fieldValue(bean: usuarioInstance, field: "password")}</td>

                            <td>${fieldValue(bean: usuarioInstance, field: "nombre")}</td>

                            <td>${fieldValue(bean: usuarioInstance, field: "apellidoPat")}</td>

                            <td>${fieldValue(bean: usuarioInstance, field: "apellidoMat")}</td>

                            <td>${fieldValue(bean: usuarioInstance, field: "areaDpto")}</td>

                        </tr>
                    </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${usuarioInstanceCount ?: 0}" />
            </div>
        </div>
    </body>
</html>
