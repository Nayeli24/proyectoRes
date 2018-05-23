<%@ page import="pruebaSeguridad.Usuario" %>
<%@ page import="pruebaSeguridad.Incidente" %>
<%@ page import="pruebaSeguridad.UsuarioRole" %>
<!DOCTYPE html>
<html>
    <head>  
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
        <script type="text/javascript" src="https://harvesthq.github.io/chosen/chosen.jquery.js"></script>   
        <link rel="stylesheet" type="text/css" href="https://harvesthq.github.io/chosen/chosen.css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.3.5/sweetalert2.all.min.js"></script>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <script src="${resource (dir: 'js', file: 'usuario.js')}"> </script>
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

                                    <g:if test="${usuarioInstance?.username}">
                                        <div class="form-group">
                                            <br>
                                            <label class="col-sm-3 control-label" for="username">Username:</label>
                                            <div class="col-sm-9">
                                                <input class="form-control" name="username" required="" value="${usuarioInstance?.username}" readonly="true" type="text"/>
                                            </div>
                                        </div>
                                        <br>
                                    </g:if>
                                    <g:if test="${usuarioInstance?.empresa}">
                                        <br>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label" for="empresa">Empresa:</label>
                                            <div class="col-sm-9">
                                                <label  class="col-sm-3 control-label"> ${usuarioInstance?.empresa?.encodeAsHTML()}</label> 
                                            </div><br>
                                        </g:if> 
                                        <br>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label" for="password2"> Contraseña:
                                            </label>
                                            <div class="col-sm-9">
                                                <input name="password" class="form-control" required="" value="${usuarioInstance?.password}" onclick="javascript: limpia(this);" onchange="validaClave()" required=""  placeholder="Contraseña" type="password">
                                            </div>
                                            <br>
                                        </div>
                                        <br>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label" for="password"> Repetir contraseña:
                                            </label>
                                            <div class="col-sm-9">
                                                <input  name="password2" class="form-control" required="" value="${usuarioInstance?.password}"   onclick="javascript: limpia(this);"  onchange="comprobarClave()" name="password" required="" value="" placeholder="Confirmar contraseña" type="password">
                                            </div>
                                            <br>
                                        </div>
                                        <br>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label" for="areaDpto">Área / Departamento:
                                            </label>
                                            <div class="col-sm-9">
                                                <input   class="form-control"  value="${usuarioInstance?.areaDpto}"  id="areaDpto" required="" name="areaDpto" placeholder="Escribe Área/Dep" type="text">
                                                <br>
                                                <select class="chosen-select" name="areaDpto2" id="areaDpto2" readonly="true" value="${usuarioInstance?.areaDpto}" onchange="mostrar2()" >
                                                    <option  selected disabled hidden>Cambiar área</option>
                                                    <option> Dirección General</option>
                                                    <option>Administración y Recursos Humanos</option> 
                                                    <option>Producción</option>
                                                    <option>Finanzas y Contabilidad</option>
                                                    <option>Publicidad y Mercadotecnia</option>
                                                    <option>Sistemas e Informática</option>
                                                    <option>Otro</option>
                                                </select>
                                                <br>
                                            </div>
                                            <br>
                                            <br>
                                            <br>
                                        </div>
                                        <br>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label" for="email"> Correo electrónico:
                                            </label>
                                            <div class="col-sm-9">
                                                <input type="email" class="form-control" required=""  onclick="javascript: limpia(this);" name="email"  placeholder="ejemplo@gmail.com" value="${usuarioInstance.email}">
                                            </div>                                        
                                        </div>
                                        <br>

                                        <br>
                                  
                                        <g:if test="${usuarioInstance?.twitterName}">
                                        <div class="form-group"  id="twitterDiv">
                                            <label class="col-sm-3 control-label" for="twitterName"><i class="fa fa-twitter-square fa-fw"></i>Cuenta Twitter :</label>
                                            <div class="col-sm-9">
                                                <fieldset>
                                                    <label for="d1">@</label>
                                                    <input id="d1" type="text" required=""  onclick="javascript: limpia(this);" name="twitterName"  placeholder="abc12" value="${usuarioInstance.twitterName}">
                                                </fieldset>
                                            </div>
                                            </div>
                                            </g:if>
                                            <br>
                                            <br>
                                            <br>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label" > Opciones de cuenta:</label>
                                                <div class="col-sm-9">
                                                    <label for="accountLocked">
                                                        <g:message code="usuario.accountLocked.label" default="Account Locked" />

                                                    </label>
                                                    <g:checkBox name="accountLocked" value="${usuarioInstance?.accountLocked}" />
                                                    <label for="enabled">
                                                        <g:message code="usuario.enabled.label" default="Enabled" />

                                                    </label>
                                                    <g:checkBox name="enabled" value="${usuarioInstance?.enabled}" />
                                                </div> 
                                                <br>
                                            </div>
                                            <br>
                                            <br>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label" >Agregar tipo de usuario:</label>
                                                <div class="col-sm-9">   
                                                    <g:select id="rolUsuario" name="rolUsuario" from="${pruebaSeguridad.Role.list()}" optionKey="id" multiple="true" class="chosen-select" value="${usuarioInstance?.authorities?.id}" onchange="cambiarRol()" required="" />
                                                </div>
                                                <br><br>
                                            </div>
                                            <div class="form-group" align="center">
                                                <fieldset class="buttons">
                 <!--    <input id="boton" type="button" value="Actualizar" onClick="comprobarClave()" action="update" > 
            -->                                 <g:actionSubmit class="btn btn-success" value="${message(code: 'default.button.actualizar.label', default: 'Actualizar')}" action="update" />
                                                </fieldset>  </div>
                                            </g:form>

                                        <br>
                                    </div>
                                    <script>
                                        $(".chosen-select").chosen();

                                    </script>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>

        </section>

<!--PAGE-->
    </body>
</html>
