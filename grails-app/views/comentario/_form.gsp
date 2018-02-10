<%@ page import="pruebaSeguridad.Comentario" %>



<div class="fieldcontain ${hasErrors(bean: comentarioInstance, field: 'incidente', 'error')} ">
	<label for="incidente">
		<g:message code="comentario.incidente.label" default="Incidente" />
		
	</label>
	<g:select id="incidente" name="incidente.id" from="${pruebaSeguridad.Incidente.list()}" optionKey="id" value="${comentarioInstance?.incidente?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: comentarioInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="comentario.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${comentarioInstance?.descripcion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: comentarioInstance, field: 'usuario', 'error')} ">
	<label for="usuario">
		<g:message code="comentario.usuario.label" default="Usuario" />
		
	</label>
	<g:select id="usuario" name="usuario.id" from="${pruebaSeguridad.Usuario.list()}" optionKey="id" value="${comentarioInstance?.usuario?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

