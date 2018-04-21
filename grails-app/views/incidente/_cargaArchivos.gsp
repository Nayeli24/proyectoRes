<!-- DROPZONE -->

            <!-- BOX -->
        <div class="box border blue">
            <div class="box-title">
                <h4><i class="fa fa-cloud-download"></i>Cargar Archivos</h4>
              
            </div>
            <div class="box-body">

                <div class="fallback">
                    <g:form  controller="incidente" action="upload" class="dropzone" id="my-awesome-dropzone">

                        <div class="fallback">
                            <input name="file" type="file" multiple=""  />
                        </div>

                    </g:form>

                </div>          

            </div>
        </div>
        <!-- /BOX -->

<!-- /DROPZONE -->




       <asset:javascript src="script.js"/>

<script>
    jQuery(document).ready(function() {		
    App.setPage("dropzone_file_upload");  //Set current page
    App.init(); //Initialise plugins and elements
    });
</script>
  


