import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_mesayuda_incidenteatender_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/incidente/atender.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
createTagBody(1, {->
printHtmlPart(1)
createTagBody(2, {->
createClosureForHtmlPart(2, 3)
invokeTag('captureTitle','sitemesh',4,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',4,[:],2)
printHtmlPart(3)
expressionOut.print(resource (dir: 'js', file: 'incidente.js'))
printHtmlPart(4)
})
invokeTag('captureHead','sitemesh',7,[:],1)
printHtmlPart(5)
createTagBody(1, {->
printHtmlPart(6)
createTagBody(2, {->
printHtmlPart(7)
expressionOut.print(incidenteInstance?.solucion)
printHtmlPart(8)
expressionOut.print(id)
printHtmlPart(9)
expressionOut.print(id)
printHtmlPart(10)
createClosureForHtmlPart(11, 3)
invokeTag('remoteLink','g',26,['controller':("incidente"),'action':("cargaArchivos"),'id':(id),'update':([success:'message2',failure:'error'])],3)
printHtmlPart(12)
})
invokeTag('form','g',28,['name':("f1"),'id':("f1"),'url':([action:'guardarSolucion',controller:'incidente'])],2)
printHtmlPart(13)
invokeTag('javascript','asset',37,['src':("script.js")],-1)
printHtmlPart(14)
})
invokeTag('captureBody','sitemesh',44,[:],1)
printHtmlPart(15)
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
