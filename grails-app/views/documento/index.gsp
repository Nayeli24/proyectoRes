
<%@ page import="pruebaSeguridad.Documento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'documento.label', default: 'Documento')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-documento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-documento" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="documento.incidente.label" default="Incidente" /></th>
					
						<th><g:message code="documento.tipoDoc.label" default="Tipo Doc" /></th>
					
						<g:sortableColumn property="nombre" title="${message(code: 'documento.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="size" title="${message(code: 'documento.size.label', default: 'Size')}" />
					
						<g:sortableColumn property="fechaSubio" title="${message(code: 'documento.fechaSubio.label', default: 'Fecha Subio')}" />
					
						<g:sortableColumn property="urlArchivo" title="${message(code: 'documento.urlArchivo.label', default: 'Url Archivo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${documentoInstanceList}" status="i" var="documentoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${documentoInstance.id}">${fieldValue(bean: documentoInstance, field: "incidente")}</g:link></td>
					
						<td>${fieldValue(bean: documentoInstance, field: "tipoDoc")}</td>
					
						<td>${fieldValue(bean: documentoInstance, field: "nombre")}</td>
					
						<td>${fieldValue(bean: documentoInstance, field: "size")}</td>
					
						<td><g:formatDate date="${documentoInstance.fechaSubio}" /></td>
					
						<td>${fieldValue(bean: documentoInstance, field: "urlArchivo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${documentoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
