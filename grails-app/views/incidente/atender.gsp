<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->
<%@ page import="pruebaSeguridad.Incidente" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<g:external dir="js/dropzone" file="dropzone.min.js" />  
<br>
        <div class="box border inverse">
            <div class="box-title">
                <h4><i class="fa fa-comment-o"></i>Solución</h4>

            </div>
            <div class="box-body">
               
                <form  class="dropzone"  id="my-awesome-dropzone">
                    <input type="hidden" id="${id}" name="id" value="${id}"  >
                    <fieldset><textarea name="solucion" required="" value="${incidenteInstance?.solucion}"  required="" rows="5" cols="20"  placeholder="Escribe solución..."></textarea></fieldset>
                      
                            <div class="fallback">
                                <input name="file" type="file" multiple/>
                            </div>
                    <fieldset><input type="submit" value="Upload" onclick="uploadFile()"/></fieldset>  

                </form>

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
    