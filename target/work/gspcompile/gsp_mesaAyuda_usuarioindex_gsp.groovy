import pruebaSeguridad.Usuario
import pruebaSeguridad.Incidente
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_mesaAyuda_usuarioindex_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/usuario/index.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
printHtmlPart(0)
printHtmlPart(1)
createTagBody(1, {->
printHtmlPart(2)
invokeTag('captureMeta','sitemesh',8,['gsp_sm_xmlClosingForEmptyTag':(""),'http-equiv':("content-type"),'content':("text/html; charset=UTF-8")],-1)
printHtmlPart(3)
invokeTag('captureMeta','sitemesh',9,['gsp_sm_xmlClosingForEmptyTag':(""),'charset':("utf-8")],-1)
printHtmlPart(3)
createTagBody(2, {->
createClosureForHtmlPart(4, 3)
invokeTag('captureTitle','sitemesh',10,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',10,[:],2)
printHtmlPart(3)
invokeTag('captureMeta','sitemesh',11,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("viewport"),'content':("width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no")],-1)
printHtmlPart(3)
invokeTag('captureMeta','sitemesh',12,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("description"),'content':("")],-1)
printHtmlPart(3)
invokeTag('captureMeta','sitemesh',13,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("author"),'content':("")],-1)
printHtmlPart(5)
invokeTag('captureMeta','sitemesh',31,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("layout"),'content':("main")],-1)
printHtmlPart(3)
invokeTag('set','g',32,['var':("entityName"),'value':(message(code: 'usuario.label', default: 'Usuario'))],-1)
printHtmlPart(3)
createTagBody(2, {->
createTagBody(3, {->
invokeTag('message','g',33,['code':("default.list.label"),'args':([entityName])],-1)
})
invokeTag('captureTitle','sitemesh',33,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',33,[:],2)
printHtmlPart(6)
})
invokeTag('captureHead','sitemesh',34,[:],1)
printHtmlPart(6)
createTagBody(1, {->
printHtmlPart(7)
invokeTag('render','g',36,['template':("/layouts/header")],-1)
printHtmlPart(8)
invokeTag('render','g',41,['template':("/layouts/navbar")],-1)
printHtmlPart(9)
invokeTag('message','g',42,['code':("default.link.skip.label"),'default':("Skip to content&hellip;")],-1)
printHtmlPart(10)
expressionOut.print(createLink(uri: '/incidente/index'))
printHtmlPart(11)
invokeTag('message','g',45,['code':("Regresar")],-1)
printHtmlPart(12)
createTagBody(2, {->
invokeTag('message','g',46,['code':("default.new.label"),'args':([entityName])],-1)
})
invokeTag('link','g',46,['class':("create"),'action':("create")],2)
printHtmlPart(13)
if(true && (flash.message)) {
printHtmlPart(14)
expressionOut.print(flash.message)
printHtmlPart(15)
}
printHtmlPart(16)
invokeTag('sortableColumn','g',58,['property':("username"),'title':(message(code: 'usuario.username.label', default: 'Username'))],-1)
printHtmlPart(17)
invokeTag('sortableColumn','g',60,['property':("password"),'title':(message(code: 'usuario.password.label', default: 'Password'))],-1)
printHtmlPart(17)
invokeTag('sortableColumn','g',62,['property':("nombre"),'title':(message(code: 'usuario.nombre.label', default: 'Nombre'))],-1)
printHtmlPart(17)
invokeTag('sortableColumn','g',64,['property':("apellidoPat"),'title':(message(code: 'usuario.apellidoPat.label', default: 'Apellido Pat'))],-1)
printHtmlPart(17)
invokeTag('sortableColumn','g',66,['property':("apellidoMat"),'title':(message(code: 'usuario.apellidoMat.label', default: 'Apellido Mat'))],-1)
printHtmlPart(17)
invokeTag('sortableColumn','g',68,['property':("areaDpto"),'title':(message(code: 'usuario.areaDpto.label', default: 'Area Dpto'))],-1)
printHtmlPart(18)
loop:{
int i = 0
for( usuarioInstance in (usuarioInstanceList) ) {
printHtmlPart(19)
expressionOut.print((i % 2) == 0 ? 'even' : 'odd')
printHtmlPart(20)
createTagBody(3, {->
expressionOut.print(fieldValue(bean: usuarioInstance, field: "username"))
})
invokeTag('link','g',76,['action':("show"),'id':(usuarioInstance.id)],3)
printHtmlPart(21)
expressionOut.print(fieldValue(bean: usuarioInstance, field: "password"))
printHtmlPart(21)
expressionOut.print(fieldValue(bean: usuarioInstance, field: "nombre"))
printHtmlPart(21)
expressionOut.print(fieldValue(bean: usuarioInstance, field: "apellidoPat"))
printHtmlPart(21)
expressionOut.print(fieldValue(bean: usuarioInstance, field: "apellidoMat"))
printHtmlPart(21)
expressionOut.print(fieldValue(bean: usuarioInstance, field: "areaDpto"))
printHtmlPart(22)
i++
}
}
printHtmlPart(23)
invokeTag('paginate','g',93,['total':(usuarioInstanceCount ?: 0)],-1)
printHtmlPart(24)
})
invokeTag('captureBody','sitemesh',96,[:],1)
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
