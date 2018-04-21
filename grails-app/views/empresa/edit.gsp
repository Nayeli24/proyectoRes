<%@ page import="pruebaSeguridad.Empresa" %>
<!DOCTYPE html>
<html>
    <head>

        <script src="./path/to/dropzone.js"></script>
        <title>Dar de baja empresa</title>


        <g:external dir="js/dropzone" file="dropzone.min.js" />     
        <script src="https://rawgit.com/enyo/dropzone/master/dist/dropzone.js"></script>
        <link rel="stylesheet" href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css">
    </head>
    <body>
        <div class="row">
            <div class="col-md-12">
                    <!-- BOX -->
                <div class="box border inverse">
                    <div class="box-title">
                        <h4><i class="fa  fa-wrench"></i>Empresa ${empresaInstance.id}</h4>

                    </div>
                    <div class="box-body">

                        <g:form url="[resource:empresaInstance, action:'update']" method="PUT" >
                              <fieldset>
                                Empresa "${empresaInstance.nombreEmpresa}"
                            </fieldset>
                            <fieldset>
                                Empresa activa: <g:checkBox name="enabled" value="${empresaInstance?.enabled}" />
                            </fieldset>
                            <fieldset class="buttons">
                                <g:actionSubmit class="btn btn-success" action="update" value="Enviar" />
                            </fieldset>
                        </g:form>

                    </div>
                </div>
                                <!-- /BOX -->
            </div>
        </div>




    </body>

</html>



