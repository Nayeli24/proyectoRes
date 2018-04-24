import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_mesaAyuda_usuariousuariolog_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/usuario/usuariolog.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
printHtmlPart(1)
createTagBody(1, {->
printHtmlPart(2)
invokeTag('captureMeta','sitemesh',12,['gsp_sm_xmlClosingForEmptyTag':(""),'http-equiv':("content-type"),'content':("text/html; charset=UTF-8")],-1)
printHtmlPart(3)
invokeTag('captureMeta','sitemesh',13,['gsp_sm_xmlClosingForEmptyTag':(""),'charset':("utf-8")],-1)
printHtmlPart(3)
createTagBody(2, {->
createClosureForHtmlPart(4, 3)
invokeTag('captureTitle','sitemesh',14,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',14,[:],2)
printHtmlPart(3)
invokeTag('captureMeta','sitemesh',15,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("viewport"),'content':("width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no")],-1)
printHtmlPart(3)
invokeTag('captureMeta','sitemesh',16,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("layout"),'content':("main")],-1)
printHtmlPart(5)
})
invokeTag('captureHead','sitemesh',17,[:],1)
printHtmlPart(6)
createTagBody(1, {->
printHtmlPart(7)
expressionOut.print(usuario.nombre)
printHtmlPart(8)
if(true && (flash.message)) {
printHtmlPart(9)
expressionOut.print(flash.message)
printHtmlPart(10)
}
printHtmlPart(11)
if(true && (usuario?.username)) {
printHtmlPart(12)
expressionOut.print(usuario?.username.toString())
printHtmlPart(13)
}
printHtmlPart(11)
if(true && (usuario?.nombre)) {
printHtmlPart(14)
invokeTag('fieldValue','g',58,['bean':(usuario),'field':("nombre")],-1)
printHtmlPart(15)
}
printHtmlPart(16)
if(true && (usuario?.areaDpto)) {
printHtmlPart(17)
invokeTag('message','g',66,['code':("usuario.areaDpto.label"),'default':("Area Dpto")],-1)
printHtmlPart(18)
invokeTag('fieldValue','g',68,['bean':(usuario),'field':("areaDpto")],-1)
printHtmlPart(15)
}
printHtmlPart(11)
if(true && (usuario?.empresa)) {
printHtmlPart(19)
invokeTag('message','g',75,['code':("usuario.empresa.label"),'default':("Empresa")],-1)
printHtmlPart(20)
createTagBody(3, {->
expressionOut.print(usuario?.empresa?.encodeAsHTML())
})
invokeTag('link','g',77,['controller':("empresa"),'action':("show"),'id':(usuario?.empresa?.id)],3)
printHtmlPart(15)
}
printHtmlPart(11)
if(true && (usuario?.email)) {
printHtmlPart(21)
invokeTag('message','g',84,['code':("usuario.email.label"),'default':("Email")],-1)
printHtmlPart(22)
invokeTag('fieldValue','g',86,['bean':(usuario),'field':("email")],-1)
printHtmlPart(15)
}
printHtmlPart(23)
if(true && (usuario?.authorities)) {
printHtmlPart(24)
expressionOut.print(usuario?.authorities)
printHtmlPart(15)
}
printHtmlPart(25)
})
invokeTag('captureBody','sitemesh',114,[:],1)
printHtmlPart(26)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1521691988000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
