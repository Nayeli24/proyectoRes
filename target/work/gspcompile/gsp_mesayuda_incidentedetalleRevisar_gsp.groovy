import pruebaSeguridad.Incidente
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_mesayuda_incidentedetalleRevisar_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/incidente/detalleRevisar.gsp" }
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
invokeTag('set','g',7,['var':("entityName"),'value':(message(code: 'incidente.label', default: 'Incidente'))],-1)
printHtmlPart(2)
createTagBody(2, {->
createTagBody(3, {->
invokeTag('message','g',8,['code':("Detalle incidente"),'args':([entityName])],-1)
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
expressionOut.print(createLink(uri: '/incidente/listarRevision'))
printHtmlPart(6)
invokeTag('message','g',15,['code':("Incidentes en Revisión")],-1)
printHtmlPart(8)
createClosureForHtmlPart(9, 2)
invokeTag('link','g',16,['controller':("comentario"),'action':("index"),'id':(detalle.id)],2)
printHtmlPart(10)
createTagBody(2, {->
invokeTag('message','g',17,['code':("Nuevo Comentario"),'args':([entityName])],-1)
})
invokeTag('link','g',17,['class':("create"),'controller':("comentario"),'action':("create"),'id':(detalle.id)],2)
printHtmlPart(11)
invokeTag('message','g',21,['code':("Detalle Incidente Asignado"),'args':([entityName])],-1)
printHtmlPart(12)
if(true && (detalle)) {
printHtmlPart(13)
expressionOut.print(flash.message)
printHtmlPart(14)
}
printHtmlPart(15)
if(true && (detalle.folio)) {
printHtmlPart(16)
invokeTag('message','g',28,['code':("folioIncidente.folio"),'default':("Folio ")],-1)
printHtmlPart(17)
expressionOut.print(detalle.folio)
printHtmlPart(18)
}
printHtmlPart(19)
if(true && (detalle.tema)) {
printHtmlPart(16)
invokeTag('message','g',35,['code':("folioIncidente.tema"),'default':("Tema")],-1)
printHtmlPart(17)
expressionOut.print(detalle.tema)
printHtmlPart(20)
}
printHtmlPart(21)
if(true && (detalle.descripcion)) {
printHtmlPart(16)
invokeTag('message','g',43,['code':("folioIncidente.descripcion"),'default':("Descripción")],-1)
printHtmlPart(17)
expressionOut.print(detalle.descripcion)
printHtmlPart(20)
}
printHtmlPart(19)
if(true && (detalle.fechaAsignacion)) {
printHtmlPart(16)
invokeTag('message','g',51,['code':("fechaAsisgnacion"),'default':("Fecha De Asignación")],-1)
printHtmlPart(17)
invokeTag('formatDate','g',53,['format':("dd / MM / yyyy"),'date':(detalle.fechaAsignacion)],-1)
printHtmlPart(20)
}
printHtmlPart(19)
if(true && (detalle.registradoPor)) {
printHtmlPart(16)
invokeTag('message','g',59,['code':("folioIncidente.registradoPor"),'default':("Usuario Que Registró")],-1)
printHtmlPart(17)
expressionOut.print(detalle.registradoPor.username)
printHtmlPart(20)
}
printHtmlPart(19)
if(true && (detalle.estatus?.id == 4)) {
printHtmlPart(16)
invokeTag('message','g',67,['code':("detalle.respuestaPeticion"),'default':("Solucion Peticion")],-1)
printHtmlPart(22)
expressionOut.print(detalle.respuestaPeticion)
printHtmlPart(20)
}
printHtmlPart(23)
createTagBody(2, {->
printHtmlPart(24)
if(true && (detalle.estatus?.id == 3)) {
printHtmlPart(25)
createTagBody(4, {->
printHtmlPart(26)
invokeTag('hiddenField','g',78,['name':("id"),'value':(detalle.id)],-1)
printHtmlPart(26)
invokeTag('textArea','g',79,['cols':("30"),'rows':("4"),'name':("respuesta"),'style':("width:400px; height: 200px;")],-1)
printHtmlPart(26)
invokeTag('actionSubmit','g',80,['class':("edit"),'value':("Atender")],-1)
printHtmlPart(25)
})
invokeTag('form','g',81,['controller':("incidente"),'action':("atender")],4)
printHtmlPart(27)
}
printHtmlPart(28)
invokeTag('actionSubmit','g',83,['class':("delete"),'action':("delete"),'value':(message(code: 'default.button.delete.label', default: 'Delete')),'onclick':("return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');")],-1)
printHtmlPart(29)
})
invokeTag('form','g',85,[:],2)
printHtmlPart(30)
})
invokeTag('captureBody','sitemesh',89,[:],1)
printHtmlPart(31)
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
