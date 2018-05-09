/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function confirmFunction() {
    $("#ca").hide()
    swal({
        title: '¿Deseas continuar?',
        text: 'Antes de enviar la solución si lo requiere, cargar los archivos correspondientes',
        type: 'warning',
        showCancelButton: true,
        confirmButtonText: 'No, cargar archivos',
        cancelButtonText: 'Sí, enviar solución'
    }).then((result) => {
        console.log(result);
        if (result.value) {
            swal(
                    '¡Cargar archivos!',
                    'Cargar archivos correspondientes y necesarios',
                    'warning'
                    )
            $("#ca").show();
        } else {

            $("#f1").submit();
        }
    });
}

function mostrar()
{
    var text = document.getElementById("txtAten");

    if (text == " ")
    {
        swal(
                '¡Escribe la solución!',
                'Escribe la solución',
                'error'
                )
        document.getElementById('atender').style.display = 'none';
    } else {
        $('#atender').show();
    }
}

function limpia(elemento)
{
    elemento.value = "";
}

function limpia2()
{
    var id = document.formComentario.id.value
    swal({
        title: "¡Comentario enviado!",
        text: "El comentario ha sido enviado con éxito",
        type: 'success'
    }).then((result) => {
        console.log(result);
        if (result.value) {
            $("#fc").submit()
            document.formComentario.comentario.value = "";
        }

    });
}


function eliminarFunction() {
    swal({
        title: '¿Estas seguro de eliminar el incidente?',
        text: 'No se continuará con el seguimiento al incidente si es eliminado',
        type: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Sí',
        cancelButtonText: 'No',
        closeOnConfirm: false
    }).then((result) => {
        console.log(result);
        if (result.value) {
            swal({
                title: "¡Incidente eliminado!",
                text: "El incidente ha sido eliminado",
                timer: 7000,
                type: 'success'
            });

            $("#delete").submit()
            // For more information about handling dismissals please visit
            // https://sweetalert2.github.io/#handling-dismissals
        }
    });
}
