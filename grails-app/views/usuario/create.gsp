<%@ page import="pruebaSeguridad.Empresa" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Nuevo usuario</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
        <meta name="layout" content="main">
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
                                                <select  required="" class="form-control" name="rolUsuario" id="rolUsuario" onchange="usernameCrear()">
                                                    <option  value="cliente" selected="true">Cliente</option>
                                                    <option  value="empleado">Empleado Nuuptech</option> 
                                                    <option  value="admin">Administrador</option>
                                                </select>
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
                                                <select  required="" class="form-control" name="areaDpto" id="areaDpto" >
                                                    <option onclick="mostrar()">Dirección General</option>
                                                    <option onclick="mostrar()">Administración y Recursos Humanos</option> 
                                                    <option onclick="mostrar()">Producción</option>
                                                    <option onclick="mostrar()">Finanzas y Contabilidad</option>
                                                    <option onclick="mostrar()">Publicidad y Mercadotecnia</option>
                                                    <option onclick="mostrar()">Sistemas e Informática</option>
                                                    <option onclick="mostrar()">Otro</option>
                                                </select>
                                                <input style="display:none;" class="form-control"  id="mostrar" name="areaDpto" value="${usuarioInstance?.areaDpto}" placeholder="Área/Dep" type="text">
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
                                        <fieldset class="buttons">
                                            <g:submitButton name="create" onclick="comprobarClave()" class="btn btn-success" value="Agregar usuario" />
                                            <button id="btn-load" class="btn btn-primary" >Click to Refresh</button>
                                        </fieldset>
                                    </g:form>

                                    <script type="text/javascript">
                                        function comprobarClave()
                                        {
                                        password = document.f1.password.value
                                        password2 = document.f1.password2.value
                                        if (password == password2)
                                        {    
                                        }else
                                        {
                                        alert("Las contraseñas no coinciden")
                                        document.f1.password.value="";
                                        document.f1.password2.value="";
                                        } 
                                        }


                                        function validaClave()
                                        {
                                        password=document.f1.password.value
                                        var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])([A-Za-z\d$@$!%*?&]|[^ ]){8,15}$/;                                        
                                        if(regex.test(password))
                                        {
                                        }
                                        else{
                                        alert("La contraseña debe cumplir con:\n*Longitud mínimo 8 carácteres\n*Al menos una letra mayúscula\n*Al menos una letra minúscula\n*Al menos un dígito\n*No espacios en blanco\n*Al menos 1 carácter especial")
                                        document.f1.password.value="";
                                        }
                                        }


                                        function validar(e)
                                        {
                                        tecla = (document.all) ? e.keyCode : e.which;
                                        if (tecla==8 || tecla==9  || tecla==13) return true;
                                        patron =/^[A-Za-zñÑ\s]/; 
                                        te = String.fromCharCode(tecla);
                                        return patron.test(te); 
                                        }


                                        function limpia(elemento)
                                        {
                                        elemento.value = "";
                                        } 


                                        function mostrar()
                                        {
                                        var combo = document.getElementById("areaDpto");
                                        var selected = combo.options[combo.selectedIndex].text;
                                        if(selected== "Otro") 
                                        {                                  
                                        document.getElementById('mostrar').style.display = 'block';
                                        }else{
                                        document.getElementById('mostrar').style.display = 'none';
                                        }
                                        }


                                        function usernameCrear(){
                                        var clave;
                                        var idusuario= document.f1.idusuario.value
                                        var nombre = (document.f1.nombre.value).trim()
                                        var subCadena = nombre.substring(0,1);
                                        var apellidoMat=(document.f1.apellidoMat.value).trim()
                                        var subCadena2 = apellidoMat.substring(0,1);
                                        var apellidoPat=(document.f1.apellidoPat.value).trim()
                                        var combo = document.getElementById("rolUsuario");
                                        var selected = combo.options[combo.selectedIndex].text;
                                        if(selected== "Cliente") 
                                        {
                                        var tipoUser="E"
                                        }else{
                                        var tipoUser="I"
                                        document.f1.empresa.value=1;
                                        }
                                        var empresa= document.f1.empresa.value
                                        if(empresa <= 9)
                                        {
                                        var noEmpresa="0"+empresa
                                        }else{
                                        var noEmpresa=empresa
                                        }
                                        if(idusuario<=9)
                                        {
                                        clave="000"+idusuario
                                        }else if(idusuario <= 99)
                                        {
                                        clave="00"+idusuario
                                        }else if(idusuario <= 999)
                                        {
                                        clave="0"+idusuario
                                        }
                                        else{
                                        clave=idusuario
                                        }
                                        var cadena =tipoUser+noEmpresa+subCadena.toUpperCase()+apellidoPat.toUpperCase()+subCadena2.toUpperCase()+clave;
                                        var patron = / /g;
                                        var nuevoValor    = "";
                                        var nuevaCadena = cadena.replace(patron, nuevoValor);
                                           console.log(nuevaCadena); 
                                      
                                        document.f1.username.value=nuevaCadena
                                       
                                        
                                        
                                        }


                                        function vNom(solicitar)
                                        {
                                        var txt = solicitar.value;
                                        solicitar.value = (txt.substring(0,1).toUpperCase() + txt.substring(1,txt.length)).trim();
                                        }

                                        function validar2(solicitar)
                                        {
                                        var index;
                                        var tmpStr;
                                        var tmpChar;
                                        var preString;
                                        var postString;
                                        var strlen;
                                        tmpStr = solicitar.value.toLowerCase();
                                        strLen = tmpStr.length;
                                            if (strLen > 0)
                                        {
                                        for (index = 0; index < strLen; index++)
                                        {
                                        if (index == 0)
                                        {
                                        tmpChar = tmpStr.substring(0,1).toUpperCase();
                                        postString = tmpStr.substring(1,strLen);
                                        tmpStr = tmpChar + postString;
                                        }
                                        else
                                        {
                                        tmpChar = tmpStr.substring(index, index+1);
                                        if (tmpChar == " " && index < (strLen-1))
                                        {
                                        tmpChar = tmpStr.substring(index+1, index+2).toUpperCase();
                                        preString = tmpStr.substring(0, index+1);
                                        postString = tmpStr.substring(index+2,strLen);
                                        tmpStr = preString + tmpChar + postString;
                                        }
                                        }
                                        }
                                        }
                                        solicitar.value = tmpStr;
                                        }

                                        $("#btn-load").click(function(event) {
                                        $("#formCrearUsuario")[0].reset();
                                        });

                                        $(function(){
                                        $('#areaDpto').mousedown(function(){
                                        if ($('#areaDpto').val() == "Otro" ){
                                        $('#mostrar').show();
                                        } else {
                                        $('#mostrar').css("display","none");
                                        } 
                                        });
                                        });

                                        function v(texto){
                                        var cadena =texto.value,
                                        patron = / /g,
                                        nuevoValor    = "",
                                        nuevaCadena = cadena.replace(patron, nuevoValor);
                                           console.log(nuevaCadena); 
                                        return nuevaCadena;
                                     
                                        }
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
