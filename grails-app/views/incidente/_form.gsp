<%@ page import="pruebaSeguridad.Incidente" %>

<sec:ifAnyGranted roles='ROLE_CLIENTE'>
    <div class="form-group">
        <label class="col-sm-3 control-label" for="folio"> Folio:</label>
        <div class="col-sm-9">
            <input class="form-control" name="folio" required="" value="F000${incidenteInstance?.folio}" readonly="true" type="text">
        </div>
    </div>
    <br>
    <br>

    <div class="form-group">
        <label class="col-sm-3 control-label" for="tema"> Tema:
            <span class="required-indicator">*</span></label>
        <div class="col-sm-9">
            <input class="form-control" name="tema" required="" value="${incidenteInstance?.tema}" placeholder="Tema" type="text">
        </div>
    </div>
    <br>
    <br>
    <div class="form-group">
        <label class="col-sm-3 control-label" for="descripcion"> Descripción:
            <span class="required-indicator">*</span></label>
        <div class="col-sm-9">
            <textarea class="form-control" name="descripcion" required="" value="${incidenteInstance?.descripcion}"  rows="20" cols="40"  placeholder="Escribe tu descripcion..."></textarea>
        </div>
    </div>
    <br>
    <br>
</sec:ifAnyGranted>
<sec:ifAnyGranted roles='ROLE_DESARROLLADOR'>
    <div class="fieldcontain ${hasErrors(bean: incidenteInstance, field: 'solucion', 'error')} required">
        <label for="solucion">
            <g:message code="incidente.solucion.label" default="Solucion" />
            <span class="required-indicator">*</span>
        </label>
        <g:textArea name="solucion" required="" value="${incidenteInstance?.solucion}"  rows="20" cols="40"/>

    </div>
</sec:ifAnyGranted>







