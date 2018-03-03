
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Nuevo usuario</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
        <meta name="layout" content="main">
    </head>
    <body>
<!-- PAGE -->
        <section id="page">
            <div id="main-content">
            <!-- SAMPLE BOX CONFIGURATION MODAL FORM-->
                <div class="modal fade" id="box-config" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title">Box Settings</h4>
                            </div>
                            <div class="modal-body">
                                Here goes box setting content.
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>
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
                                            <h3 class="content-title pull-left">Nuevo usuario</h3>
                                        </div>
                                        <div class="description">Crear nuevo usuario</div>
                                    </div>
                                </div>
                            </div>
                            <!-- /PAGE HEADER -->
                            <div class="box border primary">
                                <div class="box-title">
                                    <h3 class="form-title">Registrar usuario</h3>
                                </div>
                                <div class="box-body big">
                                    <g:if test="${flash.message}">
                                        <div class="message" role="status">${flash.message}</div>
                                    </g:if>
                                    <g:hasErrors bean="${usuarioInstance}">
                                        <ul class="errors" role="alert">
                                            <g:eachError bean="${usuarioInstance}" var="error">
                                                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                                </g:eachError>
                                        </ul>
                                    </g:hasErrors>
                                    <g:form id="formCrearUsuario" method="post" class="form-horizontal" role="form" url="[resource:usuarioInstance, action:'save']">
                                        <fieldset class="form">
                                            <g:render template="form"/>

                                        </fieldset>

                                        <script>
                                            $(function(){
                                            $('#areaDpto').mousedown(function(){
                                            if ($('#areaDpto').val() == "Otro" ){
                                            $('#mostrar').show();
                                            } else {
                                            $('#mostrar').css("display","none");
                                            }
                                            });
                                            });
                                        </script>
                                        <fieldset class="buttons">
                                            <g:submitButton name="create" class="btn btn-success" value="Agregar usuario" />
                                            <button id="btn-load" class="btn btn-primary" >Click to Refresh</button>

                                        </fieldset>
                                                                <!--<div class="col-sm-offset-2 col-sm-10">
                                                                    <button type="submit" class="btn btn-success" name="create" >Agregar usuario</button>  
                                                                    <button id="btn-load" class="btn btn-primary" data-loading-text="Refreshing...">Click to Refresh</button>
                                                                </div>
                                                            </fieldset>-->
                                    </g:form>
                                    <script>
                                        $("#btn-load").click(function(event) {
                                        $("#formCrearUsuario")[0].reset();
                                        });
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
