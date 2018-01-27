
<%@ page import="pruebaSeguridad.Flujo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'flujo.label', default: 'Flujo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-flujo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-flujo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="flujo.estatus.label" default="Estatus" /></th>
					
						<g:sortableColumn property="fechaMovimiento" title="${message(code: 'flujo.fechaMovimiento.label', default: 'Fecha Movimiento')}" />
					
						<th><g:message code="flujo.incidente.label" default="Incidente" /></th>
					
						<th><g:message code="flujo.usuarioMovimiento.label" default="Usuario Movimiento" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${flujoInstanceList}" status="i" var="flujoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${flujoInstance.id}">${fieldValue(bean: flujoInstance, field: "estatus")}</g:link></td>
					
						<td><g:formatDate date="${flujoInstance.fechaMovimiento}" /></td>
					
						<td>${fieldValue(bean: flujoInstance, field: "incidente")}</td>
					
						<td>${fieldValue(bean: flujoInstance, field: "usuarioMovimiento")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${flujoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
