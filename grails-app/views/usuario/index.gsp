
<%@ page import="pruebaSeguridad.Usuario" %>
<%@ page import="pruebaSeguridad.Incidente" %>
<!DOCTYPE html>
<html>
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
        
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
           <g:render template="/layouts/header" />
         
<!-- PAGE -->
            <section id="page">
                  <!-- SIDEBAR-->
         <g:render template="/layouts/navbar" />
        <a href="#list-usuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                  <li><a class="home" href="${createLink(uri: '/incidente/index')}"><g:message code="Regresar"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
            <div id="list-usuario" class="content scaffold-list" role="main">
                <h1>ghfdgfgdgdfdghgfgfghfghfh</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <thead>
                    <tr>

                        <g:sortableColumn property="username" title="${message(code: 'usuario.username.label', default: 'Username')}" />

                        <g:sortableColumn property="password" title="${message(code: 'usuario.password.label', default: 'Password')}" />

                        <g:sortableColumn property="nombre" title="${message(code: 'usuario.nombre.label', default: 'Nombre')}" />

                        <g:sortableColumn property="apellidoPat" title="${message(code: 'usuario.apellidoPat.label', default: 'Apellido Pat')}" />

                        <g:sortableColumn property="apellidoMat" title="${message(code: 'usuario.apellidoMat.label', default: 'Apellido Mat')}" />

                        <g:sortableColumn property="areaDpto" title="${message(code: 'usuario.areaDpto.label', default: 'Area Dpto')}" />

                    </tr>
                </thead>
                <tbody>
                    <g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                            <td><g:link action="show" id="${usuarioInstance.id}">${fieldValue(bean: usuarioInstance, field: "username")}</g:link></td>

                            <td>${fieldValue(bean: usuarioInstance, field: "password")}</td>

                            <td>${fieldValue(bean: usuarioInstance, field: "nombre")}</td>

                            <td>${fieldValue(bean: usuarioInstance, field: "apellidoPat")}</td>

                            <td>${fieldValue(bean: usuarioInstance, field: "apellidoMat")}</td>

                            <td>${fieldValue(bean: usuarioInstance, field: "areaDpto")}</td>

                        </tr>
                    </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${usuarioInstanceCount ?: 0}" />
            </div>
        </div>
    </body>
</html>
