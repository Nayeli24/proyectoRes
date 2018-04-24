import pruebaSeguridad.Usuario
import pruebaSeguridad.UsuarioRole
import pruebaSeguridad.Role
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_mesaAyuda_usuario_form_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/usuario/_form.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
printHtmlPart(0)
printHtmlPart(1)
expressionOut.print(usuarioInstance?.username)
printHtmlPart(2)
expressionOut.print(usuarioInstance?.password)
printHtmlPart(3)
expressionOut.print(usuarioInstance?.password)
printHtmlPart(4)
expressionOut.print(usuarioInstance?.nombre)
printHtmlPart(5)
expressionOut.print(usuarioInstance?.apellidoPat)
printHtmlPart(6)
expressionOut.print(usuarioInstance?.apellidoMat)
printHtmlPart(7)
expressionOut.print(usuarioInstance?.areaDpto)
printHtmlPart(8)
invokeTag('select','g',72,['id':("empresa"),'name':("empresa.id"),'from':(pruebaSeguridad.Empresa.list()),'optionKey':("id"),'value':(usuarioInstance?.empresa?.id),'class':("form-control"),'noSelection':(['null': 'Selecciona una empresa'])],-1)
printHtmlPart(9)
invokeTag('message','g',78,['code':("¡Importante proporcionar el correo electrónico correcto")],-1)
printHtmlPart(10)
expressionOut.print(usuarioInstance?.email)
printHtmlPart(11)
expressionOut.print(usuarioInstance?.accountExpired)
printHtmlPart(12)
expressionOut.print(usuarioInstance?.accountLocked)
printHtmlPart(13)
expressionOut.print(usuarioInstance?.enabled)
printHtmlPart(14)
expressionOut.print(usuarioInstance?.passwordExpired)
printHtmlPart(15)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1522318538000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
