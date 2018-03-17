<!DOCTYPE html>
<html>
    <head>

        <script src="./path/to/dropzone.js"></script>
        <title>Simple Ajax</title>


        <g:external dir="js/dropzone" file="dropzone.min.js" />     
        <script src="https://rawgit.com/enyo/dropzone/master/dist/dropzone.js"></script>
        <link rel="stylesheet" href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css">
    </head>
    <body>
        <div class="row">
            <div class="col-md-12">
                    <!-- BOX -->
                <div class="box border inverse">
                    <div class="box-title">
                        <h4><i class="fa fa-comment-o"></i>Solución</h4>

                    </div>
                    <div class="box-body">

                        <form method="POST" class="dropzone"  id="my-awesome-dropzone">
                            <input type="hidden" id="${id}" name="id" value="${id}"  >
                            <fieldset><textarea name="solucion" required="" value="${incidenteInstance?.solucion}"  required="" rows="5" cols="20"  placeholder="Escribe solución..."></textarea></fieldset>

                            <div class="fallback">
                                <input name="file" type="file" multiple accept="image/*,.pdf,.doc,.docx"/>
                            </div>
                            <fieldset><input type="submit" value="Upload" onclick="uploadFile()"/></fieldset>  

                        </form>

                    </div>
                </div>
                                <!-- /BOX -->
            </div>
        </div>


        <script>
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
            enctype: 'multipart/form-data',
            processData: false,
            contentType: false,
            cache: false,
            
            });
            } // function uploadFile
        </script>

    </body>

</html>


