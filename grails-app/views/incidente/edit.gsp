<%@ page import="pruebaSeguridad.Incidente" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'incidente.label', default: 'Incidente')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-incidente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link action="show" id="${incidenteInstance.id}"><g:message code="Regresar" args="" /></g:link></li>
                                  <sec:ifAnyGranted roles='ROLE_DESARROLLADOR'>
                               <li><g:link controller="documento" action="importarArchivos" id="${incidenteInstance.id}" ><g:message code="Documentos" args="" /></g:link></li>   
                                </sec:ifAnyGranted>
			</ul>
		</div>
		<div id="edit-incidente" class="content scaffold-edit" role="main">
			<h1><g:message code="Atender Incidente" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${incidenteInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${incidenteInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:incidenteInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${incidenteInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
