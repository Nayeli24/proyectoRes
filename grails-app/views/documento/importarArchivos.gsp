<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carga Archivos</title>
    </head>
    <body>
        <form method="post"  action="importarArchivos" enctype="multipart/form-data">

            Seleccionar Archivo  <input type="file" id="fileName    " name="nombreArchivo" width="250px">
            <input type="submit" value="Cargar">
        </form>
    </body>
</html>
