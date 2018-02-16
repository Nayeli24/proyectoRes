<%@ page import="pruebaSeguridad.Comentario" %>



<div class="fieldcontain ${hasErrors(bean: comentarioInstance, field: 'incidente', 'error')} ">
	<label for="incidente">
		<g:message code="comentario.incidente.label" default="Id Incidente" />
		
	</label>
	<g:textField name="incidente" value="${comentarioInstance?.incidente?.id}" readonly="true"/>
	
</div>

<div class="fieldcontain ${hasErrors(bean: comentarioInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="comentario.comentario.label" default="Comentario" />
		<span class="required-indicator">*</span>
	</label>
             <g:textArea cols="30" rows="4" name="descripcion"  required="Escribe un comentario" value="${comentarioInstance?.descripcion}"  style="width:400px; height: 200px;"/>


</div>



