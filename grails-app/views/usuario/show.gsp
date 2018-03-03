
<%@ page import="pruebaSeguridad.Usuario" %>
<%@ page import="pruebaSeguridad.Incidente" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Detalle de usuario</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
        <meta name="layout" content="main">
    </head>
    <body>
        <a href="#show-usuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
          
            <ul>
                <li><g:link class="list" action="index"><g:message code="Lista de usuarios" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
            <div id="show-usuario" class="content scaffold-show" role="main">
                <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <ol class="property-list usuario">

                <g:if test="${usuarioInstance?.username}">
                    <li class="fieldcontain">
                        <span id="username-label" class="property-label"><g:message code="usuario.username.label" default="Username" /></span>

                        <span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${usuarioInstance}" field="username"/></span>

                    </li>
                </g:if>

                <g:if test="${usuarioInstance?.password}">
                    <li class="fieldcontain">
                        <span id="password-label" class="property-label"><g:message code="usuario.password.label" default="Password" /></span>

                        <span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${usuarioInstance}" field="password"/></span>

                    </li>
                </g:if>

                <g:if test="${usuarioInstance?.nombre}">
                    <li class="fieldcontain">
                        <span id="nombre-label" class="property-label"><g:message code="usuario.nombre.label" default="Nombre" /></span>

                        <span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${usuarioInstance}" field="nombre"/></span>

                    </li>
                </g:if>

                <g:if test="${usuarioInstance?.apellidoPat}">
                    <li class="fieldcontain">
                        <span id="apellidoPat-label" class="property-label"><g:message code="usuario.apellidoPat.label" default="Apellido Pat" /></span>

                        <span class="property-value" aria-labelledby="apellidoPat-label"><g:fieldValue bean="${usuarioInstance}" field="apellidoPat"/></span>

                    </li>
                </g:if>

                <g:if test="${usuarioInstance?.apellidoMat}">
                    <li class="fieldcontain">
                        <span id="apellidoMat-label" class="property-label"><g:message code="usuario.apellidoMat.label" default="Apellido Mat" /></span>

                        <span class="property-value" aria-labelledby="apellidoMat-label"><g:fieldValue bean="${usuarioInstance}" field="apellidoMat"/></span>

                    </li>
                </g:if>

                <g:if test="${usuarioInstance?.areaDpto}">
                    <li class="fieldcontain">
                        <span id="areaDpto-label" class="property-label"><g:message code="usuario.areaDpto.label" default="Area Dpto" /></span>

                        <span class="property-value" aria-labelledby="areaDpto-label"><g:fieldValue bean="${usuarioInstance}" field="areaDpto"/></span>

                    </li>
                </g:if>

                <g:if test="${usuarioInstance?.empresa}">
                    <li class="fieldcontain">
                        <span id="empresa-label" class="property-label"><g:message code="usuario.empresa.label" default="Empresa" /></span>

                        <span class="property-value" aria-labelledby="empresa-label"><g:link controller="empresa" action="show" id="${usuarioInstance?.empresa?.id}">${usuarioInstance?.empresa?.encodeAsHTML()}</g:link></span>

                    </li>
                </g:if>

                <g:if test="${usuarioInstance?.email}">
                    <li class="fieldcontain">
                        <span id="email-label" class="property-label"><g:message code="usuario.email.label" default="Email" /></span>

                        <span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${usuarioInstance}" field="email"/></span>

                    </li>
                </g:if>

                <g:if test="${usuarioInstance?.accountExpired}">
                    <li class="fieldcontain">
                        <span id="accountExpired-label" class="property-label"><g:message code="usuario.accountExpired.label" default="Account Expired" /></span>

                        <span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${usuarioInstance?.accountExpired}" /></span>

                    </li>
                </g:if>

                <g:if test="${usuarioInstance?.accountLocked}">
                    <li class="fieldcontain">
                        <span id="accountLocked-label" class="property-label"><g:message code="usuario.accountLocked.label" default="Account Locked" /></span>

                        <span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${usuarioInstance?.accountLocked}" /></span>

                    </li>
                </g:if>

                <g:if test="${usuarioInstance?.enabled}">
                    <li class="fieldcontain">
                        <span id="enabled-label" class="property-label"><g:message code="usuario.enabled.label" default="Enabled" /></span>

                        <span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${usuarioInstance?.enabled}" /></span>

                    </li>
                </g:if>

                <g:if test="${usuarioInstance?.passwordExpired}">
                    <li class="fieldcontain">
                        <span id="passwordExpired-label" class="property-label"><g:message code="usuario.passwordExpired.label" default="Password Expired" /></span>

                        <span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${usuarioInstance?.passwordExpired}" /></span>

                    </li>
                </g:if>

            </ol>
            <g:form url="[resource:usuarioInstance, action:'delete']" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${usuarioInstance}"><g:message code="Modificar Usuario" default="Modificar Usuario" /></g:link>
               <!--     <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                --></fieldset>
            </g:form>
        </div>
    </body>
</html>
