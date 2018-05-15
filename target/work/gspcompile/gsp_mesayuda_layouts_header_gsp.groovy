import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_mesayuda_layouts_header_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/layouts/_header.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
printHtmlPart(1)
createTagBody(1, {->
printHtmlPart(2)
invokeTag('loggedInUserInfo','sec',41,['field':("username")],-1)
printHtmlPart(3)
createClosureForHtmlPart(4, 2)
invokeTag('link','g',45,['class':(""),'controller':("usuario"),'action':("usuarioLog")],2)
printHtmlPart(5)
createClosureForHtmlPart(6, 2)
invokeTag('link','g',48,['controller':("logout")],2)
printHtmlPart(7)
})
invokeTag('ifLoggedIn','sec',52,[:],1)
printHtmlPart(8)
createTagBody(1, {->
printHtmlPart(9)
invokeTag('loggedInUserInfo','sec',57,['field':("username")],-1)
printHtmlPart(10)
createClosureForHtmlPart(11, 2)
invokeTag('link','g',61,['controller':("login")],2)
printHtmlPart(12)
})
invokeTag('ifNotLoggedIn','sec',64,['roles':("ROLE_CLIENTE,ROLE_ADMIN,ROLE_DESARROLLADOR")],1)
printHtmlPart(13)
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
