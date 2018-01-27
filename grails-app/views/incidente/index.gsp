
<%@ page import="pruebaSeguridad.Incidente" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'incidente.label', default: 'Incidente')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-incidente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
                             <sec:ifAnyGranted roles='ROLE_ADMIN'>
                                    <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                                    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                    <li><g:link class="asignar" action="asignar"><g:message code="Asignar" args="" /></g:link></li>
                                </sec:ifAnyGranted>          
                                <sec:ifAnyGranted roles='ROLE_USER'>
                                    <li><g:link class="asignados" action="listarAsignados"><g:message code="Asigandos" args="" /></g:link></li>
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
					<tr>
					
						<g:sortableColumn property="descripcion" title="${message(code: 'incidente.descripcion.label', default: 'Descripcion')}" />
					
						<th><g:message code="incidente.estatus.label" default="Estatus" /></th>
					
						<g:sortableColumn property="folio" title="${message(code: 'incidente.folio.label', default: 'Folio')}" />
					
						<th><g:message code="incidente.registradoPor.label" default="Registrado Por" /></th>
					
						<th><g:message code="incidente.asignadoA.label" default="Asignado A" /></th>
					
						<g:sortableColumn property="fechaAsignacion" title="${message(code: 'incidente.fechaAsignacion.label', default: 'Fecha Asignacion')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${incidenteInstanceList}" status="i" var="incidenteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${incidenteInstance.id}">${fieldValue(bean: incidenteInstance, field: "descripcion")}</g:link></td>
					
						<td>${fieldValue(bean: incidenteInstance, field: "estatus")}</td>
					
						<td>${fieldValue(bean: incidenteInstance, field: "folio")}</td>
					
						<td>${incidenteInstance?.registradoPor?.username}</td>
					
						<td>${fieldValue(bean: incidenteInstance, field: "asignadoA")}</td>
					
						<td><g:formatDate date="${incidenteInstance.fechaAsignacion}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${incidenteInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
