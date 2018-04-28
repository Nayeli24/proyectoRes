
<%@ page import="pruebaSeguridad.Incidente" %>
<%@ page import="pruebaSeguridad.Documento" %>
<%@ page import="pruebaSeguridad.Comentario" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Detalle incidente</title>

        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
        <meta name="layout" content="main">

        <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.3.5/sweetalert2.all.min.js"></script>

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
                                      <!-- BREADCRUMBS -->
                                        <ul class="breadcrumb">
                                            <li>
                                            <sec:ifAnyGranted roles='ROLE_CLIENTE'>

                                                <g:if test="${incidenteInstance?.estatus?.id==5}">
                                                    <g:jasperForm 
                                                        controller="incidente"
                                                        action="printReport"
                                                        jasper="ticket_1" 
                                                    name="Incidente_${incidenteInstance.folio}">
                                                        <input type="hidden" name="id" value='${incidenteInstance?.id}'/> 
                                                        <i class="fa fa-clipboard fa-fw"></i><g:jasperButton format="pdf" jasper="ticket_1" text="Generar reporte"  /><br>
                                                    </g:jasperForm>
                                                </g:if>
                                            </sec:ifAnyGranted>  
                                            </li>

                                        </ul>
                                        <!-- /BREADCRUMBS -->

                                        <div class="clearfix">
                                            <h3 class="content-title pull-left">Detalle de incidente</h3>
                                        </div>
                                        <div class="description">Características de incidente </div>

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
                                        <g:formatDate format="dd MMMMM yyyy"  date="${incidenteInstance?.fechaAsignacion}" />                                                
                                    </div>
                                </g:if>
                                <g:if test="${incidenteInstance?.solucion}">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Solución:</label>
                                        <g:fieldValue bean="${incidenteInstance}" field="solucion"/>
                                    </div>
                                </g:if>
                                <g:if test="${incidenteInstance?.fechaAtencion}">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Fecha que se atendió:</label>
                                        <g:formatDate format="dd MMMMM yyyy"  date="${incidenteInstance?.fechaAtencion}" />  
                                    </div>
                                </g:if>
                                <g:if test="${incidenteInstance?.estatus?.id==4}">
                                    <sec:ifAnyGranted roles='ROLE_CLIENTE'> 
                                        <div class="form-group" align="center">
                                            <fieldset >
                                                <g:link  controller="incidente" action="cerrarIncidente" id="${incidenteInstance.id}" ><g:actionSubmit   class="btn btn-success"  value="Finalizar Incidente"/></g:link>
                                                </fieldset>
                                            </div>
                                        </sec:ifAnyGranted>
                                </g:if>
                                <sec:ifAnyGranted roles='ROLE_DESARROLLADOR'>
                                    <g:if test="${incidenteInstance?.estatus?.id==3}">
                                        <div class="form-group" align="center">
                                            <fieldset>
                                                <g:remoteLink controller="incidente" action="atender" id="${incidenteInstance.id}" update ="[success:'divSolucion',failure:'errorSolucion']"><input type="button" class="btn btn-success" value="Solucionar incidente" /> </g:remoteLink>
                                                </fieldset>
                                            </div>
                                    </g:if>
                                </sec:ifAnyGranted>
                                <br>
                            </div>
                            <div id="divSolucion"></div>
                            <div id="errorSolucion"></div>
                            <div>

                                <g:if test="${incidenteInstance?.estatus?.id==2 || incidenteInstance?.estatus?.id==3}">
                                    <sec:ifAnyGranted roles='ROLE_DESARROLLADOR,ROLE_CLIENTE'>
                                        <g:form id="fc" name="formComentario" url="[controller:'incidente',action:'enviarComentario']" >
                                            <input  type="hidden" name="id" value="${incidenteInstance.id}"/>
                                            <textarea id="comentario"  class="form-control"   name="comentario" required="" rows="5" cols="20"  placeholder="Escribe un comentario..."></textarea>
                                            <br><input  type="button" class="btn btn-success" value="Enviar Comentario" onclick="limpia2();" />
                                        </g:form>
                                    </sec:ifAnyGranted>
                                </g:if>
                                <br>


                                <g:if test="${incidenteInstance?.estatus?.id > 1}">
                                <i class="fa fa-comments fa-fw"></i><g:remoteLink controller="comentario" action="index" id="${incidenteInstance.id}" update ="[success:'divCom',failure:'errorCom']"> Ver comentarios (<g:include controller="comentario" action="contarComentarios" id="${incidenteInstance.id}" />)</g:remoteLink><i class="fa fa-angle-double-down fa-fw"></i>
                                    <i class="fa fa-folder fa-fw"></i><g:remoteLink controller="documento" action="index" id="${incidenteInstance.id}" update ="[success:'divDoc',failure:'errorDoc']"> Documentos (<g:include controller="documento" action="contarDocumentos" id="${incidenteInstance.id}" />)</g:remoteLink><i class="fa fa-angle-double-down fa-fw"></i>
                                </g:if>

                                <g:if test="${incidenteInstance?.estatus?.id==1}">
                                    <sec:ifAnyGranted roles='ROLE_CLIENTE'>
                                        <g:form url="[resource:incidenteInstance, action:'delete']" method="DELETE" id="delete" name="delete">
                                            <fieldset class="buttons">
                                                <input type="button" name="atender" id="atender" onclick="eliminarFunction();" value="Eliminar incidente" class="btn btn-success"  />
                                                <g:remoteLink controller="incidente" action="cargaArchivos" id="${incidenteInstance.id}" update ="[success:'message3',failure:'error3']" > <input type="button" class="btn btn-primary" id="ca" name="ca"  value="Cargar archivos" /></g:remoteLink>
                                                </fieldset>
                                        </g:form> <br> 
                                    </sec:ifAnyGranted>    
                                    <i class="fa fa-folder fa-fw"></i><g:remoteLink controller="documento" action="index" id="${incidenteInstance.id}" update ="[success:'divDoc',failure:'errorDoc']"> Documentos (<g:include controller="documento" action="contarDocumentos" id="${incidenteInstance.id}" />)</g:remoteLink><i class="fa fa-angle-double-down fa-fw"></i>
                                        <div id="message3"></div>
                                        <div id="error3"></div>
                                </g:if>

                                <div id="divDoc"></div>
                                <div id="divCom"> </div>                                
                                <div id="errorDoc"> </div>
                                <div id="errorCom"> </div>
                                <script>
                                    function limpia(elemento)
                                    {
                                    elemento.value = "";
                                    } 

                                    function limpia2()
                                    {
                                    var id= document.formComentario.id.value
                                    swal({
                                    title: "¡Comentario enviado!",
                                    text: "El comentario ha sido enviado con éxito",
                                    type: 'success'
                                                 }).then((result) => {
                                    console.log(result);
                                    if (result.value) {
                                    $("#fc").submit()
                                    document.formComentario.comentario.value="";
                                    }

                                    });
                                    }


                                    function eliminarFunction() {
                                    swal({
                                    title: '¿Estas seguro de eliminar el incidente?',
                                    text: 'No se continuará con el seguimiento al incidente si es eliminado',
                                    type: 'warning',
                                    showCancelButton: true,
                                    confirmButtonText: 'Sí',
                                    cancelButtonText: 'No',
                                    closeOnConfirm: false
                                           }).then((result) => {
                                    console.log(result);
                                    if (result.value) {
                                    swal({
                                    title: "¡Incidente eliminado!",
                                    text: "El incidente ha sido eliminado",
                                    timer: 7000,
                                    type: 'success'
                                    });

                                    $("#delete").submit()
                                    // For more information about handling dismissals please visit
                                    // https://sweetalert2.github.io/#handling-dismissals
                                    }
                                    });
                                    }

                                </script>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
                <!--PAGE-->

        <div class="footer-tools">
            <span class="go-top">
                <i class="fa fa-chevron-up"></i> Arriba
            </span>
        </div>

    </body>

</html>
