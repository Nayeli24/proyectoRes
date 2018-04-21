<!DOCTYPE html>
<html>
    <head>
        <title><g:layoutTitle default="Inicio"/></title>

    <r:layoutResources />
 
<!--    <asset:stylesheet src="application.css"/>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>Inicio</title>
<!--        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">-->
<!--  <g:external dir="web-app/js" file="script.js"/>
    <script>
        jQuery(document).ready(function() {		
        App.setPage("dynamic_table");  //Set current page
        App.init(); //Initialise plugins and elements
        });
    </script>-->
    <!-- STYLESHEETS --><!--[if lt IE 9]><script src="js/flot/excanvas.min.js"></script><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script><![endif]-->
    <g:external dir="css" file="cloud-admin.css" />
    <g:external dir="css" file="default.css" />
    <g:external dir="css/themes" file="night.css"  />
    <g:external dir="css" file="responsive.css"  />
    <g:external dir="font-awesome/css" file="font-awesome.min.css"  />            
    <!-- JQUERY UI-->
    <g:external dir="js/jquery-ui-1.10.3.custom/css/custom-theme" file="jquery-ui-1.10.3.custom.min.css"  />
    <!-- DATE RANGE PICKER -->
    <g:external dir="js/bootstrap-daterangepicker" file="daterangepicker-bs3.css"/>
    <!-- DATA TABLES -->
    <g:external dir="js/datatables/media/css" file="jquery.dataTables.min.css"/>
    <g:external dir="js/datatables/media/assets/css" file="datatables.min.css"/>
    <g:external dir="js/datatables/extras/TableTools/media/css" file="TableTools.min.css"/>
      <!-- FONTS -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700' rel='stylesheet' type='text/css'>
    <!-- DROPZONE -->
    <g:external dir="js/dropzone" file="dropzone.min.css" />

    <g:layoutHead/>
</head>
<body>

<!-- <g:render template="/layouts/header" />
<!-- SIDEBAR
<g:render template="/layouts/navbar" />
<!-- /SIDEBAR -->
    <g:layoutBody/>
<!--<asset:javascript src="application.js"/>-->
  <!-- JAVASCRIPTS -->
    <!-- Placed at the end of the document so the pages load faster -->
         <!-- JQUERY -->

    <g:external dir="js/jquery" file="jquery-2.0.3.min.js" />
    <!-- JQUERY UI-->
    <g:external dir="js/jquery-ui-1.10.3.custom/js" file="jquery-ui-1.10.3.custom.min.js" />
    <!-- BOOTSTRAP -->
    <g:external dir="bootstrap-dist/js" file="bootstrap.min.js" />
    <!-- DATE RANGE PICKER -->
    <g:external dir="js/bootstrap-daterangepicker" file="moment.min.js" />
    <g:external dir="js/bootstrap-daterangepicker" file="daterangepicker.min.js" />
     <!-- SLIMSCROLL -->
    <g:external dir="js/jQuery-slimScroll-1.3.0" file="jquery.slimscroll.min.js" />
    <g:external dir="js/jQuery-slimScroll-1.3.0" file="slimScrollHorizontal.min.js" />
<!-- BLOCK UI -->
    <g:external dir="js/jQuery-BlockUI" file="jquery.blockUI.min.js" />
     <!-- DROPZONE -->
    <g:external dir="js/dropzone" file="dropzone.min.js"/>
<!-- DATA TABLES -->
    <g:external dir="js/datatables/media/js" file="jquery.dataTables.min.js" />
    <g:external dir="js/datatables/media/assets/js" file="datatables.min.js" />
    <g:external dir="js/datatables/extras/TableTools/media/js" file="TableTools.min.js" />
    <g:external dir="js/datatables/extras/TableTools/media/js" file="ZeroClipboard.min.js" />
    <!-- COOKIE -->
    <g:external dir="js/jQuery-Cookie" file="jquery.cookie.min.js" />

   <!-- CUSTOM SCRIPT -->
       <asset:javascript src="script.js"/>
    <script>
        jQuery(document).ready(function() {		
        App.setPage("dynamic_table");  //Set current page
        App.init(); //Initialise plugins and elements
        });
    </script>
        <!-- /JAVASCRIPTS -->
</body>
</html>

