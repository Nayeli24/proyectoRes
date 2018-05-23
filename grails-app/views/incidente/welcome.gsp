<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main"/>
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
                <div class="box border blue">
                    <div class="box-title">
                        <h4><i class="fa fa-cloud-download"></i>Carga de archivos</h4>

                    </div>
                    <div class="box-body">
                        <form  class="dropzone"  id="my-awesome-dropzone">
                            <div class="fallback">
                                <input name="file" type="file" multiple/>
                            </div>
                            <input type="submit" value="Upload" onclick="uploadFile()"/>
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
            success: function () {
            alert("Carga de archivos completa");
            },
            error: function () {
            alert("Fallo al cargar archivos");
            }
            });
            } // function uploadFile
        </script>

    </body>

</html>