import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

@GrailsPlugin(name='spring-security-core', version='2.0.0')
class gsp_springSecurityCore_loginauth_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/plugins/spring-security-core-2.0.0/grails-app/views/login/auth.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
createTagBody(1, {->
printHtmlPart(1)
createTagBody(2, {->
createClosureForHtmlPart(2, 3)
invokeTag('captureTitle','sitemesh',10,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',10,[:],2)
printHtmlPart(3)
invokeTag('captureMeta','sitemesh',12,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("viewport"),'content':("width=device-width, initial-scale=1")],-1)
printHtmlPart(1)
invokeTag('captureMeta','sitemesh',13,['gsp_sm_xmlClosingForEmptyTag':("/"),'http-equiv':("Content-Type"),'content':("text/html; charset=utf-8")],-1)
printHtmlPart(1)
invokeTag('captureMeta','sitemesh',14,['gsp_sm_xmlClosingForEmptyTag':("/"),'name':("keywords"),'content':("Magnificent login form a Flat Responsive Widget,Login form widgets, Sign up Web 	forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements")],-1)
printHtmlPart(4)
})
invokeTag('captureHead','sitemesh',22,[:],1)
printHtmlPart(5)
createTagBody(1, {->
printHtmlPart(6)
if(true && (flash.message)) {
printHtmlPart(7)
expressionOut.print(flash.message)
printHtmlPart(8)
}
printHtmlPart(9)
expressionOut.print(postUrl)
printHtmlPart(10)
expressionOut.print(rememberMeParameter)
printHtmlPart(11)
if(true && (hasCookie)) {
printHtmlPart(12)
}
printHtmlPart(13)
invokeTag('message','g',54,['code':("springSecurity.login.remember.me.label")],-1)
printHtmlPart(14)
expressionOut.print(message(code: "springSecurity.login.button"))
printHtmlPart(15)
})
invokeTag('captureBody','sitemesh',71,[:],1)
printHtmlPart(16)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1524591607000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
