<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Perfil de usuario</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
        <meta name="layout" content="main">
    </head>
</head>
<body>
   <!-- PAGE -->
    <section id="page">
        <div id="main-content">
     <!-- /SAMPLE BOX CONFIGURATION MODAL FORM-->
            <div class="container">
                <div class="row">
                    <div id="content" class="col-lg-12">
                            <!-- PAGE HEADER-->
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="page-header">
                                    <div class="clearfix">
                                        <h3 class="content-title pull-left">Perfil de usuario</h3>
                                    </div>
                                    <div class="description">Caracteristicas </div>
                                </div>
                            </div>
                        </div>
                        <!-- /PAGE HEADER -->
                        <div class="box border primary">
                            <div class="box-title">
                                <h3 class="form-title">${usuario.nombre}</h3>
                            </div>  
                            <div class="box-body big">
                                <g:if test="${flash.message}">
                                    <div class="message" role="status">${flash.message}</div>
                                </g:if>

                                <g:if test="${usuario?.username}">
                                    <li>
                                        <label>Username:</label><label>${usuario?.username.toString()}</label>
                                    </li>
                                </g:if>

                                <g:if test="${usuario?.nombre}">
                                    <li class="fieldcontain">
                                        <span id="nombre-label" class="property-label">Nombre completo</span>

                                        <span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${usuario}" field="nombre"/></span>

                                    </li>
                                </g:if>


                                <g:if test="${usuario?.areaDpto}">
                                    <li class="fieldcontain">
                                        <span id="areaDpto-label" class="property-label"><g:message code="usuario.areaDpto.label" default="Area Dpto" /></span>

                                        <span class="property-value" aria-labelledby="areaDpto-label"><g:fieldValue bean="${usuario}" field="areaDpto"/></span>

                                    </li>
                                </g:if>

                                <g:if test="${usuario?.empresa}">
                                    <li class="fieldcontain">
                                        <span id="empresa-label" class="property-label"><g:message code="usuario.empresa.label" default="Empresa" /></span>

                                        <span class="property-value" aria-labelledby="empresa-label"><g:link controller="empresa" action="show" id="${usuario?.empresa?.id}">${usuario?.empresa?.encodeAsHTML()}</g:link></span>

                                    </li>
                                </g:if>

                                <g:if test="${usuario?.email}">
                                    <li class="fieldcontain">
                                        <span id="email-label" class="property-label"><g:message code="usuario.email.label" default="Email" /></span>

                                        <span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${usuario}" field="email"/></span>

                                    </li>
                                </g:if>
                                <g:if test="${usuario?.authorities}">
                                    <li class="fieldcontain">
                                        <span id="email-label" class="property-label">tipo de usuario:</span>

                                        <span class="property-value" aria-labelledby="email-label">${usuario?.authorities}</span>

                                    </li>
                                </g:if>


                                <ol>



                                </ol>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--PAGE-->
</body>
</html>
