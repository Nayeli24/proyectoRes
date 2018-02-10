
<%@ page import="pruebaSeguridad.Usuario" %>
<%@ page import="pruebaSeguridad.UsuarioRole"%>
<%@ page import="pruebaSeguridad.Incidente"%>
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
                        <g:sortableColumn property="enabled" title="${message(code: 'usuario.enabled.label', default: 'Enabled')}" />
                        <g:sortableColumn property="role" title="${message(code: 'usuario.role.label', default: 'Tipo usuario')}" />

        <!--<g:sortableColumn property="accountExpired" title="${message(code: 'usuario.accountExpired.label', default: 'Account Expired')}" />

        <g:sortableColumn property="accountLocked" title="${message(code: 'usuario.accountLocked.label', default: 'Account Locked')}" />

        

        <g:sortableColumn property="passwordExpired" title="${message(code: 'usuario.passwordExpired.label', default: 'Password Expired')}" />
        -->
                    </tr>
                </thead>
                <tbody>
                    <g:if test="${usuarios}">
                        <g:each name="asignados" in="${usuarios}">	
                            <tr >
                                <td  class="left tableTitleColor font12 paddingTop12 paddingRight12 paddingBottom5 paddingLeft10 textUpper">
                                    <g:link action="show" id="${it.id}">${it.username}</g:link>
                                    </td>
                                    <td  class="left tableTitleColor font12 paddingTop12 paddingRight12 paddingBottom5 paddingLeft10 textUpper">
                                        <span class="font14 textlower tableDescriptionColor">${it.password}  </span> 
                                </td>
                                <td  class="left tableTitleColor font12 paddingTop12 paddingRight12 paddingBottom5 paddingLeft10 textUpper">
                                    <span class="font14 textlower tableDescriptionColor">${it.enabled}  </span> 	
                                </td>
                                <td  class="left tableTitleColor font12 paddingTop12 paddingRight12 paddingBottom5 paddingLeft10 textUpper">
                                    <span class="font14 textlower tableDescriptionColor" ><g:join in="${it.authorities}"/> </span>
                                </td>	
                            </tr>
                        </g:each>
                    </g:if>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${usuarioInstanceCount ?: 0}" />
            </div>
        </div>
    </body>
</html>
