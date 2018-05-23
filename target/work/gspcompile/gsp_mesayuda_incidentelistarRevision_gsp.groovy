import pruebaSeguridad.Incidente
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_mesayuda_incidentelistarRevision_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/incidente/listarRevision.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
printHtmlPart(1)
createTagBody(1, {->
printHtmlPart(2)
invokeTag('captureMeta','sitemesh',6,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("layout"),'content':("main")],-1)
printHtmlPart(2)
invokeTag('set','g',7,['var':("entityName"),'value':(message(code: 'ticket.label', default: 'Ticket'))],-1)
printHtmlPart(2)
createTagBody(2, {->
createTagBody(3, {->
invokeTag('message','g',8,['code':("default.list.label"),'args':([entityName])],-1)
})
invokeTag('captureTitle','sitemesh',8,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',8,[:],2)
printHtmlPart(3)
})
invokeTag('captureHead','sitemesh',9,[:],1)
printHtmlPart(3)
createTagBody(1, {->
printHtmlPart(4)
invokeTag('message','g',11,['code':("default.link.skip.label"),'default':("Skip to content&hellip;")],-1)
printHtmlPart(5)
expressionOut.print(createLink(uri: '/incidente/index'))
printHtmlPart(6)
invokeTag('message','g',14,['code':("Página principal")],-1)
printHtmlPart(7)
invokeTag('message','g',19,['code':("default.list.label"),'args':([entityName])],-1)
printHtmlPart(8)
invokeTag('sortableColumn','g',24,['property':("folio"),'title':(message(code: 'ticket.folio.label', default: 'Folio'))],-1)
printHtmlPart(9)
invokeTag('sortableColumn','g',25,['property':("tema"),'title':(message(code: 'ticket.tema.label', default: 'Tema'))],-1)
printHtmlPart(9)
invokeTag('sortableColumn','g',26,['property':("tema"),'title':(message(code: 'ticket.estatus.label', default: 'Estatus'))],-1)
printHtmlPart(10)
invokeTag('message','g',27,['code':("ticket.registradoPor.label"),'default':("Registrado Por")],-1)
printHtmlPart(11)
invokeTag('sortableColumn','g',28,['property':("fechaAsignacion"),'title':(message(code: 'ticket.fechaAsignacion.label', default: 'Fecha Asignacion'))],-1)
printHtmlPart(12)
if(true && (revisados)) {
printHtmlPart(9)
for( _it1164726924 in (revisados) ) {
changeItVariable(_it1164726924)
printHtmlPart(13)
createTagBody(4, {->
expressionOut.print(it.folio)
})
invokeTag('link','g',36,['action':("show"),'id':(it.id)],4)
printHtmlPart(14)
expressionOut.print(it.tema)
printHtmlPart(15)
expressionOut.print(it.estatus)
printHtmlPart(16)
expressionOut.print(it.registradoPor?.username)
printHtmlPart(17)
invokeTag('formatDate','g',50,['format':("dd / MM / yyyy"),'date':(it.fechaAsignacion)],-1)
printHtmlPart(18)
}
printHtmlPart(19)
}
printHtmlPart(20)
invokeTag('paginate','g',59,['total':(ticketInstanceCount ?: 0)],-1)
printHtmlPart(21)
})
invokeTag('captureBody','sitemesh',64,[:],1)
printHtmlPart(22)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1525888016000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
