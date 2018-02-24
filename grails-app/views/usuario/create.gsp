
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Crear usuario</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
        <meta name="description" content="">
        <meta name="author" content="">

    </head>
    <body>
        <g:render template="/layouts/header" />

<!-- PAGE -->
        <section id="page">
              <!-- SIDEBAR-->
            <g:render template="/layouts/navbar" />
                   <!-- /SIDEBAR -->
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
                                    <g:form method="post" class="form-horizontal" role="form" url="[resource:usuarioInstance, action:'save']">
                                        <fieldset class="form">
                                            <g:render template="form"/>
                                          
                                                    </fieldset>
                                                    <fieldset class="buttons">
					<g:submitButton name="create" class="btn btn-success" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                                        <button id="btn-load" class="btn btn-primary" data-loading-text="Refreshing...">Click to Refresh</button>
				</fieldset>
                                                        <!--<div class="col-sm-offset-2 col-sm-10">
                                                            <button type="submit" class="btn btn-success" name="create" >Agregar usuario</button>  
                                                            <button id="btn-load" class="btn btn-primary" data-loading-text="Refreshing...">Click to Refresh</button>
                                                        </div>
                                                    </fieldset>-->
                                                    </g:form>
                                                </div>
                                            </div>

                         <!-- JAVASCRIPTS -->
        <!-- Placed at the end of the document so the pages load faster -->
        <!-- JQUERY -->
                                            <script src="../js/jquery/jquery-2.0.3.min.js"></script>
                                            <!-- JQUERY UI-->
                                            <script src="../js/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
                                            <!-- BOOTSTRAP -->
                                            <script src="../bootstrap-dist/js/bootstrap.min.js"></script>


<!-- DATE RANGE PICKER -->
                                            <script src="../js/bootstrap-daterangepicker/moment.min.js"></script>

                                            <script src="../js/bootstrap-daterangepicker/daterangepicker.min.js"></script>
                                            <!-- SLIMSCROLL -->
                                            <script type="text/javascript" src="../js/jQuery-slimScroll-1.3.0/jquery.slimscroll.min.js"></script><script type="text/javascript" src="js/jQuery-slimScroll-1.3.0/slimScrollHorizontal.min.js"></script>
                                            <!-- BLOCK UI -->
                                            <script type="text/javascript" src="../js/jQuery-BlockUI/jquery.blockUI.min.js"></script>
                                            <!-- DATA TABLES -->
                                            <script type="text/javascript" src="../js/datatables/media/js/jquery.dataTables.min.js"></script>
                                            <script type="text/javascript" src="../js/datatables/media/assets/js/datatables.min.js"></script>
                                            <script type="text/javascript" src="../js/datatables/extras/TableTools/media/js/TableTools.min.js"></script>
                                            <script type="text/javascript" src="../js/datatables/extras/TableTools/media/js/ZeroClipboard.min.js"></script>
                                            <!-- COOKIE -->
                                            <script type="text/javascript" src="../js/jQuery-Cookie/jquery.cookie.min.js"></script>
                                            <!-- CUSTOM SCRIPT -->
                                            <script src="../js/script.js"></script>
                                            <script>
                                                jQuery(document).ready(function() {		
                                                App.setPage("dynamic_table");  //Set current page
                                                App.init(); //Initialise plugins and elements
                                                });
                                            </script>
                                            <!-- /JAVASCRIPTS -->
                                            </body>
                                            </html>
