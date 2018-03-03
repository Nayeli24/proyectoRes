<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>


<header class="navbar clearfix" id="header">
    <div class="container">
        <div class="navbar-brand">
                <!-- COMPANY LOGO -->
          <!--  <a href="index.html">
                <img src="img/logo/logo.png" alt="Cloud Admin Logo" class="img-responsive" height="30" width="120">
            </a>
            <!-- /COMPANY LOGO -->
            <!-- TEAM STATUS FOR MOBILE -->
            <sec:ifLoggedIn>
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
                    <li><g:link class="" controller="usuario" action="usuarioLog"><i class="fa fa-user"></i> My Profile</g:link></li>


                    <li><g:link controller="logout"><i class="fa fa-power-off"></i>Cerrar Sesion</g:link></li>

                </ul>
            </li>
            </sec:ifLoggedIn> 
            <sec:ifNotLoggedIn roles='ROLE_CLIENTE,ROLE_ADMIN,ROLE_DESARROLLADOR'>
                <li class="dropdown user" id="header-user">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-user"></i>
                        <span class="username"><sec:loggedInUserInfo field="username"/></span>
                        <i class="fa fa-angle-down"></i>
                    </a>
                    <ul class="dropdown-menu">
                        <li><g:link controller="login"><i class="fa fa-unlock-alt"></i>Iniciar Sesion</g:link></li>           
                        </ul>
                    </li>
                </sec:ifNotLoggedIn>
                    <!-- END USER LOGIN DROPDOWN -->
        </ul>
        <!-- END TOP NAVIGATION MENU -->
    </div>
</header>
<!--/HEADER -->

