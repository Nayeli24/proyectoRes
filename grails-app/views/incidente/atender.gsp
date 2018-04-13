<!DOCTYPE html>
<html>
    <head>
        <title>Atender incidente</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.3.5/sweetalert2.all.min.js"></script>
    </head>
    <body>
        <div class="row">
            <div class="col-md-12">
         <!-- BOX -->
                <div class="box border primary">
                    <div class="box-title">
                        <h4><i class="fa fa-comment-o"></i>Solución</h4>
                    </div>
                    <div class="box-body big">
                        <g:formRemote name="f1" url="[controller:'incidente',action:'guardarSolucion']" update="[success:'message2',failure:'error']" onsubmit="return sendForm();">
                            <fieldset>
                                <textarea class="form-control" name="solucion" required="" value="${incidenteInstance?.solucion}"  rows="10" cols="20"  placeholder="Escribe solución..."></textarea>
                            </fieldset>
                            <fieldset>
                                <input type="hidden" id="${id}" name="id" value="${id}"  >                                
                            </fieldset><br>
                            <fieldset class="buttons">
                                <button name="atender" class="btn btn-success" >Enviar Solución</button>
                                <g:remoteLink controller="incidente" action="cargaArchivos" id="${id}" update ="[success:'message2',failure:'error']"> <button  class="btn btn-primary" >Cargar archivos ${idUpload}</button></g:remoteLink>
                                </fieldset>

                        </g:formRemote>
                        <br>
                        <div id="message2"> </div>
                    </div>

                </div>
<!-- /BOX -->
            </div>
        </div>



        <script src="http://localhost:8080/MesaAyuda/js/script.js"></script>
        <script>
            jQuery(document).ready(function() {		
            App.setPage("dropzone_file_upload");  //Set current page
            App.init(); //Initialise plugins and elements
            });


        </script>
        <script>
            function sendForm(){
            var t = false
            //Por aqui valida cosas

            //llega al swal

            swal({
            title: "¿Desea actualizar las demas cuentas?",
            text: "Esta a punto de registrar una cuenta que es nómina",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Eliminar",
            cancelButtonText: "Cancelar",
            closeOnConfirm: true,
            closeOnCancel: true,

            }, function(isConfirm) {
            //Es en este punto que necesito detener la ejecucion de la función x a la espera de lo que haga con el swal
            var formulario = document.getElementById("f1"); 
            if (isConfirm) {
            t = true;
            return false;
            } else {
             formulario.submit();
            return true;

            }

            });


            }
   

        </script>
<!--        <script>
       // bind the on-change event
       $(document).ready(function() {
       $("#upload-file-input").on("change", uploadFile);
       });

       /**
       * Upload the file sending it via Ajax at the Spring Boot server.
       */
       function uploadFile() {
       $.ajax({
       url: "http://localhost:8080/MesaAyuda/incidente/upload",
       type: "POST",
       data: new FormData($("#my-awesome-dropzone")[0]),

       processData: false,
       contentType: false,
       cache: false,

       });
       } // function uploadFile
   </script>-->

    </body>

</html>


