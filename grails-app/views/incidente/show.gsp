
<%@ page import="pruebaSeguridad.Incidente" %>
<%@ page import="pruebaSeguridad.Comentario" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Detalle incidente</title>

        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
        <meta name="layout" content="main">
        <g:javascript library="prototype" />
    </head>
    <body>

<!-- PAGE -->
        <section id="page">

            <div id="main-content">
         <!-- /SAMPLE BOX CONFIGURATION MODAL FORM-->
                <div class="container">
                    <div class="row">
                        <div id="content" class="col-lg-12">
                                <!-- PAGE HEADER-->
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="page-header">
                                        <div class="clearfix">
                                            <h3 class="content-title pull-left">Detalle de incidente</h3>
                                        </div>
                                        <div class="description">Caracteristicas de incidente </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /PAGE HEADER -->
                            <div class="box border primary">
                                <div class="box-title">
                                    <h3 class="form-title">Detalle de incidente</h3>
                                </div>                                                    
                                      <g:if test="${incidenteInstance?.folio}">
                                    <div class="form-group">
                                        <br>
                                        <label class="control-label col-md-3">Folio:</label>
                                        <g:fieldValue bean="${incidenteInstance}" field="folio"/>
                                    </div>
                                </g:if>
                                <g:if test="${incidenteInstance?.tema}">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Tema:</label>
                                        <g:fieldValue bean="${incidenteInstance}" field="tema"/>
                                    </div>
                                </g:if>
                                <g:if test="${incidenteInstance?.estatus}">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Estatus del incidente:</label>
                                        ${incidenteInstance?.estatus?.encodeAsHTML()}
                                    </div>
                                </g:if>
                                <g:if test="${incidenteInstance?.descripcion}">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Descripción del problema:</label>
                                        <g:fieldValue bean="${incidenteInstance}" field="descripcion"/>
                                    </div>
                                </g:if>
                                <g:if test="${incidenteInstance?.registradoPor}">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Registrado por el usuario:</label>
                                        ${incidenteInstance?.registradoPor?.nombre} ${incidenteInstance?.registradoPor?.apellidoPat} ${incidenteInstance?.registradoPor?.apellidoMat}   
                                    </div>
                                </g:if>
                                <g:if test="${incidenteInstance?.fechaRegistro}">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Fecha de registro:</label>
                                        <g:formatDate format="dd MMMMM yyyy" date="${incidenteInstance?.fechaRegistro}" />
                                    </div>
                                </g:if>
                                <g:if test="${incidenteInstance?.asignadoA}">
                                    <sec:ifAnyGranted roles='ROLE_ADMIN'>
                                        <div class="form-group">
                                            <label class="control-label col-md-3">Incidente asignado al usuario:</label>
                                            ${incidenteInstance?.asignadoA?.nombre} ${incidenteInstance?.asignadoA?.apellidoPat} ${incidenteInstance?.asignadoA?.apellidoMat}
                                        </div>
                                    </sec:ifAnyGranted>
                                </g:if>                                    
                                <g:if test="${incidenteInstance?.fechaAsignacion}">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Fecha de asignación:</label>
                                        <g:formatDate format="dd MMMMM yyyy hh:mm aa"  date="${incidenteInstance?.fechaAsignacion}" />                                                
                                    </div><br><br>
                                </g:if>
                            </div>

                            <div>
                               
                                <g:if test="${incidenteInstance?.estatus?.id==4}">
                                    <g:if test="${incidenteInstance?.solucion}">
                                        <li class="fieldcontain">
                                            <span id="descripcion-label" class="row"><g:message code="incidente.solucion.label" default="Solución" /></span>

                                            <span class="property-value" aria-labelledby="solucion-label"><g:fieldValue bean="${incidenteInstance}" field="solucion"/></span>

                                        </li>
                                    </g:if>
                                    <sec:ifAnyGranted roles='ROLE_CLIENTE'>
                                        <g:form url="[resource:incidenteInstance, action:'cerrarIncidente']">
                                            <fieldset class="buttons">
                                                <g:actionSubmit   value="Cerrar Incidente"/> </fieldset>
                                            </g:form>

                                    </sec:ifAnyGranted>
                                </g:if>
                                <g:if test="${incidenteInstance?.estatus?.id==1}">
                                    <g:form url="[resource:incidenteInstance, action:'delete']" method="DELETE">
                                        <fieldset class="buttons">

                                            <g:actionSubmit class="btn btn-success" action="delete" value="Eliminar incidente" onclick="return confirm('Estás seguro de eliminar incidente?');" />
                                            <div id="borra"></div>
                                        </fieldset>
                                    </g:form>
                                </g:if>
                                <g:if test="${incidenteInstance?.estatus?.id==5}">

                                    <sec:ifAnyGranted roles='ROLE_ADMIN'>
                                        <g:form url="[resource:incidenteInstance, action:'enviarEmail']">
                                            <fieldset class="buttons">
                                                <g:actionSubmit value="Enviar Email"/> </fieldset>
                                            </g:form>
                                    </sec:ifAnyGranted>
                                </g:if>
                            </div>

                            <sec:ifAnyGranted roles='ROLE_DESARROLLADOR'>
                                <g:if test="${incidenteInstance?.estatus?.id==2 || incidenteInstance?.estatus?.id==3}">
                                    <g:formRemote name="formComentario" url="[controller:'incidente',action:'enviarComentario']" update="[success:'message',failure:'error']">
                                        <input type="hidden" name="id" value="${incidenteInstance.id}"/>
                                        <textarea class="form-control"  onclick="javascript: limpia(this);"  name="comentario" required="" rows="5" cols="20"  placeholder="Escribe un comentario..."></textarea>
                                        <br><input onclick="alert('¡Comentario enviado con éxito :)!')" type="submit" class="btn btn-success" value="Enviar Comentario" />
                                    </g:formRemote>
                                    <i class="fa fa-comments fa-fw"></i><g:remoteLink controller="comentario" action="index" id="${incidenteInstance.id}" update ="[success:'message',failure:'error']"> Ver comentarios </g:remoteLink><i class="fa fa-angle-double-down fa-fw"></i>
                                        <div id="message"></div>
                                        <div id="error"></div>
                                        <br>
                                       
                                </g:if>
                            </sec:ifAnyGranted>
                            <sec:ifAnyGranted roles='ROLE_CLIENTE'>
                                 <g:if  test="${incidenteInstance?.estatus?.id==2}">
                                    <div class="alert alert-danger">
                                        <g:message code="El usuario está revisando el incidente" />
                                    </div>
                                </g:if> 

                                <g:if test="${incidenteInstance?.estatus?.id==3}">
                                    <g:formRemote name="formComentario" url="[controller:'incidente',action:'enviarComentario']" update="[success:'message',failure:'error']">
                                        <input type="hidden" name="id" value="${incidenteInstance.id}"/>
                                        <textarea class="form-control"  onclick="javascript: limpia(this);"  name="comentario" required="" rows="5" cols="20"  placeholder="Escribe un comentario..."></textarea>
                                        <br><input onclick="alert('¡Comentario enviado con éxito :)!')" type="submit" class="btn btn-success" value="Enviar Comentario" />
                                    </g:formRemote>
                                    <i class="fa fa-comments fa-fw"></i><g:remoteLink controller="comentario" action="index" id="${incidenteInstance.id}" update ="[success:'message',failure:'error']"> Ver comentarios </g:remoteLink><i class="fa fa-angle-double-down fa-fw"></i>
                                        <div id="message"></div>
                                        <div id="error"></div>
                                        <br>
                                       
                                </g:if>
                            </sec:ifAnyGranted>
                             <script>
                                        function limpia(elemento)
                                        {
                                        elemento.value = "";
                                        } 

                                     
                                    </script>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--PAGE-->

</body>
</html>
