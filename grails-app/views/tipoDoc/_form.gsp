<%@ page import="pruebaSeguridad.TipoDoc" %>



<div class="fieldcontain ${hasErrors(bean: tipoDocInstance, field: 'tipoDoc', 'error')} required">
	<label for="tipoDoc">
		<g:message code="tipoDoc.tipoDoc.label" default="Tipo Doc" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="tipoDoc" required="" value="${tipoDocInstance?.tipoDoc}"/>

</div>

