<%@ page import="pruebaSeguridad.Documento" %>



<div class="fieldcontain ${hasErrors(bean: documentoInstance, field: 'incidente', 'error')} ">
	<label for="incidente">
		<g:message code="documento.incidente.label" default="Incidente" />
		
	</label>
	<g:select id="incidente" name="incidente.id" from="${pruebaSeguridad.Incidente.list()}" optionKey="id" value="${documentoInstance?.incidente?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: documentoInstance, field: 'tipoDoc', 'error')} ">
	<label for="tipoDoc">
		<g:message code="documento.tipoDoc.label" default="Tipo Doc" />
		
	</label>
	<g:select id="tipoDoc" name="tipoDoc.id" from="${pruebaSeguridad.TipoDoc.list()}" optionKey="id" value="${documentoInstance?.tipoDoc?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: documentoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="documento.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${documentoInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: documentoInstance, field: 'size', 'error')} required">
	<label for="size">
		<g:message code="documento.size.label" default="Size" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="size" required="" value="${documentoInstance?.size}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: documentoInstance, field: 'fechaSubio', 'error')} ">
	<label for="fechaSubio">
		<g:message code="documento.fechaSubio.label" default="Fecha Subio" />
		
	</label>
	<g:datePicker name="fechaSubio" precision="day"  value="${documentoInstance?.fechaSubio}" default="none" noSelection="['': '']" />

</div>

<!--<div class="fieldcontain ${hasErrors(bean: documentoInstance, field: 'urlArchivo', 'error')} required">
	<label for="urlArchivo">
		<g:message code="documento.urlArchivo.label" default="Url Archivo" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="url" name="urlArchivo" required="" value="${documentoInstance?.urlArchivo}"/>

</div>
-->
