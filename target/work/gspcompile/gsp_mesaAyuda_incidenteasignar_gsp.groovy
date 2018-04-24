import pruebaSeguridad.Incidente
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_mesaAyuda_incidenteasignar_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/incidente/asignar.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
printHtmlPart(1)
createTagBody(1, {->
printHtmlPart(2)
invokeTag('captureMeta','sitemesh',6,['gsp_sm_xmlClosingForEmptyTag':(""),'http-equiv':("content-type"),'content':("text/html; charset=UTF-8")],-1)
printHtmlPart(2)
invokeTag('captureMeta','sitemesh',7,['gsp_sm_xmlClosingForEmptyTag':(""),'charset':("utf-8")],-1)
printHtmlPart(2)
createTagBody(2, {->
createClosureForHtmlPart(3, 3)
invokeTag('captureTitle','sitemesh',8,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',8,[:],2)
printHtmlPart(2)
invokeTag('captureMeta','sitemesh',9,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("viewport"),'content':("width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no")],-1)
printHtmlPart(2)
invokeTag('captureMeta','sitemesh',10,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("layout"),'content':("main")],-1)
printHtmlPart(4)
})
invokeTag('captureHead','sitemesh',11,[:],1)
printHtmlPart(4)
createTagBody(1, {->
printHtmlPart(5)
if(true && (flash.message)) {
printHtmlPart(6)
expressionOut.print(flash.message)
printHtmlPart(7)
}
printHtmlPart(8)
createTagBody(2, {->
printHtmlPart(9)
if(true && (detalle)) {
printHtmlPart(10)
expressionOut.print(flash.message)
printHtmlPart(11)
}
printHtmlPart(12)
invokeTag('select','g',52,['id':("asignadoA"),'name':("asignadoA"),'from':(detalle.usuarios),'optionKey':("id"),'optionValue':("nombreCompleto"),'class':("form-control")],-1)
printHtmlPart(13)
invokeTag('select','g',60,['multiple':("true"),'id':("incidente"),'name':("incidente"),'from':(detalle.incidentes),'optionKey':("id"),'optionValue':("tema"),'value':(detalle.incidentes?.id),'class':("form-control")],-1)
printHtmlPart(14)
if(true && (detalle.incidentes)) {
printHtmlPart(15)
invokeTag('submitButton','g',66,['name':("asignar"),'class':("btn btn-success"),'value':("Asignar")],-1)
printHtmlPart(16)
}
else {
printHtmlPart(17)
expressionOut.print(flash.error?.encodeAsHTML())
printHtmlPart(18)
}
printHtmlPart(19)
})
invokeTag('form','g',75,['controller':("incidente"),'action':("asignarIncidente")],2)
printHtmlPart(20)
})
invokeTag('captureBody','sitemesh',81,[:],1)
printHtmlPart(21)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1523374395000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
