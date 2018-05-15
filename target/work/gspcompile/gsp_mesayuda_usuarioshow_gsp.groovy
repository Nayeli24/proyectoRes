import pruebaSeguridad.Usuario
import pruebaSeguridad.Incidente
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_mesayuda_usuarioshow_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/usuario/show.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
printHtmlPart(0)
printHtmlPart(1)
createTagBody(1, {->
printHtmlPart(2)
invokeTag('captureMeta','sitemesh',7,['gsp_sm_xmlClosingForEmptyTag':(""),'http-equiv':("content-type"),'content':("text/html; charset=UTF-8")],-1)
printHtmlPart(2)
invokeTag('captureMeta','sitemesh',8,['gsp_sm_xmlClosingForEmptyTag':(""),'charset':("utf-8")],-1)
printHtmlPart(2)
createTagBody(2, {->
createClosureForHtmlPart(3, 3)
invokeTag('captureTitle','sitemesh',9,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',9,[:],2)
printHtmlPart(4)
invokeTag('captureMeta','sitemesh',11,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("viewport"),'content':("width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no")],-1)
printHtmlPart(2)
invokeTag('captureMeta','sitemesh',12,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("layout"),'content':("main")],-1)
printHtmlPart(5)
})
invokeTag('captureHead','sitemesh',14,[:],1)
printHtmlPart(6)
createTagBody(1, {->
printHtmlPart(7)
createClosureForHtmlPart(8, 2)
invokeTag('link','g',33,['class':(""),'action':("edit"),'resource':(usuarioInstance)],2)
printHtmlPart(9)
if(true && (usuarioInstance?.username)) {
printHtmlPart(10)
invokeTag('fieldValue','g',54,['bean':(usuarioInstance),'field':("username")],-1)
printHtmlPart(11)
}
printHtmlPart(12)
if(true && (usuarioInstance?.nombre)) {
printHtmlPart(13)
invokeTag('fieldValue','g',60,['bean':(usuarioInstance),'field':("nombre")],-1)
printHtmlPart(11)
}
printHtmlPart(12)
if(true && (usuarioInstance?.apellidoPat)) {
printHtmlPart(14)
invokeTag('fieldValue','g',66,['bean':(usuarioInstance),'field':("apellidoPat")],-1)
printHtmlPart(11)
}
printHtmlPart(12)
if(true && (usuarioInstance?.apellidoMat)) {
printHtmlPart(15)
invokeTag('fieldValue','g',72,['bean':(usuarioInstance),'field':("apellidoMat")],-1)
printHtmlPart(16)
}
printHtmlPart(12)
if(true && (usuarioInstance?.areaDpto)) {
printHtmlPart(17)
invokeTag('fieldValue','g',78,['bean':(usuarioInstance),'field':("areaDpto")],-1)
printHtmlPart(16)
}
printHtmlPart(12)
if(true && (usuarioInstance?.empresa)) {
printHtmlPart(18)
expressionOut.print(usuarioInstance?.empresa?.encodeAsHTML())
printHtmlPart(11)
}
printHtmlPart(19)
if(true && (usuarioInstance?.email)) {
printHtmlPart(20)
invokeTag('fieldValue','g',90,['bean':(usuarioInstance),'field':("email")],-1)
printHtmlPart(11)
}
printHtmlPart(12)
if(true && (usuarioInstance?.twitterName)) {
printHtmlPart(21)
invokeTag('fieldValue','g',96,['bean':(usuarioInstance),'field':("twitterName")],-1)
printHtmlPart(11)
}
printHtmlPart(22)
invokeTag('formatBoolean','g',101,['boolean':(usuarioInstance?.enabled),'true':("Sí"),'false':("No")],-1)
printHtmlPart(23)
invokeTag('formatBoolean','g',107,['boolean':(usuarioInstance?.accountLocked),'true':("Sí"),'false':("No")],-1)
printHtmlPart(24)
})
invokeTag('captureBody','sitemesh',118,[:],1)
printHtmlPart(25)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1525892679000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
