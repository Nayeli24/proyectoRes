import pruebaSeguridad.Incidente
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_mesaAyuda_incidenteedit_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/incidente/edit.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
printHtmlPart(1)
createTagBody(1, {->
printHtmlPart(2)
invokeTag('captureMeta','sitemesh',6,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("layout"),'content':("main")],-1)
printHtmlPart(2)
invokeTag('set','g',7,['var':("entityName"),'value':(message(code: 'incidente.label', default: 'Incidente'))],-1)
printHtmlPart(2)
createTagBody(2, {->
createTagBody(3, {->
invokeTag('message','g',8,['code':("default.edit.label"),'args':([entityName])],-1)
})
invokeTag('captureTitle','sitemesh',8,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',8,[:],2)
printHtmlPart(3)
})
invokeTag('captureHead','sitemesh',9,[:],1)
printHtmlPart(3)
createTagBody(1, {->
printHtmlPart(4)
invokeTag('message','g',11,['code':("default.link.skip.label"),'default':("Skip to content&hellip;")],-1)
printHtmlPart(5)
createTagBody(2, {->
invokeTag('message','g',14,['code':("Regresar"),'args':("")],-1)
})
invokeTag('link','g',14,['action':("show"),'id':(incidenteInstance.id)],2)
printHtmlPart(6)
createTagBody(2, {->
printHtmlPart(7)
createTagBody(3, {->
invokeTag('message','g',16,['code':("Documentos"),'args':("")],-1)
})
invokeTag('link','g',16,['controller':("documento"),'action':("importarArchivos"),'id':(incidenteInstance.id)],3)
printHtmlPart(8)
})
invokeTag('ifAnyGranted','sec',17,['roles':("ROLE_DESARROLLADOR")],2)
printHtmlPart(9)
invokeTag('message','g',21,['code':("Atender Incidente"),'args':([entityName])],-1)
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
invokeTag('message','g',28,['error':(error)],-1)
printHtmlPart(19)
})
invokeTag('eachError','g',29,['bean':(incidenteInstance),'var':("error")],3)
printHtmlPart(20)
})
invokeTag('hasErrors','g',31,['bean':(incidenteInstance)],2)
printHtmlPart(13)
createTagBody(2, {->
printHtmlPart(21)
invokeTag('render','g',34,['template':("form")],-1)
printHtmlPart(22)
invokeTag('actionSubmit','g',37,['class':("save"),'action':("update"),'value':(message(code: 'default.button.update.label', default: 'Update'))],-1)
printHtmlPart(23)
})
invokeTag('form','g',39,['url':([resource:incidenteInstance, action:'update']),'method':("PUT")],2)
printHtmlPart(24)
})
invokeTag('captureBody','sitemesh',41,[:],1)
printHtmlPart(25)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1522835494000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
