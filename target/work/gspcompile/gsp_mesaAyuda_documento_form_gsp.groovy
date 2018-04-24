import pruebaSeguridad.Documento
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_mesaAyuda_documento_form_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/documento/_form.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
expressionOut.print(hasErrors(bean: comentarioInstance, field: 'incidente', 'error'))
printHtmlPart(1)
invokeTag('message','g',7,['code':("comentario.incidente.label"),'default':("Id Incidente")],-1)
printHtmlPart(2)
invokeTag('textField','g',10,['name':("incidente"),'value':(documentoInstance?.incidente?.id),'readonly':("true")],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: documentoInstance, field: 'tipoDoc', 'error'))
printHtmlPart(4)
invokeTag('message','g',16,['code':("documento.tipoDoc.label"),'default':("Tipo Doc")],-1)
printHtmlPart(2)
invokeTag('select','g',19,['id':("tipoDoc"),'name':("tipoDoc.id"),'from':(pruebaSeguridad.TipoDoc.list()),'optionKey':("id"),'value':(documentoInstance?.tipoDoc?.id),'class':("many-to-one"),'noSelection':(['null': ''])],-1)
printHtmlPart(5)
expressionOut.print(hasErrors(bean: documentoInstance, field: 'nombre', 'error'))
printHtmlPart(6)
invokeTag('message','g',25,['code':("documento.nombre.label"),'default':("Nombre")],-1)
printHtmlPart(7)
invokeTag('textField','g',28,['name':("nombre"),'required':(""),'value':(documentoInstance?.nombre)],-1)
printHtmlPart(5)
expressionOut.print(hasErrors(bean: documentoInstance, field: 'size', 'error'))
printHtmlPart(8)
invokeTag('message','g',34,['code':("documento.size.label"),'default':("Size")],-1)
printHtmlPart(7)
invokeTag('textField','g',37,['name':("size"),'required':(""),'value':(documentoInstance?.size)],-1)
printHtmlPart(5)
expressionOut.print(hasErrors(bean: documentoInstance, field: 'fechaSubio', 'error'))
printHtmlPart(9)
invokeTag('message','g',43,['code':("documento.fechaSubio.label"),'default':("Fecha Subio")],-1)
printHtmlPart(2)
invokeTag('datePicker','g',46,['name':("fechaSubio"),'precision':("day"),'value':(documentoInstance?.fechaSubio),'default':("none"),'noSelection':(['': ''])],-1)
printHtmlPart(10)
expressionOut.print(hasErrors(bean: documentoInstance, field: 'urlArchivo', 'error'))
printHtmlPart(11)
invokeTag('message','g',52,['code':("documento.urlArchivo.label"),'default':("Url Archivo")],-1)
printHtmlPart(7)
invokeTag('field','g',55,['type':("url"),'name':("urlArchivo"),'required':(""),'value':(documentoInstance?.urlArchivo)],-1)
printHtmlPart(12)
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
