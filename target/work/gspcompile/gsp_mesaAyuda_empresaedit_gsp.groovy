import pruebaSeguridad.Empresa
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_mesaAyuda_empresaedit_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/empresa/edit.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
createTagBody(1, {->
printHtmlPart(1)
createTagBody(2, {->
createClosureForHtmlPart(2, 3)
invokeTag('captureTitle','sitemesh',7,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',7,[:],2)
printHtmlPart(3)
invokeTag('external','g',10,['dir':("js/dropzone"),'file':("dropzone.min.js")],-1)
printHtmlPart(4)
})
invokeTag('captureHead','sitemesh',13,[:],1)
printHtmlPart(5)
createTagBody(1, {->
printHtmlPart(6)
expressionOut.print(empresaInstance.id)
printHtmlPart(7)
createTagBody(2, {->
printHtmlPart(8)
expressionOut.print(empresaInstance.nombreEmpresa)
printHtmlPart(9)
invokeTag('checkBox','g',30,['name':("enabled"),'value':(empresaInstance?.enabled)],-1)
printHtmlPart(10)
invokeTag('actionSubmit','g',33,['class':("btn btn-success"),'action':("update"),'value':("Enviar")],-1)
printHtmlPart(11)
})
invokeTag('form','g',35,['url':([resource:empresaInstance, action:'update']),'method':("PUT")],2)
printHtmlPart(12)
})
invokeTag('captureBody','sitemesh',46,[:],1)
printHtmlPart(13)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1524244898000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
