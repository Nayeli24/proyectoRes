<!DOCTYPE html>
<html>
    <head>
        <title>Atender incidente</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.3.5/sweetalert2.all.min.js"></script>
        <script src="${resource (dir: 'js', file: 'incidente.js')}"> </script>
    </head>
    <body>
        <div class="row">
            <div class="col-md-12">
         <!-- BOX -->
                <div class="box border primary">
                    <div class="box-title">
                        <h4><i class="fa fa-comment-o"></i>Solución</h4>
                    </div>
                    <div class="box-body big">
                        <g:form name="f1" id="f1" url="[action:'guardarSolucion',controller:'incidente']">      
                            <fieldset>
                                <textarea id="txtAten" name="solucion" onkeyup="mostrar();"  class="form-control" required="" value="${incidenteInstance?.solucion}"   rows="10" cols="20"  placeholder="Escribe solución..."></textarea>
                            </fieldset>
                            <fieldset>
                                <input type="hidden" id="${id}" name="id" value="${id}"  >                                
                            </fieldset><br>
                            <fieldset class="buttons">
                                <input type="button" name="atender" id="atender" onclick="confirmFunction();" value="Enviar solución" class="btn btn-success" style="display:none" />
                                <g:remoteLink controller="incidente" action="cargaArchivos" id="${id}" update ="[success:'message2',failure:'error']" > <input type="button" class="btn btn-primary" id="ca" name="ca"  value="Cargar archivos" style="display:none"/></g:remoteLink>
                                </fieldset>
                        </g:form>
                        <br>
                        <div id="message2"> </div>
                        <div id="error"> </div>
                    </div>
                </div>
<!-- /BOX -->
            </div>
        </div>
    <asset:javascript src="script.js"/>
    <script>
        jQuery(document).ready(function() {		
        App.setPage("dropzone_file_upload");  //Set current page
        App.init(); //Initialise plugins and elements
        });
    </script>
</body>

</html>


