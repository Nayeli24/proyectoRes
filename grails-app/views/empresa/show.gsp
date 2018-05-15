
<%@ page import="pruebaSeguridad.Empresa" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Empresa registrada</title>

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
                                        <!-- BREADCRUMBS -->

      <!-- /BREADCRUMBS -->
                                        <div class="clearfix">
                                            <h3 class="content-title pull-left">Empresa registrada: ${empresaInstance.nombreEmpresa}</h3>
                                        </div>
                                     <g:if test="${empresaInstance?.nombreEmpresa}">
                                <div class="description">

                                    <g:fieldValue bean="${empresaInstance}" field="nombreEmpresa"/> esta <g:formatBoolean boolean="${empresaInstance?.enabled}"  true="Activa" false="Inactiva"  />
                                </div>
                            </g:if>
                                </div>
                            </div>
                            <!-- /PAGE HEADER -->
                          
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--PAGE-->
