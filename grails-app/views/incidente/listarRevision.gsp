
<%@ page import="pruebaSeguridad.Incidente" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'ticket.label', default: 'Ticket')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-ticket" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>    
                <li><a class="home" href="${createLink(uri: '/incidente/index')}"><g:message code="Página principal"/></a></li>     
            </ul>
        </div>

        <div id="list-ticket" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>

            <table>
                <thead>
                    <tr>
                        <g:sortableColumn property="folio" title="${message(code: 'ticket.folio.label', default: 'Folio')}" />
                        <g:sortableColumn property="tema" title="${message(code: 'ticket.tema.label', default: 'Tema')}" />
                        <g:sortableColumn property="tema" title="${message(code: 'ticket.estatus.label', default: 'Estatus')}" />
                        <th><g:message code="ticket.registradoPor.label" default="Registrado Por" /></th>
                            <g:sortableColumn property="fechaAsignacion" title="${message(code: 'ticket.fechaAsignacion.label', default: 'Fecha Asignacion')}" />
                    </tr>
                </thead>
                <tbody>
                    <g:if test="${revisados}">
                        <g:each name="revisados" in="${revisados}">	
                            <tr >
                                <td  class="left tableTitleColor font12 paddingTop12 paddingRight12 paddingBottom5 paddingLeft10 textUpper">
                                    <g:link action="show" id="${it.id}">${it.folio}</g:link>

                                </td>	
                                <td  class="left tableTitleColor font12 paddingTop12 paddingRight12 paddingBottom5 paddingLeft10 textUpper">
                                    <span class="font14 textlower tableDescriptionColor">${it.tema}  </span>
                                </td>
                                <td  class="left tableTitleColor font12 paddingTop12 paddingRight12 paddingBottom5 paddingLeft10 textUpper">
                                    <span class="font14 textlower tableDescriptionColor">${it.estatus}  </span>
                                </td>

                                <td  class="left tableTitleColor font12 paddingTop12 paddingRight12 paddingBottom5 paddingLeft10 textUpper">
                                    <span class="font14 textlower tableDescriptionColor">${it.registradoPor?.username}  </span>
                                </td>	
                                <td  class="left tableTitleColor font12 paddingTop12 paddingRight12 paddingBottom5 paddingLeft10 textUpper">
                                    <span class="font14 textlower tableDescriptionColor"><g:formatDate format="dd / MM / yyyy" date="${it.fechaAsignacion}"/></span>
                                </td>	
                            </tr>
                        </g:each>
                    </g:if>
                </tbody>
            </table>

            <div class="pagination">
                <g:paginate total="${ticketInstanceCount ?: 0}" />
            </div>

        </div>

    </body>
</html>
