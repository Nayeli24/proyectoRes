import pruebaSeguridad.Empresa
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_mesaAyuda_usuariocreate_gsp extends GroovyPage {
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
})
invokeTag('captureHead','sitemesh',10,[:],1)
printHtmlPart(3)
createTagBody(1, {->
printHtmlPart(4)
if(true && (flash.message)) {
printHtmlPart(5)
expressionOut.print(flash.message)
printHtmlPart(6)
}
printHtmlPart(7)
createTagBody(2, {->
printHtmlPart(8)
createTagBody(3, {->
printHtmlPart(9)
if(true && (error in org.springframework.validation.FieldError)) {
printHtmlPart(10)
expressionOut.print(error.field)
printHtmlPart(11)
}
printHtmlPart(12)
invokeTag('message','g',64,['error':(error)],-1)
printHtmlPart(13)
})
invokeTag('eachError','g',65,['bean':(usuarioInstance),'var':("error")],3)
printHtmlPart(14)
})
invokeTag('hasErrors','g',67,['bean':(usuarioInstance)],2)
printHtmlPart(7)
createTagBody(2, {->
printHtmlPart(15)
expressionOut.print(detalle.id)
printHtmlPart(16)
expressionOut.print(usuarioInstance?.nombre)
printHtmlPart(17)
expressionOut.print(usuarioInstance?.apellidoPat)
printHtmlPart(18)
expressionOut.print(usuarioInstance?.apellidoMat)
printHtmlPart(19)
expressionOut.print(usuarioInstance?.areaDpto)
printHtmlPart(20)
invokeTag('select','g',127,['id':("empresa"),'name':("empresa"),'from':(detalle.empresas),'value':(usuarioInstance?.empresa?.id),'class':("form-control"),'optionKey':("id"),'optionValue':("nombreEmpresa"),'onchange':("usernameCrear()")],-1)
printHtmlPart(21)
invokeTag('message','g',133,['code':("Importante proporcionar el correo electrónico correcto")],-1)
printHtmlPart(22)
expressionOut.print(usuarioInstance?.email)
printHtmlPart(23)
expressionOut.print(usuarioInstance?.username)
printHtmlPart(24)
expressionOut.print(usuarioInstance?.password)
printHtmlPart(25)
invokeTag('submitButton','g',165,['name':("create"),'onclick':("comprobarClave()"),'class':("btn btn-success"),'value':("Agregar usuario")],-1)
printHtmlPart(26)
})
invokeTag('form','g',168,['name':("f1"),'id':("formCrearUsuario"),'method':("post"),'class':("form-horizontal"),'role':("form"),'url':([resource:usuarioInstance, action:'save'])],2)
printHtmlPart(27)
})
invokeTag('captureBody','sitemesh',353,[:],1)
printHtmlPart(28)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1523483953000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
