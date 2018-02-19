<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->
<%@ page import="pruebaSeguridad.Incidente" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subir Archivos</title>
    </head>
    <body>
        <form method="post"  action="http://localhost:8080/MesaAyuda/incidente/upload" enctype="multipart/form-data">
            <input type="hidden" id="${id}" name="idIncidente" value="${id}"  >
            <fieldset>Solución <br> <textarea name="solucion" required="" value="${incidenteInstance?.solucion}" rows="20" cols="40"></textarea></fieldset>
            <fieldset>Seleccionar archivo  <input type="file" id="fileName" name="nombreArchivo" width="250px">
            </fieldset>
            <fieldset> <input type="submit" name="submit" value="Enviar datos"></fieldset>
            </form>

    </body>
        </html>
