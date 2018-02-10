
<%@ page import="pruebaSeguridad.Documento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'documento.label', default: 'Documento')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-documento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-documento" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list documento">
			
				<g:if test="${documentoInstance?.incidente}">
				<li class="fieldcontain">
					<span id="incidente-label" class="property-label"><g:message code="documento.incidente.label" default="Incidente" /></span>
					
						<span class="property-value" aria-labelledby="incidente-label"><g:link controller="incidente" action="show" id="${documentoInstance?.incidente?.id}">${documentoInstance?.incidente?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentoInstance?.tipoDoc}">
				<li class="fieldcontain">
					<span id="tipoDoc-label" class="property-label"><g:message code="documento.tipoDoc.label" default="Tipo Doc" /></span>
					
						<span class="property-value" aria-labelledby="tipoDoc-label"><g:link controller="tipoDoc" action="show" id="${documentoInstance?.tipoDoc?.id}">${documentoInstance?.tipoDoc?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentoInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="documento.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${documentoInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentoInstance?.size}">
				<li class="fieldcontain">
					<span id="size-label" class="property-label"><g:message code="documento.size.label" default="Size" /></span>
					
						<span class="property-value" aria-labelledby="size-label"><g:fieldValue bean="${documentoInstance}" field="size"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentoInstance?.fechaSubio}">
				<li class="fieldcontain">
					<span id="fechaSubio-label" class="property-label"><g:message code="documento.fechaSubio.label" default="Fecha Subio" /></span>
					
						<span class="property-value" aria-labelledby="fechaSubio-label"><g:formatDate date="${documentoInstance?.fechaSubio}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentoInstance?.urlArchivo}">
				<li class="fieldcontain">
					<span id="urlArchivo-label" class="property-label"><g:message code="documento.urlArchivo.label" default="Url Archivo" /></span>
					
						<span class="property-value" aria-labelledby="urlArchivo-label"><g:fieldValue bean="${documentoInstance}" field="urlArchivo"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:documentoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${documentoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
