import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_mesaAyuda_layouts_navbar_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/layouts/_navbar.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
printHtmlPart(1)
createTagBody(1, {->
printHtmlPart(2)
createClosureForHtmlPart(3, 2)
invokeTag('link','g',19,['class':(""),'controller':("incidente"),'action':("index")],2)
printHtmlPart(4)
createTagBody(2, {->
printHtmlPart(5)
createClosureForHtmlPart(6, 3)
invokeTag('link','g',29,['class':(""),'controller':("usuario"),'action':("index")],3)
printHtmlPart(7)
createClosureForHtmlPart(8, 3)
invokeTag('link','g',30,['class':(""),'controller':("usuario"),'action':("create")],3)
printHtmlPart(9)
createClosureForHtmlPart(10, 3)
invokeTag('link','g',31,['class':(""),'controller':("usuario"),'action':("update")],3)
printHtmlPart(11)
createClosureForHtmlPart(12, 3)
invokeTag('link','g',40,['class':(""),'controller':("empresa"),'action':("index")],3)
printHtmlPart(7)
createClosureForHtmlPart(13, 3)
invokeTag('link','g',41,['class':(""),'controller':("empresa"),'action':("create")],3)
printHtmlPart(14)
createClosureForHtmlPart(15, 3)
invokeTag('link','g',49,['class':(""),'controller':("incidente"),'action':("asignar")],3)
printHtmlPart(16)
})
invokeTag('ifAnyGranted','sec',51,['roles':("ROLE_ADMIN")],2)
printHtmlPart(17)
createTagBody(2, {->
printHtmlPart(18)
createClosureForHtmlPart(19, 3)
invokeTag('link','g',58,['class':(""),'action':("create")],3)
printHtmlPart(16)
})
invokeTag('ifAnyGranted','sec',60,['roles':("ROLE_CLIENTE")],2)
printHtmlPart(20)
})
invokeTag('ifLoggedIn','sec',65,[:],1)
printHtmlPart(21)
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
