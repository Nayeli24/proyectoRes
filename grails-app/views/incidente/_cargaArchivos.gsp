<!-- DROPZONE -->

            <!-- BOX -->
        <div class="box border blue">
            <div class="box-title">
                <h4><i class="fa fa-cloud-download"></i>Cargar Archivos</h4>
              
            </div>
            <div class="box-body">

                <div class="fallback">
                    <form  action="http://localhost:8080/MesaAyuda/incidente/upload" class="dropzone" id="my-awesome-dropzone">

                        <div class="fallback">
                            <input name="file" type="file" multiple=""  />
                        </div>

                    </form>

                </div>          

            </div>
        </div>
        <!-- /BOX -->

<!-- /DROPZONE -->




<script src="http://localhost:8080/MesaAyuda/js/script.js"></script>
<script>
    jQuery(document).ready(function() {		
    App.setPage("dropzone_file_upload");  //Set current page
    App.init(); //Initialise plugins and elements
    });
</script>
     <script>
  <!--  // bind the on-change event
    $(document).ready(function() {
    $("#upload-file-input").on("change", uploadFile);
    });

    
    function uploadFile() {
    $.ajax({
    url: "http://localhost:8080/MesaAyuda/incidente/upload",
    type: "POST",
    data: new FormData($("#my-awesome-dropzone")[0]),

    processData: false,
    contentType: false,
    cache: false,

    });
    } // function uploadFile-->
</script>


