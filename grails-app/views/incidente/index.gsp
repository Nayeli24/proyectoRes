
<%@ page import="pruebaSeguridad.Incidente" %>
<%@ page import="pruebaSeguridad.Usuario" %>
<!DOCTYPE html>
<html>
    <head>
       
        <r:require modules="bootstrap"/>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'incidente.label', default: 'Incidente')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav" role="navigation">
            <ul>
                <li><sec:loggedInUserInfo field="username"/></li>
                <sec:ifLoggedIn>
                    <li><g:link controller="logout">Cerrar Sesion</g:link></li>
                    </sec:ifLoggedIn>

                <sec:ifAnyGranted roles='ROLE_CLIENTE'>
                    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </sec:ifAnyGranted>
                    <sec:ifAnyGranted roles='ROLE_ADMIN'>
                        <li><g:link controller="usuario" action="index">Usuarios registrados</g:link></li>
                    <li><g:link controller="empresa" action="index">Empresas </g:link></li>
                    <li><g:link class="asignar" action="asignar"><g:message code="Asignar incidente" args="" /></g:link></li>
                    </sec:ifAnyGranted>
                    <sec:access expression="hasRole('ROLE_DESARROLLADOR')">
                        <li><g:link  action="listarRevision"><g:message code="Incidentes en Revisión" args="[entityName]" /></g:link></li>
                    </sec:access>
                </ul>
            </div>
            <div id="list-incidente" class="content scaffold-list" role="main">
                <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <thead>

                    <tr>
                        <g:sortableColumn property="folio" title="${message(code: 'ticket.folio.label', default: 'Folio')}" />
                        <g:sortableColumn property="tema" title="${message(code: 'ticket.descripcion.label', default: 'Tema')}" />
                        <th><g:message code="incidente.estatus.label" default="Estatus" /></th>
                        <th><g:message code="incidente.fechaRegistro.label" default="Fecha Registro" /></th>
                <sec:ifAnyGranted roles='ROLE_DESARROLLADOR, ROLE_ADMIN'>
                    <th><g:message code="ticket.registradoPor.label" default="Registrado Por" /></th>
                        <g:sortableColumn property="fechaAsignacion" title="${message(code: 'incidente.fechaAsignacion.label', default: 'Fecha Asignacion')}" />
                </sec:ifAnyGranted>
                <sec:ifAnyGranted roles='ROLE_ADMIN'>
                    <th><g:message code="incidente.asignadoA.label" default="Asignado A" /></th>
                </sec:ifAnyGranted>
                </tr>

                </thead>
                <tbody>

                    <g:if test="${incidentesVer}">
                        <g:each name="incidentesVer" in="${incidentesVer}">	
                            <tr >
                                <td><g:link action="show" id="${it.id}">${it.folio}</g:link></td>
                                <td>${it.tema}</td>
                                <td>${it.estatus}</td>
                                <td><g:formatDate format="dd / MM / yyyy" date="${it.fechaRegistro}" /></td>
                        <sec:ifAnyGranted roles='ROLE_DESARROLLADOR, ROLE_ADMIN'>
                            <td>${it?.registradoPor?.username}</td>
                            <td><g:formatDate  date="${it.fechaAsignacion}" /></td>
                        </sec:ifAnyGranted>
                        <sec:ifAnyGranted roles='ROLE_ADMIN'>
                            <td>${it?.asignadoA?.username}</td>
                        </sec:ifAnyGranted>
                        </tr>
                    </g:each>
                </g:if>

                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${incidenteInstanceCount ?: 0}" />
            </div>
        </div>
    </body>
</html>
