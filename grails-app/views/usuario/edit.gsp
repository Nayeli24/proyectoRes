<%@ page import="pruebaSeguridad.Usuario" %>
<%@ page import="pruebaSeguridad.Incidente" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>



        <section id="page">

            <div id="main-content">
         <!-- /SAMPLE BOX CONFIGURATION MODAL FORM-->
                <div class="container">
                    <div class="row">
                        <div id="content" class="col-lg-12">
                                <!-- PAGE HEADER-->
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="page-header">
                                        <!-- BREADCRUMBS -->
                                        <ul class="breadcrumb">
                                            <li> <i class="fa  fa-eye"></i>Detalle usuario</li>
                                            <li>
                                                <i class="fa fa-pencil-square-o"></i> <g:link class="" action="edit" resource="${usuarioInstance}">Modificar usuario</g:link>
                                                </li>

                                        </ul>
                                        <!-- /BREADCRUMBS -->
                                        <div class="clearfix">
                                            <h3 class="content-title pull-left">Actualizar usuario</h3>
                                        </div>
                                        <div class="description">Modificar caracteriticas del usuario </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /PAGE HEADER -->
                            <div class="box border primary">
                                <div class="box-title">
                                    <h3 class="form-title">Usuario ${usuarioInstance.nombre} ${usuarioInstance.apellidoPat} ${usuarioInstance.apellidoMat}  </h3>
                                </div>                                                    
                                <g:if test="${flash.message}">
                                    <div class="message" role="status">${flash.message}</div>
                                </g:if>
                                <g:hasErrors bean="${usuarioInstance}">
                                    <ul class="errors" role="alert">
                                        <g:eachError bean="${usuarioInstance}" var="error">
                                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                            </g:eachError>
                                    </ul>
                                </g:hasErrors>
                                <g:form url="[resource:usuarioInstance, action:'update']" method="PUT" name="f1">
                                    <g:hiddenField name="version" value="${usuarioInstance?.version}" />

                                    <g:if test="${usuarioInstance?.username}">
                                        <div class="form-group">
                                            <br>
                                            <label class="control-label col-md-3">Username:</label>
                                            <g:fieldValue bean="${usuarioInstance}" field="username"/>
                                        </div>
                                    </g:if>
                                    <g:if test="${usuarioInstance?.empresa}">

                                        <div class="form-group">
                                            <label class="control-label col-md-3">Empresa:</label>
                                            ${usuarioInstance?.empresa?.encodeAsHTML()}
                                        </div>
                                    </g:if> 
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label" for="username"> Contraseña:
                                        </label>
                                        <div class="col-sm-9">
                                            <input name="c1" class="form-control" value="${usuarioInstance?.password}" onclick="javascript: limpia(this);" required=""  placeholder="Contraseña" type="password">
                                        </div>
                                        <br>
                                    </div>
                                    <br>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label" for="password"> Repetir contraseña:
                                        </label>
                                        <div class="col-sm-9">
                                            <input  name="c2" class="form-control"  value="${usuarioInstance?.password}"   onclick="javascript: limpia(this);" name="password" required="" value="" placeholder="Repetir contraseña" type="password">
                                        </div>
                                        <br>
                                    </div>
                                    <br>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label" for="areaDpto">Nueva Área / Departamento:
                                        </label>
                                        <div class="col-sm-9">
                                            <select  class="form-control" name="areaDpto" id="areaDpto" value="${usuarioInstance?.areaDpto}">
                                                <option  selected disabled hidden>Seleccione un área</option>
                                                <option>Dirección General</option>
                                                <option>Administración y Recursos Humanos</option> 
                                                <option>Producción</option>
                                                <option>Finanzas y Contabilidad</option>
                                                <option>Publicidad y Mercadotecnia</option>
                                                <option>Sistemas e Informática</option>
                                                <option>Otro</option>
                                            </select>
                                            <input style="display:none;"  class="form-control" value="${usuarioInstance.areaDpto}"  id="mostrar"  name="areaDpto" value="" placeholder="Área/Dep" type="text">
                                        </div>
                                        <br>

                                    </div>

                                    <br>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label" for="email"> Correo electrónico:
                                        </label>
                                        <div class="col-sm-9">
                                            <input type="email" class="form-control" onclick="javascript: limpia(this);" name="email"  placeholder="ejemplo@gmail.com" value="${usuarioInstance.email}">
                                        </div> 
                                    </div>

                                    <br>
                                    <br>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label" > Opciones de cuenta:</label>
                                        <div class="col-sm-9">
                                            <label class="checkbox-inline" for="accountLocked">
                                                <input name="accountLocked" value="${usuarioInstance?.accountLocked}" type="checkbox" > Cuenta bloqueada</label>
                                                <g:if test="${usuarioInstance?.enabled}">
                                                <label class="checkbox-inline" for="enabled">
                                                    <input name="enabled" value="${usuarioInstance?.enabled}" type="checkbox" checked> Cuenta habilitada</label>
                                                </g:if>
                                        </div> 
                                        <br>
                                    </div>

                                    <br>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label" >Agregar tipo de usuario:</label>
                                        <div class="col-sm-9">
                                            <select class="form-control" name="rolUsuario">
                                                <option selected disabled hidden>Seleccione tipo de usuario</option>
                                                <option  value="cliente" >Cliente</option>
                                                <option  value="empleado">Empleado Nuuptech</option> 
                                                <option  value="admin">Administrador</option>
                                            </select>
                                        </div>
                                        <br>
                                    </div>

                                    <fieldset class="buttons">
     <!--    <input id="boton" type="button" value="Actualizar" onClick="comprobarClave()" action="update" > 
-->                                 <g:actionSubmit onClick="comprobarClave()" class="btn btn-success" value="${message(code: 'default.button.update.label', default: 'Update')}" action="update" />
                                    </fieldset>
                                </g:form>
                                <script>
                                    function comprobarClave(){
                                    c1 = document.f1.c1.value
                                    c2 = document.f1.c2.value
                                    if (c1 == c2){
                                    <g:remoteFunction action="update" />
                                    }else{
                                    alert("Las contraseñas no coinciden")
                                    } 
                                    }
                                    function limpia(elemento)
                                    {
                                    elemento.value = "";
                                    } 
                                </script>
                                <br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--PAGE-->
</body>
</html>
