
<%@ page import="pruebaSeguridad.Incidente" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Asignar incidente</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
        <meta name="layout" content="main">
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
                                            <!-- STYLER -->

<!-- /STYLER -->

                                        <div class="clearfix">
                                            <h3 class="content-title pull-left">Asignar incidente</h3>
                                        </div>
                                        <div class="description">Asignar incidente a un usuario</div>
                                    </div>
                                </div>
                            </div>
                            <!-- /PAGE HEADER -->
                            <div class="box border primary">
                                <div class="box-title">
                                    <h3 class="form-title">Asignar incidente</h3>
                                </div>                                                    
                                <div class="box-body big">
                                    <g:if test="${flash.message}">
                                        <div class="message" role="status">${flash.message}</div>
                                    </g:if>
                                    <g:form controller="incidente" action="asignarIncidente" >
                                        <g:if test="${detalle}">
                                            <div class="message" role="status">${flash.message}</div>
                                        </g:if>
                                        <fieldset>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label" for="asignadoA"> Usuario asignado:</label>
                                                <div class="col-sm-9">
                                                    <g:select id="asignadoA" name="asignadoA" from="${detalle.usuarios}" optionKey="id" optionValue="nombreCompleto"  class="form-control"  />
                                                </div>
                                            </div>
                                        </fieldset><p>
                                        <fieldset>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label" for="incidente"> Incidente a asignar:</label>
                                                <div class="col-sm-9">
                                                    <g:select   multiple="true" id="incidente" name="incidente"   from="${detalle.incidentes}" optionKey="id" optionValue="tema" value="${detalle.incidentes?.id}" class="form-control" />
                                                </div>
                                            </div>
                                        </fieldset>
                                        <fieldset class="buttons">
                                            <g:if  test="${detalle.incidentes}">
                                                <g:submitButton name="asignar" class="btn btn-success" value="Asignar" />
                                            </g:if> 
                                            <g:else>
                                                <br>
                                                <div class="alert alert-danger">
                                                    ${flash.error?.encodeAsHTML()}
                                                </div>
                                            </g:else>
                                        </fieldset>
                                    </g:form>
                                </div>
                            </div>
                        </div>
                        </section>
        <!--/PAGE -->
                        </body>
                        </html>
