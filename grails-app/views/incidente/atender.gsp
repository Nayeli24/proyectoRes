<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->
<%@ page import="pruebaSeguridad.Incidente" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<br>
        <div class="box border inverse">
            <div class="box-title">
                <h4><i class="fa fa-comment-o"></i>Solución</h4>

            </div>
            <div class="box-body">
               
                <form method="post"  action="http://localhost:8080/MesaAyuda/incidente/upload" enctype="multipart/form-data">
                    <input type="hidden" id="${id}" name="id" value="${id}"  >
                    <fieldset><textarea name="solucion" required="" value="${incidenteInstance?.solucion}"  required="" rows="5" cols="20"  placeholder="Escribe solución..."></textarea></fieldset>
                    <br>Seleccionar archivo  <input type="file" id="fileName"  name="nombreArchivo" width="250px" multiple>
                    <fieldset> <input type="submit" name="submit" value="Enviar datos"></fieldset>
                </form>

            </div>
        </div>

