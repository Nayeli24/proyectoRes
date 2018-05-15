import pruebaSeguridad.Comentario
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_mesayuda_comentarioshow_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/comentario/show.gsp" }
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
invokeTag('set','g',7,['var':("entityName"),'value':(message(code: 'comentario.label', default: 'Comentario'))],-1)
printHtmlPart(2)
createTagBody(2, {->
createTagBody(3, {->
invokeTag('message','g',8,['code':("default.show.label"),'args':([entityName])],-1)
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
expressionOut.print(createLink(uri: '/incidente/index'))
printHtmlPart(6)
invokeTag('message','g',14,['code':("Pagina principal")],-1)
printHtmlPart(7)
createTagBody(2, {->
printHtmlPart(8)
expressionOut.print(createLink(uri: '/incidente/listarRevision'))
printHtmlPart(6)
invokeTag('message','g',16,['code':("Incidentes en revisión")],-1)
printHtmlPart(7)
})
invokeTag('access','sec',17,['expression':("hasRole('ROLE_DESARROLLADOR')")],2)
printHtmlPart(9)
createTagBody(2, {->
invokeTag('message','g',18,['code':("Comentarios"),'args':([entityName])],-1)
})
invokeTag('link','g',18,['action':("index"),'id':(comentarioInstance.incidente.id)],2)
printHtmlPart(10)
createTagBody(2, {->
invokeTag('message','g',19,['code':("default.new.label"),'args':([entityName])],-1)
})
invokeTag('link','g',19,['class':("create"),'action':("create"),'id':(comentarioInstance.incidente.id)],2)
printHtmlPart(11)
invokeTag('message','g',23,['code':("Detalle Comentario"),'args':([entityName])],-1)
printHtmlPart(12)
if(true && (flash.message)) {
printHtmlPart(13)
expressionOut.print(flash.message)
printHtmlPart(14)
}
printHtmlPart(15)
if(true && (comentarioInstance?.incidente)) {
printHtmlPart(16)
invokeTag('message','g',31,['code':("comentario.incidente.label"),'default':("Tema Incidente")],-1)
printHtmlPart(17)
createTagBody(3, {->
expressionOut.print(comentarioInstance?.incidente?.tema)
})
invokeTag('link','g',33,['controller':("incidente"),'action':("show"),'id':(comentarioInstance?.incidente?.id)],3)
printHtmlPart(18)
}
printHtmlPart(19)
if(true && (comentarioInstance?.descripcion)) {
printHtmlPart(20)
invokeTag('message','g',40,['code':("comentario.descripcion.label"),'default':("Descripcion")],-1)
printHtmlPart(21)
invokeTag('fieldValue','g',42,['bean':(comentarioInstance),'field':("descripcion")],-1)
printHtmlPart(18)
}
printHtmlPart(19)
if(true && (comentarioInstance?.usuario)) {
printHtmlPart(22)
invokeTag('message','g',49,['code':("comentario.usuario.label"),'default':("Usuario")],-1)
printHtmlPart(23)
expressionOut.print(comentarioInstance?.usuario?.username)
printHtmlPart(18)
}
printHtmlPart(24)
createTagBody(2, {->
printHtmlPart(25)
createTagBody(3, {->
invokeTag('message','g',59,['code':("default.button.edit.label"),'default':("Edit")],-1)
})
invokeTag('link','g',59,['class':("edit"),'action':("edit"),'resource':(comentarioInstance)],3)
printHtmlPart(26)
invokeTag('actionSubmit','g',60,['class':("delete"),'action':("delete"),'value':(message(code: 'default.button.delete.label', default: 'Delete')),'onclick':("return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');")],-1)
printHtmlPart(27)
})
invokeTag('form','g',62,['url':([resource:comentarioInstance, action:'delete']),'method':("DELETE")],2)
printHtmlPart(28)
})
invokeTag('captureBody','sitemesh',64,[:],1)
printHtmlPart(29)
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
