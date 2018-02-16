<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'comentario.label', default: 'Comentario')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-comentario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><g:link class="show" controller="incidente" action="show" id="${comentarioInstance.incidente.id}"><g:message code="Regresar" args="[entityName]" /></g:link></li>
                    <sec:ifAnyGranted roles='ROLE_DESARROLLADOR'>
                        <li><a href="${createLink(uri: '/incidente/listarRevision')}"><g:message code="Incidentes en revisión"/></a></li>
                </sec:ifAnyGranted>
            </ul>
        </div>
        <div id="create-comentario" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${comentarioInstance}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${comentarioInstance}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                </ul>
            </g:hasErrors>
            <g:form url="[resource:comentarioInstance, action:'save']" >
                <fieldset class="form">
                    <g:render template="form"/>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.enviar.label', default: 'Enviar')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
