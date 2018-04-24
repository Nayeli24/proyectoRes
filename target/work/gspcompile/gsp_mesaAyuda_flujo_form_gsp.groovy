import pruebaSeguridad.Flujo
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_mesaAyuda_flujo_form_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/flujo/_form.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
expressionOut.print(hasErrors(bean: flujoInstance, field: 'estatus', 'error'))
printHtmlPart(1)
invokeTag('message','g',7,['code':("flujo.estatus.label"),'default':("Estatus")],-1)
printHtmlPart(2)
invokeTag('select','g',10,['id':("estatus"),'name':("estatus.id"),'from':(pruebaSeguridad.Estatus.list()),'optionKey':("id"),'required':(""),'value':(flujoInstance?.estatus?.id),'class':("many-to-one")],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: flujoInstance, field: 'fechaMovimiento', 'error'))
printHtmlPart(4)
invokeTag('message','g',16,['code':("flujo.fechaMovimiento.label"),'default':("Fecha Movimiento")],-1)
printHtmlPart(2)
invokeTag('datePicker','g',19,['name':("fechaMovimiento"),'precision':("day"),'value':(flujoInstance?.fechaMovimiento)],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: flujoInstance, field: 'incidente', 'error'))
printHtmlPart(5)
invokeTag('message','g',25,['code':("flujo.incidente.label"),'default':("Incidente")],-1)
printHtmlPart(2)
invokeTag('select','g',28,['id':("incidente"),'name':("incidente.id"),'from':(pruebaSeguridad.Incidente.list()),'optionKey':("id"),'required':(""),'value':(flujoInstance?.incidente?.id),'class':("many-to-one")],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: flujoInstance, field: 'usuarioMovimiento', 'error'))
printHtmlPart(6)
invokeTag('message','g',34,['code':("flujo.usuarioMovimiento.label"),'default':("Usuario Movimiento")],-1)
printHtmlPart(2)
invokeTag('select','g',37,['id':("usuarioMovimiento"),'name':("usuarioMovimiento.id"),'from':(pruebaSeguridad.Usuario.list()),'optionKey':("id"),'required':(""),'value':(flujoInstance?.usuarioMovimiento?.id),'class':("many-to-one")],-1)
printHtmlPart(7)
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
