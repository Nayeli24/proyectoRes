<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

                             <!-- SIDEBAR-->
<sec:ifLoggedIn>
<div id="sidebar" class="sidebar">
    <div class="sidebar-menu nav-collapse">
<!-- SIDEBAR MENU -->    
        <ul>
            <li>
                <g:link class="" controller="incidente" action="index">
                    <i class="fa fa-list-ul fa-fw"></i> <span class="menu-text">Incidentes</span>
                    <span class="selected"></span>
                </g:link>					
            </li>
            <sec:ifAnyGranted roles='ROLE_ADMIN'>
                <li class="has-sub ">
                    <a href="javascript:;" class="">
                        <i class="fa fa-users fa-fw"></i> <span class="menu-text">Usuarios</span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub">

                        <li><g:link class="" controller="usuario" action="index"><span class="sub-menu-text">Usuarios registrados</span></g:link></li>
                        <li><g:link class="" controller="usuario" action="create"><span class="sub-menu-text">Crear usuario</span></g:link></li>
                      <!--  <li><g:link class="" controller="usuario" action="update"><span class="sub-menu-text">Dar de baja usuario</span></g:link></li>-->
                    </ul>
                </li>
                <li class="has-sub ">
                    <a href="javascript:;" class="">
                        <i class="fa fa-suitcase fa-fw"></i> <span class="menu-text">Empresas</span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub">
                        <li><g:link class="" controller="empresa" action="index"><span class="sub-menu-text">Empresas registradas</span></g:link></li>
                        <li><g:link class="" controller="empresa" action="create"><span class="sub-menu-text">Nueva empresa</span></g:link></li>
                        </ul>
                    </li>

                <li>
                    <g:link class="" controller="incidente" action="asignar"> 
                        <i class="fa fa-pencil-square-o fa-fw"></i> <span class="menu-text">Asignar incidente</span>
                        <span class="selected"></span>
                    </g:link>					
                </li>
            </sec:ifAnyGranted>
            <sec:ifAnyGranted roles='ROLE_CLIENTE'>

                <li>
                    <g:link class="" action="create"> 
                        <i class="fa fa-edit fa-fw"></i> <span class="menu-text">Nuevo incidente</span>
                        <span class="selected"></span>
                    </g:link>					
                </li>
            </sec:ifAnyGranted>
        </ul>
         <!-- /SIDEBAR MENU -->
    </div>
</div>
</sec:ifLoggedIn>
    