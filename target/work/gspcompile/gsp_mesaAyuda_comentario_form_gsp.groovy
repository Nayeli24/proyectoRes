import pruebaSeguridad.Comentario
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_mesaAyuda_comentario_form_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/comentario/_form.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
expressionOut.print(hasErrors(bean: comentarioInstance, field: 'incidente', 'error'))
printHtmlPart(1)
invokeTag('message','g',7,['code':("comentario.incidente.label"),'default':("Id Incidente")],-1)
printHtmlPart(2)
invokeTag('textField','g',10,['name':("incidente"),'value':(comentarioInstance?.incidente?.id),'readonly':("true")],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: comentarioInstance, field: 'descripcion', 'error'))
printHtmlPart(4)
invokeTag('message','g',16,['code':("comentario.comentario.label"),'default':("Comentario")],-1)
printHtmlPart(5)
invokeTag('textArea','g',19,['cols':("30"),'rows':("4"),'name':("descripcion"),'required':("Escribe un comentario"),'value':(comentarioInstance?.descripcion),'style':("width:400px; height: 200px;")],-1)
printHtmlPart(6)
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
