/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function mostrar3()
{
    console.log("holaa")
    var combo = document.getElementById("areaDpto");
    var selected = combo.options[combo.selectedIndex].text;
    console.log(selected);
    if (selected == "Otro")
    {
        document.getElementById('mostrar').style.display = 'block';
    } else {
        document.getElementById('mostrar').style.display = 'none';
    }
}

function mostrar2() {
    var op = document.getElementById("areaDpto2");
    var tt = document.getElementById("areaDpto");
    if (op.selectedIndex == 0) {
        tt.value = "";
    }
    if (op.selectedIndex == 1) {
        tt.value = "Dirección General";
        tt.readOnly = true;
    }
    if (op.selectedIndex == 2) {
        tt.value = "Administración y Recursos Humanos";
        tt.readOnly = true;
    }
    if (op.selectedIndex == 3) {
        tt.value = "Producción";
        tt.readOnly = true;
    }
    if (op.selectedIndex == 4) {
        tt.value = "Finanzas y Contabilidad";
        tt.readOnly = true;
    }
    if (op.selectedIndex == 5) {
        tt.value = "Publicidad y Mercadotecnia";
        tt.readOnly = true;
    }
    if (op.selectedIndex == 6) {
        tt.value = "Sistemas e Informática";
        tt.readOnly = true;
    }
    if (op.selectedIndex == 7) {
        tt.value = "";
        tt.readOnly = false;
    }
}


function cambiarRol() {
    var selected = document.getElementById("rolUsuario").selectedIndex;
    console.log(selected);
    if (selected == 0) {
        var tipoUser = "E"
    } else if (selected == 1 || selected == 2) {
        var tipoUser = "I"
          document.getElementById('twitterDiv').style.display = 'block';
    } else {
        swal({
            title: "¡Seleccionar un tipo de usuario!",
            text: "Este campo no puede quedar vacío, no se podrá enviar el formulario",
            timer: 7000,
            type: 'error'
        });
        var tipoUser = "U"
    }
    username = document.f1.username.value
    var updateUser = username.substring(1)
    document.f1.username.value = tipoUser + updateUser;
}

function comprobarClave() {
    password = document.f1.password.value
    password2 = document.f1.password2.value
    if (password == password2) {
    } else {
        alert("Las contraseñas no coinciden")
        document.f1.password.value = "";
        document.f1.password2.value = "";
    }
}


function validaClave() {
    password = document.f1.password.value
    var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])([A-Za-z\d$@$!%*?&]|[^ ]){8,15}$/;
    if (regex.test(password)) {

    } else {
        alert("La contraseña debe cumplir con:\n*Longitud mínimo 8 carácteres\n*Al menos una letra mayúscula\n*Al menos una letra minúscula\n*Al menos un dígito\n*No espacios en blanco\n*Al menos 1 carácter especial")
        document.f1.password.value = "";
        document.f1.password2.value = "";
    }
}


function validar(e)
{
    tecla = (document.all) ? e.keyCode : e.which;
    if (tecla == 8 || tecla == 9 || tecla == 13)
        return true;
    patron = /^[A-Za-zñÑ\s]/;
    te = String.fromCharCode(tecla);
    return patron.test(te);
}


function limpia(elemento)
{
    elemento.value = "";
}





function usernameCrear() {
    var clave;
    var idusuario = document.f1.idusuario.value
    var nombre = (document.f1.nombre.value).trim()
    var subCadena = nombre.substring(0, 1);
    var apellidoMat = (document.f1.apellidoMat.value).trim()
    var subCadena2 = apellidoMat.substring(0, 1);
    var apellidoPat = (document.f1.apellidoPat.value).trim()
    var selected = document.getElementById("rolUsuario").selectedIndex;
    console.log(selected);
    if (selected == -1) {
        swal({
            title: "¡Seleccionar un tipo de usuario!",
            text: "Este campo no puede quedar vacío, no se podrá crear el usuario",
            timer: 4000,
            type: 'error'
        });
        var tipoUser = "U"
    } else if (selected == 0)
    {
        var tipoUser = "E"
    } else if (selected == 1 || selected == 2) {
        var tipoUser = "I"
        document.f1.empresa.value = 1;
        document.getElementById('twitterDiv').style.display = 'block';
         document.getElementById('twitter').required = true;
    }
    var empresa = document.f1.empresa.value
    if (empresa <= 9)
    {
        var noEmpresa = "0" + empresa;
    } else {
        var noEmpresa = empresa;
    }
    if (idusuario <= 9)
    {
        clave = "000" + idusuario;
    } else if (idusuario <= 99)
    {
        clave = "00" + idusuario;
    } else if (idusuario <= 999)
    {
        clave = "0" + idusuario;
    } else {
        clave = idusuario;
    }
    var cadena = tipoUser + noEmpresa + subCadena.toUpperCase() + apellidoPat.toUpperCase() + subCadena2.toUpperCase() + clave;
    var patron = / /g;
    var nuevoValor = "";
    var nuevaCadena = cadena.replace(patron, nuevoValor);
    console.log(nuevaCadena);
    document.f1.username.value = nuevaCadena



}


function vNom(solicitar)
{
    var txt = solicitar.value;
    solicitar.value = (txt.substring(0, 1).toUpperCase() + txt.substring(1, txt.length)).trim();
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
                tmpChar = tmpStr.substring(0, 1).toUpperCase();
                postString = tmpStr.substring(1, strLen);
                tmpStr = tmpChar + postString;
            } else
            {
                tmpChar = tmpStr.substring(index, index + 1);
                if (tmpChar == " " && index < (strLen - 1))
                {
                    tmpChar = tmpStr.substring(index + 1, index + 2).toUpperCase();
                    preString = tmpStr.substring(0, index + 1);
                    postString = tmpStr.substring(index + 2, strLen);
                    tmpStr = preString + tmpChar + postString;
                }
            }
        }
    }
    solicitar.value = tmpStr;
}


function v(texto) {
    var cadena = texto.value,
            patron = / /g,
            nuevoValor = "",
            nuevaCadena = cadena.replace(patron, nuevoValor);
    console.log(nuevaCadena);
    return nuevaCadena;
}