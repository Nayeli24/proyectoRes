<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="pruebaSeguridad.Comentario" %>
<%@ page import="pruebaSeguridad.Incidente" %>
<br>

                    <!-- DATA TABLES -->
<div class="row">
    <div class="col-md-12">
            <!-- BOX -->
        <div class="box border green">
            <div class="box-title">
                <h4><i class="fa fa-comments fa-fw"></i>Comentarios</h4>

            </div>
            <g:paginate next="Forward" prev="Back"
            maxsteps="0" controller="comentario"
            action="index" total="${comentariosCount}" />
            <div class="box-body">
                <table id="datatable1" cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered table-hover">
                    <thead>
                        <tr role="row">
                            <th>Usuario</th>
                            <th class="hidden-xs">Comentario</th>
                            <th>Fecha</th>

                        </tr>
                    </thead>
                    <tbody>
                        <g:if test="${comentariosVer}">
                            <g:each name="comentariosVer" in="${comentariosVer}">	
                                <tr >
                                    <td> ${it?.usuario?.nombre} ${it?.usuario?.apellidoPat} ${it?.usuario?.apellidoMat}</td>
                                    <td  class="hidden-xs">${it.descripcion}</td>
                                    <td><g:formatDate format="dd / MMMMM / yyyy hh:mm aa" date="${it.fechaComentario}"/></td>
                                    </tr>
                            </g:each>
                        </g:if>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>Usuario</th>
                             <th>Comentario</th>
                             <th>Fecha</th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
        <!-- /BOX -->
    </div>
</div>
 <script src="http://localhost:8080/MesaAyuda/js/script.js"></script>
        <script>
            jQuery(document).ready(function() {		
            App.setPage("dynamic_table");  //Set current page
            App.init(); //Initialise plugins and elements
            });
        </script>

<!-- /EXPORT TABLES -->