<%@ page import="pruebaSeguridad.Empresa" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Nuevo usuario</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
        <meta name="layout" content="main">

        <g:external dir="js/jquery" file="jquery-2.0.3.min.js" />
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
        <script type="text/javascript" src="https://harvesthq.github.io/chosen/chosen.jquery.js"></script>   
        <link rel="stylesheet" type="text/css" href="https://harvesthq.github.io/chosen/chosen.css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.3.5/sweetalert2.all.min.js"></script>
        <script src="${resource (dir: 'js', file: 'usuario.js')}"> </script>
    </head>
    <body >
<!-- PAGE -->
        <section id="page">
            <div id="main-content">
            <!-- SAMPLE BOX CONFIGURATION MODAL FORM-->
                <div class="modal fade" id="box-config" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title">Box Settings</h4>
                            </div>
                            <div class="modal-body">
                                Here goes box setting content.
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>
              <!-- /SAMPLE BOX CONFIGURATION MODAL FORM-->
                <div class="container">
                    <div class="row">
                        <div id="content" class="col-lg-12">
                                <!-- PAGE HEADER-->
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="page-header">
                                            <!-- STYLER -->

<!-- /STYLER -->

                                        <div class="clearfix">
                                            <h3 class="content-title pull-left">Nuevo usuario</h3>
                                        </div>
                                        <div class="description">Crear nuevo usuario</div>
                                    </div>
                                </div>
                            </div>
                            <!-- /PAGE HEADER -->
                            <div class="box border primary">
                                <div class="box-title">
                                    <h3 class="form-title">Registrar usuario</h3>
                                </div>
                                <div class="box-body big">
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
                                    <g:form name="f1" id="formCrearUsuario" method="post" class="form-horizontal" role="form" url="[resource:usuarioInstance, action:'save']">
                                        <input type="hidden" name="idusuario" id="idusuario" value="${detalle.id}"  >
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label" > Tipo de usuario:</label>
                                            <div class="col-sm-9">
                                                <g:select id="rolUsuario" name="rolUsuario" from="${pruebaSeguridad.Role.list()}" optionKey="id" multiple="true" class="chosen-select" value="${usuarioInstance?.authorities?.id}" onchange="usernameCrear()" required=""  />
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label" for="Nombre"> Nombre:
                                                <span class="required-indicator">*</span></label>
                                            <div class="col-sm-9">
                                                <input class="form-control" name="nombre" required="" value="${usuarioInstance?.nombre}" placeholder="Nombre" type="text"  onchange="usernameCrear()" onKeyUp="validar2(this)" onkeypress="return validar(event)">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label" for="apellidoPat"> Apellido paterno:
                                                <span class="required-indicator">*</span></label>
                                            <div class="col-sm-9">
                                                <input class="form-control" name="apellidoPat" required="" value="${usuarioInstance?.apellidoPat}" placeholder="Apellido paterno" type="text" onkeyup="validar2(this)" onchange="usernameCrear()" onkeypress="return validar(event)" >
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label" for="apellidoMat"> Apellido materno:
                                                <span class="required-indicator">*</span></label>
                                            <div class="col-sm-9">
                                                <input class="form-control" name="apellidoMat" required="" value="${usuarioInstance?.apellidoMat}" placeholder="Apellido materno" type="text" onkeyup="validar2(this)" onchange="usernameCrear()" onkeypress="return validar(event)">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label" for="areaDpto"> Área / Departamento:
                                                <span class="required-indicator">*</span></label>
                                            <div class="col-sm-9">
                                                <select  required="" class="chosen-select" name="areaDpto" id="areaDpto"  onchange="mostrar3();">
                                                    <option >Dirección General</option>
                                                    <option >Administración y Recursos Humanos</option> 
                                                    <option >Producción</option>
                                                    <option >Finanzas y Contabilidad</option>
                                                    <option >Publicidad y Mercadotecnia</option>
                                                    <option >Sistemas e Informática</option>
                                                    <option >Otro</option>
                                                </select>
                                                <br>
                                                <br>
                                                <input style="display:none;"  class="form-control"  id="mostrar" name="areaDpto" value="${usuarioInstance?.areaDpto}" placeholder="Área/Dep" type="text">
                                            </div>

                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label" for="empresa"> Empresa:</label>
                                            <span class="required-indicator">*</span></label>
                                            <div class="col-sm-9">
                                                <g:select  id="empresa" name="empresa"  from="${detalle.empresas}"  value="${usuarioInstance?.empresa?.id}" class="form-control" optionKey="id" optionValue="nombreEmpresa" onchange="usernameCrear()"/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="alert alert-danger">
                                                <g:message code="Importante proporcionar el correo electrónico correcto" />
                                            </div>
                                            <label class="col-sm-3 control-label" for="email"> Correo electrónico:
                                                <span class="required-indicator">*</span></label>
                                            <div class="col-sm-9">

                                                <input type="email" class="form-control" name="email" required="" value="${usuarioInstance?.email}" placeholder="ejemplo@gmail.com"  >
                                            </div> 
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label" for="username"> Username:
                                                <span class="required-indicator">*</span></label>
                                            <div class="col-sm-9">
                                                <input class="form-control" name="username" readonly required="" id="username" value="${usuarioInstance?.username}" placeholder="Username" type="text" onblur="v(this)"  >
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label" for="password"> Contraseña:
                                                <span class="required-indicator">*</span></label>
                                            <div class="col-sm-9">
                                                <input  class="form-control" name="password" required="" placeholder="Contraseña" type="password" onchange="validaClave()" >
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label" for="password"> Confirmar contraseña:
                                                <span class="required-indicator">*</span></label>
                                            <div class="col-sm-9">
                                                <input  class="form-control" name="password2" required="" value="${usuarioInstance?.password}" placeholder="Confirmación de contraseña" type="password" onchange="comprobarClave()">
                                            </div>
                                        </div>
                                        <div class="form-group" style="display:none;" id="twitterDiv">
                                            <label class="col-sm-3 control-label" for="twitterName"><i class="fa  fa-twitter fa-fw"></i>Twittter:
                                                <span class="required-indicator">*</span></label>
                                            <div class="col-sm-9">
                                                <span>@ </span><input id="twitter"  name="twitterName" value="${usuarioInstance?.twitterName}">
                                            </div>
                                        </div>
                                        <fieldset class="buttons">
                                            <g:submitButton name="create" onclick="comprobarClave()" class="btn btn-success" value="Agregar usuario" />
                                        </fieldset>
                                    </g:form>

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