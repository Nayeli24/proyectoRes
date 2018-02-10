<%@ page import="pruebaSeguridad.Role" %>



<div class="fieldcontain ${hasErrors(bean: roleInstance, field: 'authority', 'error')} required">
	<label for="authority">
		<g:message code="role.authority.label" default="Authority" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="authority" required="" value="${roleInstance?.authority}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: roleInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="role.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${roleInstance?.descripcion}"/>

</div>

