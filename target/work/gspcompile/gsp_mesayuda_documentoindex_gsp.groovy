import pruebaSeguridad.Documento
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_mesayuda_documentoindex_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/documento/index.gsp" }
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
invokeTag('set','g',7,['var':("entityName"),'value':(message(code: 'documento.label', default: 'Documento'))],-1)
printHtmlPart(2)
createTagBody(2, {->
createTagBody(3, {->
invokeTag('message','g',8,['code':("default.list.label"),'args':([entityName])],-1)
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
expressionOut.print(createLink(uri: '/'))
printHtmlPart(6)
invokeTag('message','g',14,['code':("default.home.label")],-1)
printHtmlPart(7)
createTagBody(2, {->
invokeTag('message','g',15,['code':("default.new.label"),'args':([entityName])],-1)
})
invokeTag('link','g',15,['class':("create"),'action':("create")],2)
printHtmlPart(8)
invokeTag('message','g',19,['code':("default.list.label"),'args':([entityName])],-1)
printHtmlPart(9)
if(true && (flash.message)) {
printHtmlPart(10)
expressionOut.print(flash.message)
printHtmlPart(11)
}
printHtmlPart(12)
invokeTag('message','g',27,['code':("documento.incidente.label"),'default':("Incidente")],-1)
printHtmlPart(13)
invokeTag('sortableColumn','g',28,['property':("nombre"),'title':(message(code: 'documento.nombre.label', default: 'Nombre'))],-1)
printHtmlPart(14)
invokeTag('sortableColumn','g',30,['property':("fechaSubio"),'title':(message(code: 'documento.fechaSubio.label', default: 'Fecha Subio'))],-1)
printHtmlPart(14)
invokeTag('sortableColumn','g',32,['property':("urlArchivo"),'title':(message(code: 'documento.urlArchivo.label', default: 'Url Archivo'))],-1)
printHtmlPart(15)
loop:{
int i = 0
for( documentoInstance in (documentoInstanceList) ) {
printHtmlPart(16)
expressionOut.print((i % 2) == 0 ? 'even' : 'odd')
printHtmlPart(17)
createTagBody(3, {->
expressionOut.print(fieldValue(bean: documentoInstance, field: "incidente"))
})
invokeTag('link','g',40,['action':("show"),'id':(documentoInstance.id)],3)
printHtmlPart(18)
expressionOut.print(fieldValue(bean: documentoInstance, field: "nombre"))
printHtmlPart(18)
invokeTag('formatDate','g',44,['date':(documentoInstance.fechaSubio)],-1)
printHtmlPart(18)
expressionOut.print(fieldValue(bean: documentoInstance, field: "urlArchivo"))
printHtmlPart(19)
i++
}
}
printHtmlPart(20)
invokeTag('paginate','g',53,['total':(documentoInstanceCount ?: 0)],-1)
printHtmlPart(21)
})
invokeTag('captureBody','sitemesh',56,[:],1)
printHtmlPart(22)
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
