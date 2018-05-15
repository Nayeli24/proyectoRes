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
invokeTag('captureMeta','sitemesh',8,['gsp_sm_xmlClosingForEmptyTag':(""),'http-equiv':("content-type"),'content':("text/html; charset=UTF-8")],-1)
printHtmlPart(2)
invokeTag('captureMeta','sitemesh',9,['gsp_sm_xmlClosingForEmptyTag':(""),'charset':("utf-8")],-1)
printHtmlPart(2)
createTagBody(2, {->
createClosureForHtmlPart(3, 3)
invokeTag('captureTitle','sitemesh',10,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',10,[:],2)
printHtmlPart(2)
invokeTag('captureMeta','sitemesh',11,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("viewport"),'content':("width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no")],-1)
printHtmlPart(2)
invokeTag('captureMeta','sitemesh',12,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("layout"),'content':("main")],-1)
printHtmlPart(4)
expressionOut.print(resource (dir: 'js', file: 'incidente.js'))
printHtmlPart(5)
})
invokeTag('captureHead','sitemesh',15,[:],1)
printHtmlPart(6)
createTagBody(1, {->
printHtmlPart(7)
invokeTag('initFbCommentsJS','fb',43,['appId':("372553439931986")],-1)
printHtmlPart(8)
createTagBody(2, {->
printHtmlPart(9)
if(true && (incidenteInstance?.estatus?.id==5)) {
printHtmlPart(10)
createTagBody(4, {->
printHtmlPart(11)
expressionOut.print(incidenteInstance?.id)
printHtmlPart(12)
invokeTag('jasperButton','g',69,['format':("pdf"),'jasper':("ticket_1"),'text':("Generar reporte")],-1)
printHtmlPart(13)
})
invokeTag('jasperForm','g',70,['controller':("incidente"),'action':("printReport"),'jasper':("ticket_1"),'name':("Incidente_${incidenteInstance.folio}")],4)
printHtmlPart(14)
}
printHtmlPart(15)
})
invokeTag('ifAnyGranted','sec',72,['roles':("ROLE_CLIENTE")],2)
printHtmlPart(16)
if(true && (incidenteInstance?.folio)) {
printHtmlPart(17)
invokeTag('fieldValue','g',95,['bean':(incidenteInstance),'field':("folio")],-1)
printHtmlPart(18)
}
printHtmlPart(19)
if(true && (incidenteInstance?.tema)) {
printHtmlPart(20)
invokeTag('fieldValue','g',101,['bean':(incidenteInstance),'field':("tema")],-1)
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
invokeTag('fieldValue','g',113,['bean':(incidenteInstance),'field':("descripcion")],-1)
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
invokeTag('formatDate','g',125,['format':("dd MMMMM yyyy"),'date':(incidenteInstance?.fechaRegistro)],-1)
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
invokeTag('ifAnyGranted','sec',134,['roles':("ROLE_ADMIN")],3)
printHtmlPart(19)
}
printHtmlPart(30)
if(true && (incidenteInstance?.fechaAsignacion)) {
printHtmlPart(31)
invokeTag('formatDate','g',139,['format':("dd MMMMM yyyy"),'date':(incidenteInstance?.fechaAsignacion)],-1)
printHtmlPart(32)
}
printHtmlPart(19)
if(true && (incidenteInstance?.solucion)) {
printHtmlPart(33)
invokeTag('fieldValue','g',145,['bean':(incidenteInstance),'field':("solucion")],-1)
printHtmlPart(18)
}
printHtmlPart(19)
if(true && (incidenteInstance?.fechaAtencion)) {
printHtmlPart(34)
invokeTag('formatDate','g',151,['format':("dd MMMMM yyyy"),'date':(incidenteInstance?.fechaAtencion)],-1)
printHtmlPart(35)
}
printHtmlPart(19)
if(true && (incidenteInstance?.estatus?.id==4)) {
printHtmlPart(27)
createTagBody(3, {->
printHtmlPart(36)
createTagBody(4, {->
invokeTag('actionSubmit','g',158,['class':("btn btn-success"),'value':("Finalizar Incidente")],-1)
})
invokeTag('link','g',158,['controller':("incidente"),'action':("cerrarIncidente"),'id':(incidenteInstance.id)],4)
printHtmlPart(37)
})
invokeTag('ifAnyGranted','sec',161,['roles':("ROLE_CLIENTE")],3)
printHtmlPart(19)
}
printHtmlPart(19)
createTagBody(2, {->
printHtmlPart(27)
if(true && (incidenteInstance?.estatus?.id==3)) {
printHtmlPart(38)
createClosureForHtmlPart(39, 4)
invokeTag('remoteLink','g',167,['controller':("incidente"),'action':("atender"),'id':(incidenteInstance.id),'update':([success:'divSolucion',failure:'errorSolucion'])],4)
printHtmlPart(40)
}
printHtmlPart(19)
})
invokeTag('ifAnyGranted','sec',171,['roles':("ROLE_DESARROLLADOR")],2)
printHtmlPart(41)
expressionOut.print(incidenteInsance)
printHtmlPart(42)
invokeTag('comments','fb',177,['bean':(incidenteInstance)],-1)
printHtmlPart(43)
if(true && (incidenteInstance?.estatus?.id==2 || incidenteInstance?.estatus?.id==3)) {
printHtmlPart(27)
createTagBody(3, {->
printHtmlPart(44)
createTagBody(4, {->
printHtmlPart(45)
expressionOut.print(incidenteInstance.id)
printHtmlPart(46)
})
invokeTag('form','g',186,['id':("fc"),'name':("formComentario"),'url':([controller:'incidente',action:'enviarComentario'])],4)
printHtmlPart(27)
})
invokeTag('ifAnyGranted','sec',187,['roles':("ROLE_DESARROLLADOR,ROLE_CLIENTE")],3)
printHtmlPart(19)
}
printHtmlPart(47)
if(true && (incidenteInstance?.estatus?.id > 1)) {
printHtmlPart(48)
createTagBody(3, {->
printHtmlPart(49)
invokeTag('include','g',193,['controller':("comentario"),'action':("contarComentarios"),'id':(incidenteInstance.id)],-1)
printHtmlPart(50)
})
invokeTag('remoteLink','g',193,['controller':("comentario"),'action':("index"),'id':(incidenteInstance.id),'update':([success:'divCom',failure:'errorCom'])],3)
printHtmlPart(51)
createTagBody(3, {->
printHtmlPart(52)
invokeTag('include','g',194,['controller':("documento"),'action':("contarDocumentos"),'id':(incidenteInstance.id)],-1)
printHtmlPart(50)
})
invokeTag('remoteLink','g',194,['controller':("documento"),'action':("index"),'id':(incidenteInstance.id),'update':([success:'divDoc',failure:'errorDoc'])],3)
printHtmlPart(53)
}
printHtmlPart(54)
if(true && (incidenteInstance?.estatus?.id==1)) {
printHtmlPart(27)
createTagBody(3, {->
printHtmlPart(44)
createTagBody(4, {->
printHtmlPart(55)
createClosureForHtmlPart(56, 5)
invokeTag('remoteLink','g',202,['controller':("incidente"),'action':("cargaArchivos"),'id':(incidenteInstance.id),'update':([success:'message3',failure:'error3'])],5)
printHtmlPart(57)
})
invokeTag('form','g',204,['url':([resource:incidenteInstance, action:'delete']),'method':("DELETE"),'id':("delete"),'name':("delete")],4)
printHtmlPart(58)
})
invokeTag('ifAnyGranted','sec',205,['roles':("ROLE_CLIENTE")],3)
printHtmlPart(59)
createTagBody(3, {->
printHtmlPart(52)
invokeTag('include','g',206,['controller':("documento"),'action':("contarDocumentos"),'id':(incidenteInstance.id)],-1)
printHtmlPart(50)
})
invokeTag('remoteLink','g',206,['controller':("documento"),'action':("index"),'id':(incidenteInstance.id),'update':([success:'divDoc',failure:'errorDoc'])],3)
printHtmlPart(60)
}
printHtmlPart(61)
})
invokeTag('captureBody','sitemesh',227,[:],1)
printHtmlPart(62)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1525888016000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
