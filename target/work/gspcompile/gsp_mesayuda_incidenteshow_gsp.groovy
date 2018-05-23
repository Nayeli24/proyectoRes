import pruebaSeguridad.Incidente
import pruebaSeguridad.Documento
import pruebaSeguridad.Comentario
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_mesayuda_incidenteshow_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/incidente/show.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
printHtmlPart(0)
printHtmlPart(1)
createTagBody(1, {->
printHtmlPart(2)
invokeTag('captureMeta','sitemesh',9,['gsp_sm_xmlClosingForEmptyTag':(""),'http-equiv':("content-type"),'content':("text/html; charset=UTF-8")],-1)
printHtmlPart(2)
invokeTag('captureMeta','sitemesh',10,['gsp_sm_xmlClosingForEmptyTag':(""),'charset':("utf-8")],-1)
printHtmlPart(2)
createTagBody(2, {->
createClosureForHtmlPart(3, 3)
invokeTag('captureTitle','sitemesh',11,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',11,[:],2)
printHtmlPart(2)
invokeTag('captureMeta','sitemesh',12,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("viewport"),'content':("width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no")],-1)
printHtmlPart(2)
invokeTag('captureMeta','sitemesh',13,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("layout"),'content':("main")],-1)
printHtmlPart(2)
invokeTag('external','g',14,['dir':("js/jquery"),'file':("jquery-2.0.3.min.js")],-1)
printHtmlPart(4)
expressionOut.print(resource (dir: 'js', file: 'incidente.js'))
printHtmlPart(5)
})
invokeTag('captureHead','sitemesh',17,[:],1)
printHtmlPart(6)
createTagBody(1, {->
printHtmlPart(7)
invokeTag('initFbCommentsJS','fb',45,['appId':("372553439931986")],-1)
printHtmlPart(8)
createTagBody(2, {->
printHtmlPart(9)
if(true && (incidenteInstance?.estatus?.id==5)) {
printHtmlPart(10)
createTagBody(4, {->
printHtmlPart(11)
expressionOut.print(incidenteInstance?.id)
printHtmlPart(12)
invokeTag('jasperButton','g',71,['format':("pdf"),'jasper':("ticket_1"),'text':("Generar reporte")],-1)
printHtmlPart(13)
})
invokeTag('jasperForm','g',72,['controller':("incidente"),'action':("printReport"),'jasper':("ticket_1"),'name':("Incidente_${incidenteInstance.folio}")],4)
printHtmlPart(14)
}
printHtmlPart(15)
})
invokeTag('ifAnyGranted','sec',74,['roles':("ROLE_CLIENTE")],2)
printHtmlPart(16)
if(true && (incidenteInstance?.folio)) {
printHtmlPart(17)
invokeTag('fieldValue','g',97,['bean':(incidenteInstance),'field':("folio")],-1)
printHtmlPart(18)
}
printHtmlPart(19)
if(true && (incidenteInstance?.tema)) {
printHtmlPart(20)
invokeTag('fieldValue','g',103,['bean':(incidenteInstance),'field':("tema")],-1)
printHtmlPart(18)
}
printHtmlPart(19)
if(true && (incidenteInstance?.estatus)) {
printHtmlPart(21)
expressionOut.print(incidenteInstance?.estatus?.encodeAsHTML())
printHtmlPart(18)
}
printHtmlPart(19)
if(true && (incidenteInstance?.descripcion)) {
printHtmlPart(22)
invokeTag('fieldValue','g',115,['bean':(incidenteInstance),'field':("descripcion")],-1)
printHtmlPart(18)
}
printHtmlPart(19)
if(true && (incidenteInstance?.registradoPor)) {
printHtmlPart(23)
expressionOut.print(incidenteInstance?.registradoPor?.nombre)
printHtmlPart(24)
expressionOut.print(incidenteInstance?.registradoPor?.apellidoPat)
printHtmlPart(24)
expressionOut.print(incidenteInstance?.registradoPor?.apellidoMat)
printHtmlPart(25)
}
printHtmlPart(19)
if(true && (incidenteInstance?.fechaRegistro)) {
printHtmlPart(26)
invokeTag('formatDate','g',127,['format':("dd MMMMM yyyy"),'date':(incidenteInstance?.fechaRegistro)],-1)
printHtmlPart(18)
}
printHtmlPart(19)
if(true && (incidenteInstance?.asignadoA)) {
printHtmlPart(27)
createTagBody(3, {->
printHtmlPart(28)
expressionOut.print(incidenteInstance?.asignadoA?.nombre)
printHtmlPart(24)
expressionOut.print(incidenteInstance?.asignadoA?.apellidoPat)
printHtmlPart(24)
expressionOut.print(incidenteInstance?.asignadoA?.apellidoMat)
printHtmlPart(29)
})
invokeTag('ifAnyGranted','sec',136,['roles':("ROLE_ADMIN")],3)
printHtmlPart(19)
}
printHtmlPart(30)
if(true && (incidenteInstance?.fechaAsignacion)) {
printHtmlPart(31)
invokeTag('formatDate','g',141,['format':("dd MMMMM yyyy"),'date':(incidenteInstance?.fechaAsignacion)],-1)
printHtmlPart(32)
}
printHtmlPart(19)
if(true && (incidenteInstance?.solucion)) {
printHtmlPart(33)
invokeTag('fieldValue','g',147,['bean':(incidenteInstance),'field':("solucion")],-1)
printHtmlPart(18)
}
printHtmlPart(19)
if(true && (incidenteInstance?.fechaAtencion)) {
printHtmlPart(34)
invokeTag('formatDate','g',153,['format':("dd MMMMM yyyy"),'date':(incidenteInstance?.fechaAtencion)],-1)
printHtmlPart(35)
}
printHtmlPart(19)
if(true && (incidenteInstance?.estatus?.id==4)) {
printHtmlPart(27)
createTagBody(3, {->
printHtmlPart(36)
createTagBody(4, {->
invokeTag('actionSubmit','g',160,['class':("btn btn-success"),'value':("Finalizar Incidente")],-1)
})
invokeTag('link','g',160,['controller':("incidente"),'action':("cerrarIncidente"),'id':(incidenteInstance.id)],4)
printHtmlPart(37)
})
invokeTag('ifAnyGranted','sec',163,['roles':("ROLE_CLIENTE")],3)
printHtmlPart(19)
}
printHtmlPart(19)
createTagBody(2, {->
printHtmlPart(27)
if(true && (incidenteInstance?.estatus?.id==2)) {
printHtmlPart(38)
createClosureForHtmlPart(39, 4)
invokeTag('remoteLink','g',169,['controller':("incidente"),'action':("atender"),'id':(incidenteInstance.id),'update':([success:'divSolucion',failure:'errorSolucion'])],4)
printHtmlPart(40)
}
printHtmlPart(27)
if(true && (incidenteInstance?.estatus?.id==3)) {
printHtmlPart(41)
createClosureForHtmlPart(39, 4)
invokeTag('remoteLink','g',176,['controller':("incidente"),'action':("atender"),'id':(incidenteInstance.id),'update':([success:'divSolucion',failure:'errorSolucion'])],4)
printHtmlPart(40)
}
printHtmlPart(19)
})
invokeTag('ifAnyGranted','sec',180,['roles':("ROLE_DESARROLLADOR")],2)
printHtmlPart(42)
if(true && (incidenteInstance?.estatus?.id > 1)) {
printHtmlPart(43)
createTagBody(3, {->
printHtmlPart(44)
if(true && (incidenteInstance?.estatus?.id==2)) {
printHtmlPart(45)
}
else {
printHtmlPart(24)
expressionOut.print(incidenteInstance?.noComentarios)
printHtmlPart(24)
}
printHtmlPart(46)
})
invokeTag('remoteLink','g',184,['controller':("comentario"),'action':("index"),'id':(incidenteInstance.id),'update':([success:'divCom',failure:'errorCom'])],3)
printHtmlPart(47)
createTagBody(3, {->
printHtmlPart(48)
invokeTag('include','g',185,['controller':("documento"),'action':("contarDocumentos"),'id':(incidenteInstance.id)],-1)
printHtmlPart(46)
})
invokeTag('remoteLink','g',185,['controller':("documento"),'action':("index"),'id':(incidenteInstance.id),'update':([success:'divDoc',failure:'errorDoc'])],3)
printHtmlPart(49)
}
printHtmlPart(50)
expressionOut.print(incidenteInsance)
printHtmlPart(51)
invokeTag('comments','fb',190,['bean':(incidenteInstance)],-1)
printHtmlPart(52)
if(true && (incidenteInstance?.estatus?.id==2 || incidenteInstance?.estatus?.id==3)) {
printHtmlPart(53)
createTagBody(3, {->
printHtmlPart(54)
expressionOut.print(incidenteInstance.id)
printHtmlPart(55)
})
invokeTag('formRemote','g',201,['onLoading':("sumar(1);"),'name':("formComentario"),'url':([controller:'incidente',action:'enviarComentario']),'update':([success:'message',failure:'error']),'onSuccess':("javascript: limpia(getElementById('comentario'));")],3)
printHtmlPart(56)
}
printHtmlPart(57)
if(true && (incidenteInstance?.estatus?.id==1)) {
printHtmlPart(27)
createTagBody(3, {->
printHtmlPart(58)
createTagBody(4, {->
printHtmlPart(59)
createClosureForHtmlPart(60, 5)
invokeTag('remoteLink','g',211,['controller':("incidente"),'action':("cargaArchivos"),'id':(incidenteInstance.id),'update':([success:'message3',failure:'error3'])],5)
printHtmlPart(61)
createClosureForHtmlPart(62, 5)
invokeTag('remoteLink','g',215,['controller':("documento"),'action':("contarDocumentos"),'id':(incidenteInstance.id),'update':([success:'noDoc',failure:'error3'])],5)
printHtmlPart(63)
})
invokeTag('form','g',217,['url':([resource:incidenteInstance, action:'delete']),'method':("DELETE"),'id':("delete"),'name':("delete")],4)
printHtmlPart(64)
})
invokeTag('ifAnyGranted','sec',218,['roles':("ROLE_CLIENTE")],3)
printHtmlPart(65)
createTagBody(3, {->
printHtmlPart(48)
invokeTag('include','g',219,['controller':("documento"),'action':("contarDocumentos"),'id':(incidenteInstance.id)],-1)
printHtmlPart(46)
})
invokeTag('remoteLink','g',219,['controller':("documento"),'action':("index"),'id':(incidenteInstance.id),'update':([success:'divDoc',failure:'errorDoc'])],3)
printHtmlPart(66)
}
printHtmlPart(67)
})
invokeTag('captureBody','sitemesh',242,[:],1)
printHtmlPart(68)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1527112135000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
