import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_mesayudaindex_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/index.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
createTagBody(1, {->
printHtmlPart(1)
invokeTag('captureMeta','sitemesh',4,['gsp_sm_xmlClosingForEmptyTag':("/"),'name':("layout"),'content':("main")],-1)
printHtmlPart(1)
createTagBody(2, {->
createClosureForHtmlPart(2, 3)
invokeTag('captureTitle','sitemesh',5,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',5,[:],2)
printHtmlPart(3)
})
invokeTag('captureHead','sitemesh',82,[:],1)
printHtmlPart(4)
createTagBody(1, {->
printHtmlPart(4)
createTagBody(2, {->
printHtmlPart(1)
createClosureForHtmlPart(5, 3)
invokeTag('link','g',85,['controller':("login"),'action':("auth")],3)
printHtmlPart(1)
})
invokeTag('ifNotLoggedIn','sec',86,[:],2)
printHtmlPart(6)
invokeTag('message','g',87,['code':("default.link.skip.label"),'default':("Skip to content&hellip;")],-1)
printHtmlPart(7)
invokeTag('meta','g',91,['name':("app.version")],-1)
printHtmlPart(8)
invokeTag('meta','g',92,['name':("app.grails.version")],-1)
printHtmlPart(9)
expressionOut.print(GroovySystem.getVersion())
printHtmlPart(10)
expressionOut.print(System.getProperty('java.version'))
printHtmlPart(11)
expressionOut.print(grails.util.Environment.reloadingAgentEnabled)
printHtmlPart(12)
expressionOut.print(grailsApplication.controllerClasses.size())
printHtmlPart(13)
expressionOut.print(grailsApplication.domainClasses.size())
printHtmlPart(14)
expressionOut.print(grailsApplication.serviceClasses.size())
printHtmlPart(15)
expressionOut.print(grailsApplication.tagLibClasses.size())
printHtmlPart(16)
for( plugin in (applicationContext.getBean('pluginManager').allPlugins) ) {
printHtmlPart(17)
expressionOut.print(plugin.name)
printHtmlPart(18)
expressionOut.print(plugin.version)
printHtmlPart(19)
}
printHtmlPart(20)
for( c in (grailsApplication.controllerClasses.sort { it.fullName }) ) {
printHtmlPart(21)
createTagBody(3, {->
expressionOut.print(c.fullName)
})
invokeTag('link','g',119,['controller':(c.logicalPropertyName)],3)
printHtmlPart(22)
}
printHtmlPart(23)
})
invokeTag('captureBody','sitemesh',124,[:],1)
printHtmlPart(24)
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
