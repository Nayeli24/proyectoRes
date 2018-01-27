<%@ page import="pruebaSeguridad.Flujo" %>



<div class="fieldcontain ${hasErrors(bean: flujoInstance, field: 'estatus', 'error')} required">
	<label for="estatus">
		<g:message code="flujo.estatus.label" default="Estatus" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estatus" name="estatus.id" from="${pruebaSeguridad.Estatus.list()}" optionKey="id" required="" value="${flujoInstance?.estatus?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: flujoInstance, field: 'fechaMovimiento', 'error')} required">
	<label for="fechaMovimiento">
		<g:message code="flujo.fechaMovimiento.label" default="Fecha Movimiento" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaMovimiento" precision="day"  value="${flujoInstance?.fechaMovimiento}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: flujoInstance, field: 'incidente', 'error')} required">
	<label for="incidente">
		<g:message code="flujo.incidente.label" default="Incidente" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="incidente" name="incidente.id" from="${pruebaSeguridad.Incidente.list()}" optionKey="id" required="" value="${flujoInstance?.incidente?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: flujoInstance, field: 'usuarioMovimiento', 'error')} required">
	<label for="usuarioMovimiento">
		<g:message code="flujo.usuarioMovimiento.label" default="Usuario Movimiento" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usuarioMovimiento" name="usuarioMovimiento.id" from="${pruebaSeguridad.Usuario.list()}" optionKey="id" required="" value="${flujoInstance?.usuarioMovimiento?.id}" class="many-to-one"/>

</div>

