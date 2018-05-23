import pruebaSeguridad.Empresa
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_mesayuda_usuariocreate_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/usuario/create.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
createTagBody(1, {->
printHtmlPart(1)
invokeTag('captureMeta','sitemesh',5,['gsp_sm_xmlClosingForEmptyTag':(""),'http-equiv':("content-type"),'content':("text/html; charset=UTF-8")],-1)
printHtmlPart(1)
invokeTag('captureMeta','sitemesh',6,['gsp_sm_xmlClosingForEmptyTag':(""),'charset':("utf-8")],-1)
printHtmlPart(1)
createTagBody(2, {->
createClosureForHtmlPart(2, 3)
invokeTag('captureTitle','sitemesh',7,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',7,[:],2)
printHtmlPart(1)
invokeTag('captureMeta','sitemesh',8,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("viewport"),'content':("width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no")],-1)
printHtmlPart(1)
invokeTag('captureMeta','sitemesh',9,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("layout"),'content':("main")],-1)
printHtmlPart(3)
invokeTag('external','g',11,['dir':("js/jquery"),'file':("jquery-2.0.3.min.js")],-1)
printHtmlPart(4)
expressionOut.print(resource (dir: 'js', file: 'usuario.js'))
printHtmlPart(5)
})
invokeTag('captureHead','sitemesh',17,[:],1)
printHtmlPart(6)
createTagBody(1, {->
printHtmlPart(7)
if(true && (flash.message)) {
printHtmlPart(8)
expressionOut.print(flash.message)
printHtmlPart(9)
}
printHtmlPart(10)
createTagBody(2, {->
printHtmlPart(11)
createTagBody(3, {->
printHtmlPart(12)
if(true && (error in org.springframework.validation.FieldError)) {
printHtmlPart(13)
expressionOut.print(error.field)
printHtmlPart(14)
}
printHtmlPart(15)
invokeTag('message','g',71,['error':(error)],-1)
printHtmlPart(16)
})
invokeTag('eachError','g',72,['bean':(usuarioInstance),'var':("error")],3)
printHtmlPart(17)
})
invokeTag('hasErrors','g',74,['bean':(usuarioInstance)],2)
printHtmlPart(10)
createTagBody(2, {->
printHtmlPart(18)
expressionOut.print(detalle.id)
printHtmlPart(19)
invokeTag('select','g',80,['id':("rolUsuario"),'name':("rolUsuario"),'from':(pruebaSeguridad.Role.list()),'optionKey':("id"),'multiple':("true"),'class':("chosen-select"),'value':(usuarioInstance?.authorities?.id),'onchange':("usernameCrear()"),'required':("")],-1)
printHtmlPart(20)
expressionOut.print(usuarioInstance?.nombre)
printHtmlPart(21)
expressionOut.print(usuarioInstance?.apellidoPat)
printHtmlPart(22)
expressionOut.print(usuarioInstance?.apellidoMat)
printHtmlPart(23)
expressionOut.print(usuarioInstance?.areaDpto)
printHtmlPart(24)
invokeTag('select','g',132,['id':("empresa"),'name':("empresa"),'from':(detalle.empresas),'value':(usuarioInstance?.empresa?.id),'class':("form-control"),'optionKey':("id"),'optionValue':("nombreEmpresa"),'onchange':("usernameCrear()")],-1)
printHtmlPart(25)
invokeTag('message','g',138,['code':("Importante proporcionar el correo electrónico correcto")],-1)
printHtmlPart(26)
expressionOut.print(usuarioInstance?.email)
printHtmlPart(27)
expressionOut.print(usuarioInstance?.username)
printHtmlPart(28)
expressionOut.print(usuarioInstance?.password)
printHtmlPart(29)
expressionOut.print(usuarioInstance?.twitterName)
printHtmlPart(30)
invokeTag('submitButton','g',177,['name':("create"),'onclick':("comprobarClave()"),'class':("btn btn-success"),'value':("Agregar usuario")],-1)
printHtmlPart(31)
})
invokeTag('form','g',179,['name':("f1"),'id':("formCrearUsuario"),'method':("post"),'class':("form-horizontal"),'role':("form"),'url':([resource:usuarioInstance, action:'save'])],2)
printHtmlPart(32)
})
invokeTag('captureBody','sitemesh',192,[:],1)
printHtmlPart(33)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1527115992000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
