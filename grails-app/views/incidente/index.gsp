
<%@ page import="pruebaSeguridad.Incidente" %>
<%@ page import="pruebaSeguridad.Usuario" %>
<!DOCTYPE html>
<html>
    <head>
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
                    <sec:ifAnyGranted roles='ROLE_DESARROLLADOR'>
                        <sec:access url="/incidente/listarAsignados">
                            <li><g:link controller='incidente' action='listarAsignados'>Incidentes Asignados</g:link></li>
                        </sec:access>
                    </sec:ifAnyGranted>  
                </ul>
            </div>
            <div id="list-incidente" class="content scaffold-list" role="main">
                <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <thead>
                <sec:ifAnyGranted roles='ROLE_DESARROLLADOR'>
                    <tr>
                        <g:sortableColumn property="folio" title="${message(code: 'ticket.folio.label', default: 'Folio')}" />

                        <g:sortableColumn property="descripcion" title="${message(code: 'ticket.descripcion.label', default: 'Descripcion')}" />

                        <th><g:message code="ticket.registradoPor.label" default="Registrado Por" /></th>

                            <g:sortableColumn property="fechaAsignacion" title="${message(code: 'ticket.fechaAsignacion.label', default: 'Fecha Asignacion')}" />

                    </tr>
                </sec:ifAnyGranted>
                <sec:ifAnyGranted roles='ROLE_CLIENTE'>    
                    <tr>
                        <g:sortableColumn property="folio" title="${message(code: 'incidente.folio.label', default: 'Folio')}" />
                        <th><g:message code="Tema" default="Tema" /></th>
                        <th><g:message code="incidente.estatus.label" default="Estatus" /></th>

                    <sec:ifAnyGranted roles='ROLE_ADMIN'>
                        <th><g:message code="incidente.registradoPor.label" default="Registrado Por" /></th>
                    </sec:ifAnyGranted>  

                    <th><g:message code="incidente.fechaRegistro.label" default="Fecha Registro" /></th>

                    <th><g:message code="incidente.asignadoA.label" default="Asignado A" /></th>

                        <g:sortableColumn property="fechaAsignacion" title="${message(code: 'incidente.fechaAsignacion.label', default: 'Fecha Asignacion')}" />

                    </tr>
                </sec:ifAnyGranted>
                </thead>
                <tbody>
                <sec:ifAnyGranted roles='ROLE_DESARROLLADOR'>
                    <g:if test="${asignados}">
                        <g:each name="asignados" in="${asignados}">	
                            <tr >
                                <td  class="left tableTitleColor font12 paddingTop12 paddingRight12 paddingBottom5 paddingLeft10 textUpper">
                                    <g:link action="detalleRevisar" id="${it.id}">${it.folio}</g:link>

                                </td>	
                                <td  class="left tableTitleColor font12 paddingTop12 paddingRight12 paddingBottom5 paddingLeft10 textUpper">
                                    <span class="font14 textlower tableDescriptionColor">${it.descripcion}  </span>
                                </td>	

                                <td  class="left tableTitleColor font12 paddingTop12 paddingRight12 paddingBottom5 paddingLeft10 textUpper">
                                    <span class="font14 textlower tableDescriptionColor">${it.registradoPor?.username}  </span>
                                </td>	
                                <td  class="left tableTitleColor font12 paddingTop12 paddingRight12 paddingBottom5 paddingLeft10 textUpper">
                                    <span class="font14 textlower tableDescriptionColor"><g:formatDate format="dd / MM / yyyy" date="${it.fechaAsignacion}"/></span>
                                </td>	
                            </tr>
                        </g:each>
                    </g:if>
                </sec:ifAnyGranted>
                <sec:ifAnyGranted roles='ROLE_CLIENTE'>
                    <g:each in="${incidenteInstanceList}" status="i" var="incidenteInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                            <td><g:link action="show" id="${incidenteInstance.id}">${fieldValue(bean: incidenteInstance, field: "folio")}</g:link></td>
                            <td>${fieldValue(bean: incidenteInstance, field: "tema")}</td>
                            <td>${fieldValue(bean: incidenteInstance, field: "estatus")}</td>
                        <sec:ifAnyGranted roles='ROLE_ADMIN'>
                            <td>${incidenteInstance?.registradoPor?.username}</td>
                        </sec:ifAnyGranted>  

                        <td><g:formatDate date="${incidenteInstance.fechaRegistro}" /></td>

                        <td>${incidenteInstance?.asignadoA?.username}</td>

                        <td><g:formatDate date="${incidenteInstance.fechaAsignacion}" /></td>

                        </tr>
                    </g:each>
                </sec:ifAnyGranted>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${incidenteInstanceCount ?: 0}" />
            </div>
        </div>
    </body>
</html>
