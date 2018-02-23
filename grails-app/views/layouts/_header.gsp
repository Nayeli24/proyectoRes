<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Inicio</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- STYLESHEETS --><!--[if lt IE 9]><script src="js/flot/excanvas.min.js"></script><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script><![endif]-->
        <link rel="stylesheet" type="text/css" href="../css/cloud-admin.css" >
        <link rel="stylesheet" type="text/css"  href="../css/themes/night.css" id="skin-switcher" >
        <link rel="stylesheet" type="text/css"  href="../css/responsive.css" >

        <link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <!-- JQUERY UI-->
        <link rel="stylesheet" type="text/css" href="../js/jquery-ui-1.10.3.custom/css/custom-theme/jquery-ui-1.10.3.custom.min.css" />
        <!-- DATE RANGE PICKER -->
        <link rel="stylesheet" type="text/css" href="../js/bootstrap-daterangepicker/daterangepicker-bs3.css" />
        <!-- DATA TABLES -->
        <link rel="stylesheet" type="text/css" href="../js/datatables/media/css/jquery.dataTables.min.css" />
        <link rel="stylesheet" type="text/css" href="../js/datatables/media/assets/css/datatables.min.css" />
        <link rel="stylesheet" type="text/css" href="../js/datatables/extras/TableTools/media/css/TableTools.min.css" />
        <!-- FONTS -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700' rel='stylesheet' type='text/css'>
    </head>
    <body>
            <!-- HEADER -->
        <header class="navbar clearfix" id="header">
            <div class="container">
                <div class="navbar-brand">
                        <!-- COMPANY LOGO -->
                  <!--  <a href="index.html">
                        <img src="img/logo/logo.png" alt="Cloud Admin Logo" class="img-responsive" height="30" width="120">
                    </a>
                    <!-- /COMPANY LOGO -->
                    <!-- TEAM STATUS FOR MOBILE -->
                    <div class="visible-xs">
                        <a href="#" class="team-status-toggle switcher btn dropdown-toggle">
                            <i class="fa fa-users"></i>
                        </a>
                    </div>
                    <!-- /TEAM STATUS FOR MOBILE -->
                    <!-- SIDEBAR COLLAPSE -->
                    <div id="sidebar-collapse" class="sidebar-collapse btn" >
                        <i class="fa fa-bars" 
                        data-icon1="fa fa-bars" 
                        data-icon2="fa fa-bars" src="../images/lista.png"></i>
                    </div>
                    <!-- /SIDEBAR COLLAPSE -->
                </div>
                <!-- NAVBAR LEFT -->
            <!--    <ul class="nav navbar-nav pull-left hidden-xs" id="navbar-left">
                    <li class="dropdown">
                        <a href="#" class="team-status-toggle dropdown-toggle tip-bottom" data-toggle="tooltip" title="Toggle Team View">
                            <i class="fa fa-users"></i>
                            <span class="name">Team Status</span>
                            <i class="fa fa-angle-down"></i>
                        </a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-cog"></i>
                            <span class="name">Skins</span>
                            <i class="fa fa-angle-down"></i>
                        </a>
                        <ul class="dropdown-menu skins">
                            <li class="dropdown-title">
                                <span><i class="fa fa-leaf"></i> Theme Skins</span>
                            </li>
                            <li><a href="#" data-skin="default">Subtle (default)</a></li>
                            <li><a href="#" data-skin="night">Night</a></li>
                            <li><a href="#" data-skin="earth">Earth</a></li>
                            <li><a href="#" data-skin="utopia">Utopia</a></li>
                            <li><a href="#" data-skin="nature">Nature</a></li>
                            <li><a href="#" data-skin="graphite">Graphite</a></li>
                        </ul>
                    </li>
                </ul>
                <!-- /NAVBAR LEFT -->
                <!-- BEGIN TOP NAVIGATION MENU -->					
                <ul class="nav navbar-nav pull-right">
                   <!-- BEGIN USER LOGIN DROPDOWN -->
                    <li class="dropdown user" id="header-user">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                             <i class="fa fa-user"></i>
                            <span class="username"><sec:loggedInUserInfo field="username"/></span>
                            <i class="fa fa-angle-down"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="#"><i class="fa fa-user"></i> My Profile</a></li>
                            <li><a href="#"><i class="fa fa-cog"></i> Account Settings</a></li>
                            <li><a href="#"><i class="fa fa-eye"></i> Privacy Settings</a></li>
                            <sec:ifLoggedIn>

                                <li><g:link controller="logout"><i class="fa fa-power-off"></i>Cerrar Sesion</g:link></li>
                                </sec:ifLoggedIn>
                            </ul>
                        </li>
                        <!-- END USER LOGIN DROPDOWN -->
                </ul>
                <!-- END TOP NAVIGATION MENU -->
            </div>
            </header>
	<!--/HEADER -->
                                

    </body>
</html>
