import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_mesaAyuda_comentariocreate_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/comentario/create.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
createTagBody(1, {->
printHtmlPart(1)
invokeTag('captureMeta','sitemesh',4,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("layout"),'content':("main")],-1)
printHtmlPart(1)
invokeTag('set','g',5,['var':("entityName"),'value':(message(code: 'comentario.label', default: 'Comentario'))],-1)
printHtmlPart(1)
createTagBody(2, {->
createTagBody(3, {->
invokeTag('message','g',6,['code':("default.create.label"),'args':([entityName])],-1)
})
invokeTag('captureTitle','sitemesh',6,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',6,[:],2)
printHtmlPart(2)
})
invokeTag('captureHead','sitemesh',7,[:],1)
printHtmlPart(2)
createTagBody(1, {->
printHtmlPart(3)
invokeTag('message','g',9,['code':("default.link.skip.label"),'default':("Skip to content&hellip;")],-1)
printHtmlPart(4)
createTagBody(2, {->
invokeTag('message','g',12,['code':("Regresar"),'args':([entityName])],-1)
})
invokeTag('link','g',12,['class':("show"),'controller':("incidente"),'action':("show"),'id':(comentarioInstance.incidente.id)],2)
printHtmlPart(5)
createTagBody(2, {->
printHtmlPart(6)
expressionOut.print(createLink(uri: '/incidente/listarRevision'))
printHtmlPart(7)
invokeTag('message','g',14,['code':("Incidentes en revisión")],-1)
printHtmlPart(8)
})
invokeTag('ifAnyGranted','sec',15,['roles':("ROLE_DESARROLLADOR")],2)
printHtmlPart(9)
invokeTag('message','g',19,['code':("default.create.label"),'args':([entityName])],-1)
printHtmlPart(10)
if(true && (flash.message)) {
printHtmlPart(11)
expressionOut.print(flash.message)
printHtmlPart(12)
}
printHtmlPart(13)
createTagBody(2, {->
printHtmlPart(14)
createTagBody(3, {->
printHtmlPart(15)
if(true && (error in org.springframework.validation.FieldError)) {
printHtmlPart(16)
expressionOut.print(error.field)
printHtmlPart(17)
}
printHtmlPart(18)
invokeTag('message','g',26,['error':(error)],-1)
printHtmlPart(19)
})
invokeTag('eachError','g',27,['bean':(comentarioInstance),'var':("error")],3)
printHtmlPart(20)
})
invokeTag('hasErrors','g',29,['bean':(comentarioInstance)],2)
printHtmlPart(13)
createTagBody(2, {->
printHtmlPart(21)
invokeTag('render','g',32,['template':("form")],-1)
printHtmlPart(22)
invokeTag('submitButton','g',35,['name':("create"),'class':("save"),'value':(message(code: 'default.button.enviar.label', default: 'Enviar'))],-1)
printHtmlPart(23)
})
invokeTag('form','g',37,['url':([resource:comentarioInstance, action:'save'])],2)
printHtmlPart(24)
})
invokeTag('captureBody','sitemesh',39,[:],1)
printHtmlPart(25)
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
