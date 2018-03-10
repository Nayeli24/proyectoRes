<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->
<%@ page import="pruebaSeguridad.Incidente" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<sec:ifAnyGranted roles='ROLE_DESARROLLADOR'>
    <div >
        <label for="Solución">
            <g:message code="incidente.solucion.label" default="Solución" />
        </label>
        <g:textArea name="solucion" required="" value="${incidenteInstance?.solucion}" rows="20" cols="40"/>
        </div>
    <div >
        <label for="Seleccionar archivo ">
            <g:message code="incidente.seleccionararchivo.label" default="Seleccionar Archivo" />
            <span class="required-indicator">*</span>
        </label>
