
<%@ page import="pruebaSeguridad.Incidente" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'incidente.label', default: 'Incidente')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-incidente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
            <sec:ifAnyGranted roles='ROLE_ADMIN'>
		<div id="list-incidente" class="content scaffold-list" role="main">
			<h1><g:message code="Asignar Incidentes"  /></h1>
                
			<g:form controller="incidente" action="asignarIncidente" >
                            <g:if test="${detalle}">
                                <div class="message" role="status">${flash.message}</div>
                            </g:if>
                        
				<fieldset class="form">
                                    <div class="fieldcontain ">
                                        <label for="asignadoA">
                                            <g:message code="asignadoA" default="AsignadoA" />
		
                                        </label>
                                            <g:select id="asignadoA" name="asignadoA" from="${detalle.usuarios}"   optionKey="id"  value="${detalle.usuarios?.id}" noSelection="['':'Selecciona un Usuario']"  />
                                    </div>

                                    <div class="fieldcontain ">
                                        <label for="incidente">
                                            <g:message code="incidente" default="Folio Incidente" />
                                	</label>
                                            <g:select id="incidente" name="incidente" from="${detalle.incidentes}" optionKey="id"  value="${detalle.incidentes?.id}" noSelection="['':'Selecciona un Incidente']" />

                                    </div>
					
				</fieldset>
                                
				<fieldset class="buttons">
				<g:submitButton name="asignar" class="save" value="Asignar" />
				</fieldset>
			</g:form>
		</div>
            </sec:ifAnyGranted>  
	</body>
</html>
