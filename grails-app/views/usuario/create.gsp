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
                                                <input class="form-control" name="nombre" required="" value="${usuarioInstance?.nombre}" placeholder="Nombre" type="text" onkeyup="vNom(this)" onchange="usernameCrear()">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label" for="apellidoPat"> Apellido paterno:
                                                <span class="required-indicator">*</span></label>
                                            <div class="col-sm-9">
                                                <input class="form-control" name="apellidoPat" required="" value="${usuarioInstance?.apellidoPat}" placeholder="Apellido paterno" type="text" onkeyup="vNom(this)" onchange="usernameCrear()">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label" for="apellidoMat"> Apellido materno:
                                                <span class="required-indicator">*</span></label>
                                            <div class="col-sm-9">
                                                <input class="form-control" name="apellidoMat" required="" value="${usuarioInstance?.apellidoMat}" placeholder="Apellido materno" type="text" onkeyup="vNom(this)" onchange="usernameCrear()">
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
                                             
                                                <g:select id="empresa" name="empresa.id" from="${pruebaSeguridad.Empresa.list()}" optionKey="id" value="${usuarioInstance?.empresa?.id}" class="form-control" noSelection="['null': 'Selecciona una empresa']" onchange="usernameCrear()" required="" />
                                               
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="alert alert-danger">
                                                <g:message code="Importante proporcionar el correo electrónico correcto" />
                                            </div>
                                            <label class="col-sm-3 control-label" for="email"> Correo electrónico:
                                                <span class="required-indicator">*</span></label>
                                            <div class="col-sm-9">

                                                <input type="email" class="form-control" name="email" required="" value="${usuarioInstance?.email}" placeholder="ejemplo@gmail.com" >
                                            </div> 
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label" for="username"> Username:
                                                <span class="required-indicator">*</span></label>
                                            <div class="col-sm-9">
                                                <input class="form-control" name="username" readonly required="" value="${usuarioInstance?.username}" placeholder="Username" type="text"   >
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
                                                                <!--<div class="col-sm-offset-2 col-sm-10">
                                                                    <button type="submit" class="btn btn-success" name="create" >Agregar usuario</button>  
                                                                    <button id="btn-load" class="btn btn-primary" data-loading-text="Refreshing...">Click to Refresh</button>
                                                                </div>
                                                            </fieldset>-->
                                    </g:form>

                                    <script type="text/javascript">
                                        function comprobarClave(){
                                        password = document.f1.password.value
                                        password2 = document.f1.password2.value
                                        if (password == password2){    
                                        }else{
                                        alert("Las contraseñas no coinciden")
                                        document.f1.password.value="";
                                        document.f1.password2.value="";
                                        } 
                                        }


                                        function validaClave(){
                                        password=document.f1.password.value
                                        var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])([A-Za-z\d$@$!%*?&]|[^ ]){8,15}$/;                                        
                                        if(regex.test(password)){

                                        }
                                        else{
                                        alert("La contraseña debe cumplir con:\n*Longitud mínimo 8 carácteres\n*Al menos una letra mayúscula\n*Al menos una letra minúscula\n*Al menos un dígito\n*No espacios en blanco\n*Al menos 1 carácter especial")
                                        document.f1.password.value="";
                                        }
                                        }

                                        function limpia(elemento)
                                        {
                                        elemento.value = "";
                                        } 


                                        function mostrar(){
                                        var combo = document.getElementById("areaDpto");
                                        var selected = combo.options[combo.selectedIndex].text;
                                        if(selected== "Otro") {                                  
                                        document.getElementById('mostrar').style.display = 'block';
                                        }else{
                                        document.getElementById('mostrar').style.display = 'none';
                                        }
                                        }


                                        function usernameCrear(){
                                       
                                        var clave;
                                        var nombre = document.f1.nombre.value
                                        var subCadena = nombre.substring(0,1);
                                        var apellidoMat=document.f1.apellidoMat.value
                                        var subCadena2 = apellidoMat.substring(0,1);
                                        var apellidoPat=document.f1.apellidoPat.value
                                        var combo = document.getElementById("rolUsuario");
                                        var selected = combo.options[combo.selectedIndex].text;
                                        if(selected== "Cliente") {  var contador=0; 
                                        var tipoUser="E"
                                        if(contador<=9){
                                        clave="000"+contador
                                        }else if(contador <= 99){
                                        clave="00"+contador
                                        }else if(contador <= 999){
                                        clave="0"+contador
                                        }
                                        else{
                                        clave=contador
                                        }  
                                        contador++
                                  
                                        }else{
                                        var contador2=0;

                                        var tipoUser="I"
                                        document.f1.empresa.value=1;
                                        if(contador2<=9){
                                        clave="000"+contador2
                                        }else if(contador2<= 99){
                                        clave="00"+contador2
                                        }else if(contador2 <= 999){
                                        clave="0"+contador2
                                        }
                                        else{
                                        clave=contador2
                                        }  
                                        contador2++;
                                     
                                        }
                                        var empresa= document.f1.empresa.value
                                        if(empresa <= 9){
                                        var noEmpresa="0"+empresa
                                        }else{
                                        var noEmpresa=empresa
                                        }
                                        document.f1.username.value=tipoUser+noEmpresa+subCadena.toUpperCase()+apellidoPat.toUpperCase()+subCadena2.toUpperCase()+clave;

                                        }


                                        function incrementar()
                                        {
                                        var contador=0;
                                        contador++;
                                        return contador
                                        }

                                        function vNom(solicitar){
                                        var txt = solicitar.value;
                                        solicitar.value = (txt.substring(0,1).toUpperCase() + txt.substring(1,txt.length)).trim();
                                        }
                                    </script>
                                    <script type="text/javascript">
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
