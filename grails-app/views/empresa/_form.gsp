<%@ page import="pruebaSeguridad.Empresa" %>

<div class="form-group">
    <label class="col-sm-3 control-label" for="nombreEmpresa"> Nombre de empresa:
        <span class="required-indicator">*</span></label>
    <div class="col-sm-9">
        <input class="form-control" name="username" required="" value="${empresaInstance?.nombreEmpresa}" placeholder="Nombre de empresa" type="text">
    </div>
</div>
