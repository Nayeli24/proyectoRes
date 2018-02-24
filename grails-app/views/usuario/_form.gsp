<%@ page import="pruebaSeguridad.Usuario" %>
<%@ page import="pruebaSeguridad.UsuarioRole" %>

<div class="form-group">
    <label class="col-sm-3 control-label" for="username"> Username:
        <span class="required-indicator">*</span></label>
    <div class="col-sm-9">
        <input class="form-control" name="username" required="" value="${usuarioInstance?.username}" placeholder="Username" type="text">
    </div>
</div>

<div class="form-group">
    <label class="col-sm-3 control-label" for="password"> Contraseña:
        <span class="required-indicator">*</span></label>
    <div class="col-sm-9">
        <input  class="form-control" name="password" required="" value="${usuarioInstance?.password}" placeholder="Password" type="password">
    </div>
</div>

<div class="form-group">
    <label class="col-sm-3 control-label" for="Nombre"> Nombre:
        <span class="required-indicator">*</span></label>
    <div class="col-sm-9">
        <input class="form-control" name="nombre" required="" value="${usuarioInstance?.nombre}" placeholder="Nombre" type="text">
    </div>
</div>

<div class="form-group">
    <label class="col-sm-3 control-label" for="apellidoPat"> Apellido paterno:
        <span class="required-indicator">*</span></label>
    <div class="col-sm-9">
        <input class="form-control" name="apellidoPat" required="" value="${usuarioInstance?.apellidoPat}" placeholder="Apellido paterno" type="text">
    </div>
</div>

<div class="form-group">
    <label class="col-sm-3 control-label" for="apellidoMat"> Apellido materno:
        <span class="required-indicator">*</span></label>
    <div class="col-sm-9">
        <input class="form-control" name="apellidoMat" required="" value="${usuarioInstance?.apellidoMat}" placeholder="Apellido materno" type="text">
    </div>
</div>

<div class="form-group">
    <label class="col-sm-3 control-label" for="areaDpto"> Área / Departamento:
        <span class="required-indicator">*</span></label>
    <div class="col-sm-9">
        <input class="form-control" name="areaDpto" required="" value="${usuarioInstance?.areaDpto}" placeholder="Área/Dep" type="text">
    </div>
</div>

<div class="form-group">
    <label class="col-sm-3 control-label" for="empresa"> Empresa:</label>
    <div class="col-sm-9">
        <g:select id="empresa" name="empresa.id" from="${pruebaSeguridad.Empresa.list()}" optionKey="id" value="${usuarioInstance?.empresa?.id}" class="form-control" noSelection="['null': 'Selecciona una empresa']"/>
    </div>
</div>

<div class="form-group">
    <label class="col-sm-3 control-label" for="email"> Correo electrónico:
        <span class="required-indicator">*</span></label>
    <div class="col-sm-9">
        <input type="email" class="form-control" name="email" required="" value="${usuarioInstance?.email}" placeholder="ejemplo@gmail.com" >
    </div> 
</div>

<div class="form-group">
    <label class="col-sm-3 control-label" > Opciones de cuenta:</label>
    <div class="col-sm-9">
        <label class="checkbox-inline" for="accountExpired">
            <input name="accountExpired"  value="${usuarioInstance?.accountExpired}" type="checkbox"> Cuenta expirada
        </label>
        <label class="checkbox-inline" for="accountLocked">
            <input name="accountLocked" value="${usuarioInstance?.accountLocked}" type="checkbox"> Cuenta bloqueada
        </label>
        <label class="checkbox-inline" for="enabled">
            <input name="enabled" value="${usuarioInstance?.enabled}" type="checkbox"> Cuenta habilitada
        </label>
        <label class="checkbox-inline" for="passwordExpired">
            <input name="enabled" value="${usuarioInstance?.passwordExpired}" type="checkbox"> Expiró contraseña
        </label>

    </div> 
</div>

<div class="form-group">
    <label class="col-sm-3 control-label" > Tipo de usuario:</label>
    <div class="col-sm-9">
        <label class="checkbox-inline">
             <input type="radio" name="rolUsuario" value="cliente"> Cliente   </label>
        <label class="checkbox-inline">
            <input name="rolUsuario"  value="empleado"  type="radio" > Empleado Nuuptech
        </label>
        <label class="checkbox-inline" >
            <input name="rolUsuario"  value="admin" type="radio" > Administrador
        </label>
    </div>
</div>

