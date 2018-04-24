import pruebaSeguridad.Incidente
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_mesaAyuda_incidente_formAtencion_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/incidente/_formAtencion.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
printHtmlPart(1)
printHtmlPart(2)
invokeTag('message','g',11,['code':("incidente.solucion.label"),'default':("Solución")],-1)
printHtmlPart(3)
invokeTag('textArea','g',13,['name':("solucion"),'required':(""),'value':(incidenteInstance?.solucion),'rows':("20"),'cols':("40")],-1)
printHtmlPart(4)
invokeTag('message','g',17,['code':("incidente.seleccionararchivo.label"),'default':("Seleccionar Archivo")],-1)
printHtmlPart(5)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1521713647000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
