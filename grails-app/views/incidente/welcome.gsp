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

        <title>Simple Ajax</title>

    </head>
    <body>
        <div class="row">
            <div class="col-md-12">
                    <!-- BOX -->
                <div class="box border blue">
                    <div class="box-title">
                        <h4><i class="fa fa-cloud-download"></i>Cloud Upldsmfskldjfklsjkjfdskjfksdjr</h4>

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
            alert("Ya subio")
            },
            error: function () {
            // Handle upload error
            // ...
            }
            });
            } // function uploadFile
        </script>
        <g:external dir="js/dropzone" file="dropzone.min.js" />


        <script>
            jQuery(document).ready(function() {		
            App.setPage("dropzone_file_upload");  //Set current page
            App.init(); //Initialise plugins and elements
            });
        </script>
    </body>

</html>