import pruebaSeguridad.Comentario
import pruebaSeguridad.Incidente
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_mesaAyuda_comentarioindex_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/comentario/index.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
printHtmlPart(0)
printHtmlPart(1)
createTagBody(1, {->
printHtmlPart(2)
invokeTag('captureMeta','sitemesh',7,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("layout"),'content':("main")],-1)
printHtmlPart(2)
invokeTag('set','g',8,['var':("entityName"),'value':(message(code: 'comentario.label', default: 'Comentario'))],-1)
printHtmlPart(2)
createTagBody(2, {->
createTagBody(3, {->
invokeTag('message','g',9,['code':("default.list.label"),'args':([entityName])],-1)
})
invokeTag('captureTitle','sitemesh',9,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',9,[:],2)
printHtmlPart(3)
})
invokeTag('captureHead','sitemesh',10,[:],1)
printHtmlPart(3)
createTagBody(1, {->
printHtmlPart(4)
invokeTag('message','g',12,['code':("default.link.skip.label"),'default':("Skip to content&hellip;")],-1)
printHtmlPart(5)
createClosureForHtmlPart(6, 2)
invokeTag('link','g',15,['controller':("incidente"),'action':("show"),'id':(id)],2)
printHtmlPart(7)
invokeTag('message','g',19,['code':("default.list.label"),'args':([entityName])],-1)
printHtmlPart(8)
if(true && (flash.message)) {
printHtmlPart(9)
expressionOut.print(flash.message)
printHtmlPart(10)
}
printHtmlPart(11)
invokeTag('message','g',26,['code':("comentario.usuario.label"),'default':("Usuario")],-1)
printHtmlPart(12)
invokeTag('sortableColumn','g',27,['property':("descripcion"),'title':(message(code: 'comentario.comentario.label', default: 'Comentario'))],-1)
printHtmlPart(13)
if(true && (comentariosVer)) {
printHtmlPart(14)
for( _it831160736 in (comentariosVer) ) {
changeItVariable(_it831160736)
printHtmlPart(15)
expressionOut.print(it?.usuario?.username)
printHtmlPart(16)
createTagBody(4, {->
expressionOut.print(it.descripcion)
})
invokeTag('link','g',35,['action':("show"),'id':(it.id)],4)
printHtmlPart(17)
}
printHtmlPart(18)
}
printHtmlPart(19)
invokeTag('paginate','g',42,['total':(comentarioInstanceCount ?: 0)],-1)
printHtmlPart(20)
})
invokeTag('captureBody','sitemesh',45,[:],1)
printHtmlPart(21)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1522984370000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
