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
                        <form name="f1" id="f1" action="http://localhost:8080/MesaAyuda/incidente/guardarSolucion" >      
                            <fieldset>
                                <textarea id="txtAten" name="txtAten" onkeyup="mostrar();"  class="form-control" name="solucion" required="" value="${incidenteInstance?.solucion}"   rows="10" cols="20"  placeholder="Escribe solución..."></textarea>
                            </fieldset>
                            <fieldset>
                                <input type="hidden" id="${id}" name="id" value="${id}"  >                                
                            </fieldset><br>
                            <fieldset class="buttons">
                                <input type="button" name="atender" id="atender" onclick="confirmFunction();" value="Enviar solución" class="btn btn-success" style="display:none" />
                                <g:remoteLink controller="incidente" action="cargaArchivos" id="${id}" update ="[success:'message2',failure:'error']" > <input type="button" class="btn btn-primary" id="ca" name="ca"  value="Cargar archivos" style="display:none"/></g:remoteLink>
                                </fieldset>

                        </form>
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
            function confirmFunction() {
            $("#ca").hide()
            swal({
            title: '¿Deseas cargar archivos?',
            text: 'Antes de enviar la solución si lo requiere, cargar los archivos correspondientes',
            type: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Sí, cargar archivos',
            cancelButtonText: 'No, enviar solución'
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
            swal(
            'Enviando solución...',
            'Solución enviada...',

            'success',
            2000

            )
            $("#f1").submit();
            }
            });
            }

            function mostrar()
            {
            var text = document.getElementById("txtAten");

            if(text== " ") 
            {      
            swal(
            '¡Escribe la solución!',
            'Escribe la solución',
            'error'
            )
            document.getElementById('atender').style.display = 'none';
            }else{
            $('#atender').show();
            }
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


