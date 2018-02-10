<%@ page import="pruebaSeguridad.Empresa" %>



<div class="fieldcontain ${hasErrors(bean: empresaInstance, field: 'nombreEmpresa', 'error')} required">
	<label for="nombreEmpresa">
		<g:message code="empresa.nombreEmpresa.label" default="Nombre Empresa" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombreEmpresa" maxlength="35" required="" value="${empresaInstance?.nombreEmpresa}"/>

</div>

