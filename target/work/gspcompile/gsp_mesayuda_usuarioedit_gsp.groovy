import pruebaSeguridad.Usuario
import pruebaSeguridad.Incidente
import pruebaSeguridad.UsuarioRole
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_mesayuda_usuarioedit_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/usuario/edit.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
printHtmlPart(0)
printHtmlPart(1)
createTagBody(1, {->
printHtmlPart(2)
invokeTag('captureMeta','sitemesh',11,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("layout"),'content':("main")],-1)
printHtmlPart(3)
invokeTag('set','g',12,['var':("entityName"),'value':(message(code: 'usuario.label', default: 'Usuario'))],-1)
printHtmlPart(3)
createTagBody(2, {->
createTagBody(3, {->
invokeTag('message','g',13,['code':("default.edit.label"),'args':([entityName])],-1)
})
invokeTag('captureTitle','sitemesh',13,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',13,[:],2)
printHtmlPart(4)
expressionOut.print(resource (dir: 'js', file: 'usuario.js'))
printHtmlPart(5)
})
invokeTag('captureHead','sitemesh',15,[:],1)
printHtmlPart(6)
createTagBody(1, {->
printHtmlPart(7)
createClosureForHtmlPart(8, 2)
invokeTag('link','g',31,['class':(""),'action':("edit"),'resource':(usuarioInstance)],2)
printHtmlPart(9)
expressionOut.print(usuarioInstance.nombre)
printHtmlPart(10)
expressionOut.print(usuarioInstance.apellidoPat)
printHtmlPart(10)
expressionOut.print(usuarioInstance.apellidoMat)
printHtmlPart(11)
if(true && (flash.message)) {
printHtmlPart(12)
expressionOut.print(flash.message)
printHtmlPart(13)
}
printHtmlPart(14)
createTagBody(2, {->
printHtmlPart(15)
createTagBody(3, {->
printHtmlPart(16)
if(true && (error in org.springframework.validation.FieldError)) {
printHtmlPart(17)
expressionOut.print(error.field)
printHtmlPart(18)
}
printHtmlPart(19)
invokeTag('message','g',53,['error':(error)],-1)
printHtmlPart(20)
})
invokeTag('eachError','g',54,['bean':(usuarioInstance),'var':("error")],3)
printHtmlPart(21)
})
invokeTag('hasErrors','g',56,['bean':(usuarioInstance)],2)
printHtmlPart(14)
createTagBody(2, {->
printHtmlPart(22)
if(true && (usuarioInstance?.username)) {
printHtmlPart(23)
expressionOut.print(usuarioInstance?.username)
printHtmlPart(24)
}
printHtmlPart(25)
if(true && (usuarioInstance?.empresa)) {
printHtmlPart(26)
expressionOut.print(usuarioInstance?.empresa?.encodeAsHTML())
printHtmlPart(27)
}
printHtmlPart(28)
expressionOut.print(usuarioInstance?.password)
printHtmlPart(29)
expressionOut.print(usuarioInstance?.password)
printHtmlPart(30)
expressionOut.print(usuarioInstance?.areaDpto)
printHtmlPart(31)
expressionOut.print(usuarioInstance?.areaDpto)
printHtmlPart(32)
expressionOut.print(usuarioInstance.email)
printHtmlPart(33)
if(true && (usuarioInstance?.twitterName)) {
printHtmlPart(34)
expressionOut.print(usuarioInstance.twitterName)
printHtmlPart(35)
}
printHtmlPart(36)
invokeTag('message','g',145,['code':("usuario.accountLocked.label"),'default':("Account Locked")],-1)
printHtmlPart(37)
invokeTag('checkBox','g',148,['name':("accountLocked"),'value':(usuarioInstance?.accountLocked)],-1)
printHtmlPart(38)
invokeTag('message','g',150,['code':("usuario.enabled.label"),'default':("Enabled")],-1)
printHtmlPart(37)
invokeTag('checkBox','g',153,['name':("enabled"),'value':(usuarioInstance?.enabled)],-1)
printHtmlPart(39)
invokeTag('select','g',162,['id':("rolUsuario"),'name':("rolUsuario"),'from':(pruebaSeguridad.Role.list()),'optionKey':("id"),'multiple':("true"),'class':("chosen-select"),'value':(usuarioInstance?.authorities?.id),'onchange':("cambiarRol()"),'required':("")],-1)
printHtmlPart(40)
invokeTag('actionSubmit','g',169,['class':("btn btn-success"),'value':(message(code: 'default.button.actualizar.label', default: 'Actualizar')),'action':("update")],-1)
printHtmlPart(41)
})
invokeTag('form','g',171,['url':([resource:usuarioInstance, action:'update']),'method':("PUT"),'name':("f1")],2)
printHtmlPart(42)
})
invokeTag('captureBody','sitemesh',190,[:],1)
printHtmlPart(43)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1526400042000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
