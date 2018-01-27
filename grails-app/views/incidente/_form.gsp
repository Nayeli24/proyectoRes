<%@ page import="pruebaSeguridad.Incidente" %>


<div class="fieldcontain ${hasErrors(bean: incidenteInstance, field: 'folio', 'error')} required">
    <label for="folio">
        <g:message code="incidente.folio.label" default="Folio" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="folio" required="" value="${incidenteInstance?.folio}"/>

</div>
<div class="fieldcontain ${hasErrors(bean: incidenteInstance, field: 'descripcion', 'error')} required">
    <label for="descripcion">
        <g:message code="incidente.descripcion.label" default="Descripcion" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="descripcion" required="" value="${incidenteInstance?.descripcion}"/>

</div>







