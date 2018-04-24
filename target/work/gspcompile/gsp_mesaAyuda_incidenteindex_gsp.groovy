import pruebaSeguridad.Usuario
import pruebaSeguridad.Incidente
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_mesaAyuda_incidenteindex_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/incidente/index.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
printHtmlPart(1)
createTagBody(1, {->
printHtmlPart(2)
invokeTag('captureMeta','sitemesh',6,['gsp_sm_xmlClosingForEmptyTag':(""),'http-equiv':("content-type"),'content':("text/html; charset=UTF-8")],-1)
printHtmlPart(2)
invokeTag('captureMeta','sitemesh',7,['gsp_sm_xmlClosingForEmptyTag':(""),'charset':("utf-8")],-1)
printHtmlPart(2)
createTagBody(2, {->
createClosureForHtmlPart(3, 3)
invokeTag('captureTitle','sitemesh',8,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',8,[:],2)
printHtmlPart(4)
invokeTag('captureMeta','sitemesh',9,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("viewport"),'content':("width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no")],-1)
printHtmlPart(5)
invokeTag('captureMeta','sitemesh',10,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("layout"),'content':("main")],-1)
printHtmlPart(6)
})
invokeTag('captureHead','sitemesh',11,[:],1)
printHtmlPart(6)
createTagBody(1, {->
printHtmlPart(7)
createClosureForHtmlPart(8, 2)
invokeTag('ifAnyGranted','sec',86,['roles':("ROLE_DESARROLLADOR, ROLE_ADMIN")],2)
printHtmlPart(9)
createClosureForHtmlPart(10, 2)
invokeTag('ifAnyGranted','sec',90,['roles':("ROLE_ADMIN")],2)
printHtmlPart(11)
if(true && (incidentesVer)) {
printHtmlPart(12)
for( _it1397052719 in (incidentesVer) ) {
changeItVariable(_it1397052719)
printHtmlPart(13)
createTagBody(4, {->
expressionOut.print(it.folio)
})
invokeTag('link','g',99,['action':("show"),'id':(it.id)],4)
printHtmlPart(14)
expressionOut.print(it.tema)
printHtmlPart(15)
expressionOut.print(it.estatus)
printHtmlPart(16)
invokeTag('formatDate','g',102,['format':("dd MMMMM yyyy"),'date':(it.fechaRegistro)],-1)
printHtmlPart(17)
createTagBody(4, {->
printHtmlPart(18)
expressionOut.print(it?.registradoPor?.nombre)
printHtmlPart(19)
expressionOut.print(it?.registradoPor?.apellidoPat)
printHtmlPart(19)
expressionOut.print(it?.registradoPor?.apellidoMat)
printHtmlPart(20)
invokeTag('formatDate','g',105,['format':("dd MMMMM yyyy "),'date':(it?.fechaAsignacion)],-1)
printHtmlPart(17)
})
invokeTag('ifAnyGranted','sec',106,['roles':("ROLE_DESARROLLADOR, ROLE_ADMIN")],4)
printHtmlPart(12)
createTagBody(4, {->
printHtmlPart(21)
expressionOut.print(it?.asignadoA?.nombre)
printHtmlPart(19)
expressionOut.print(it?.asignadoA?.apellidoPat)
printHtmlPart(19)
expressionOut.print(it?.asignadoA?.apellidoMat)
printHtmlPart(22)
if(true && (it.envioCorreo==true)) {
printHtmlPart(23)
}
else if(true && (it?.estatus?.tipoEstatus=='Cerrado' && it?.envioCorreo==false)) {
createClosureForHtmlPart(24, 6)
invokeTag('link','g',117,['controller':("incidente"),'action':("enviarEmail"),'id':(it.id)],6)
printHtmlPart(19)
}
else {
printHtmlPart(25)
}
printHtmlPart(26)
createClosureForHtmlPart(27, 5)
invokeTag('link','g',120,['controller':("incidente"),'action':("enviarEmail"),'id':(it.id)],5)
printHtmlPart(28)
})
invokeTag('ifAnyGranted','sec',124,['roles':("ROLE_ADMIN")],4)
printHtmlPart(29)
}
printHtmlPart(9)
}
printHtmlPart(30)
createClosureForHtmlPart(8, 2)
invokeTag('ifAnyGranted','sec',139,['roles':("ROLE_DESARROLLADOR, ROLE_ADMIN")],2)
printHtmlPart(9)
createClosureForHtmlPart(10, 2)
invokeTag('ifAnyGranted','sec',143,['roles':("ROLE_ADMIN")],2)
printHtmlPart(31)
})
invokeTag('captureBody','sitemesh',168,[:],1)
printHtmlPart(32)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1524333082000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
