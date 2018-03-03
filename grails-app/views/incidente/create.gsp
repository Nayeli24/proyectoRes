<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Nuevo incidente</title>
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
                                            <h3 class="content-title pull-left">Nuevo incidente</h3>
                                        </div>
                                        <div class="description">Crear nuevo incidente</div>
                                    </div>
                                </div>
                            </div>
                            <!-- /PAGE HEADER -->
                            <div class="box border primary">
                                <div class="box-title">
                                    <h3 class="form-title">Registrar incidente</h3>
                                </div>                                                    
                                <div class="box-body big">
                                    <g:if test="${flash.message}">
                                        <div class="message" role="status">${flash.message}</div>
                                    </g:if>
                                    <g:hasErrors bean="${incidenteInstance}">
                                        <ul class="errors" role="alert">
                                            <g:eachError bean="${incidenteInstance}" var="error">
                                                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                                </g:eachError>
                                        </ul>
                                    </g:hasErrors>
                                    <g:form url="[resource:incidenteInstance, action:'save']" >
                                        <fieldset class="form">
                                            <g:render template="form"/>
                                        </fieldset>
                                        <fieldset class="buttons">
                                            <g:submitButton name="create" class="btn btn-success" value="Crear incidente" />
                                        </fieldset>
                                    </g:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--PAGE-->
    </body>
</html>
