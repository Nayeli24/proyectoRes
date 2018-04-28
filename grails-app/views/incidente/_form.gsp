<%@ page import="pruebaSeguridad.Incidente" %>

<sec:ifAnyGranted roles='ROLE_CLIENTE'>
    <div class="form-group">
        <label class="col-sm-3 control-label" for="folio"> Folio:</label>
        <div class="col-sm-9">
            <input class="form-control" name="folio" required="" value="${incidenteInstance?.folio}" readonly="true" type="text">
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
            <textarea class="form-control" name="descripcion" onkeyup="mostrar();" id="txtCreate" required="" value="${incidenteInstance?.descripcion}"  rows="6" cols="10"  placeholder="Descripción del problema..."></textarea>
        </div>
    </div>
    <br>
    <br>
</sec:ifAnyGranted>








