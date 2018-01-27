
<%@ page import="pruebaSeguridad.Flujo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'flujo.label', default: 'Flujo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-flujo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-flujo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list flujo">
			
				<g:if test="${flujoInstance?.estatus}">
				<li class="fieldcontain">
					<span id="estatus-label" class="property-label"><g:message code="flujo.estatus.label" default="Estatus" /></span>
					
						<span class="property-value" aria-labelledby="estatus-label"><g:link controller="estatus" action="show" id="${flujoInstance?.estatus?.id}">${flujoInstance?.estatus?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${flujoInstance?.fechaMovimiento}">
				<li class="fieldcontain">
					<span id="fechaMovimiento-label" class="property-label"><g:message code="flujo.fechaMovimiento.label" default="Fecha Movimiento" /></span>
					
						<span class="property-value" aria-labelledby="fechaMovimiento-label"><g:formatDate date="${flujoInstance?.fechaMovimiento}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${flujoInstance?.incidente}">
				<li class="fieldcontain">
					<span id="incidente-label" class="property-label"><g:message code="flujo.incidente.label" default="Incidente" /></span>
					
						<span class="property-value" aria-labelledby="incidente-label"><g:link controller="incidente" action="show" id="${flujoInstance?.incidente?.id}">${flujoInstance?.incidente?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${flujoInstance?.usuarioMovimiento}">
				<li class="fieldcontain">
					<span id="usuarioMovimiento-label" class="property-label"><g:message code="flujo.usuarioMovimiento.label" default="Usuario Movimiento" /></span>
					
						<span class="property-value" aria-labelledby="usuarioMovimiento-label"><g:link controller="usuario" action="show" id="${flujoInstance?.usuarioMovimiento?.id}">${flujoInstance?.usuarioMovimiento?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:flujoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${flujoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
