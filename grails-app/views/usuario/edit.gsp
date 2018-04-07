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
                                            <input   class="form-control"  value="${usuarioInstance?.areaDpto}"  id="areaDpto" required="" name="areaDpto" placeholder="Área/Dep" type="text">
                                            <br>
                                            <select  class="form-control" name="areaDpto2" id="areaDpto2" value="${usuarioInstance?.areaDpto}" onchange="mostrar()" >
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
                                            <select class="form-control" name="rolUsuario">
                                                <option selected disabled hidden>Seleccione tipo de usuario</option>
                                                <option  value="cliente" >Cliente</option>
                                                <option  value="empleado">Empleado Nuuptech</option> 
                                                <option  value="admin">Administrador</option>
                                            </select>
                                        </div>
                                        <br><br>
                                    </div>
                                    <div class="form-group" align="center">
                                        <fieldset class="buttons">
         <!--    <input id="boton" type="button" value="Actualizar" onClick="comprobarClave()" action="update" > 
    -->                                 <g:actionSubmit class="btn btn-success" value="${message(code: 'default.button.actualizar.label', default: 'Actualizar')}" action="update" />
                                        </fieldset>  </div>
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
                                    document.f1.password2.value="";
                                    }
                                    }

                                    function limpia(elemento)
                                    {
                                    elemento.value = "";
                                    } 


                                    function mostrar(){
                                    var op=document.getElementById("areaDpto2");
                                    var tt=document.getElementById("areaDpto");
                                    if (op.selectedIndex==0)tt.value="";
                                    if (op.selectedIndex==1)tt.value="Dirección General";
                                    if (op.selectedIndex==2)tt.value="Administración y Recursos Humanos";
                                    if (op.selectedIndex==3)tt.value="Producción";
                                    if (op.selectedIndex==4)tt.value="Finanzas y Contabilidad";
                                    if (op.selectedIndex==5)tt.value="Publicidad y Mercadotecnia";
                                    if (op.selectedIndex==6)tt.value="Sistemas e Informática";
                                    if (op.selectedIndex==7){
                                    tt.value="";
                                    document.getElementById("mostrar").style.display = 'block';
                                    tt.value=document.f1.mostrar.value;}
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
