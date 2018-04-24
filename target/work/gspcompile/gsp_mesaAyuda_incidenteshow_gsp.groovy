import pruebaSeguridad.Incidente
import pruebaSeguridad.Documento
import pruebaSeguridad.Comentario
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_mesaAyuda_incidenteshow_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/incidente/show.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
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
printHtmlPart(4)
invokeTag('captureMeta','sitemesh',13,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("viewport"),'content':("width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no")],-1)
printHtmlPart(2)
invokeTag('captureMeta','sitemesh',14,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("layout"),'content':("main")],-1)
printHtmlPart(5)
})
invokeTag('captureHead','sitemesh',18,[:],1)
printHtmlPart(6)
createTagBody(1, {->
printHtmlPart(7)
createTagBody(2, {->
printHtmlPart(8)
if(true && (incidenteInstance?.estatus?.id==5)) {
printHtmlPart(9)
createTagBody(4, {->
printHtmlPart(10)
expressionOut.print(incidenteInstance?.id)
printHtmlPart(11)
invokeTag('jasperButton','g',46,['format':("pdf"),'jasper':("ticket_1"),'text':("Generar reporte")],-1)
printHtmlPart(12)
})
invokeTag('jasperForm','g',47,['controller':("incidente"),'action':("printReport"),'jasper':("ticket_1"),'name':("Incidente_${incidenteInstance.folio}")],4)
printHtmlPart(13)
}
printHtmlPart(14)
})
invokeTag('ifAnyGranted','sec',49,['roles':("ROLE_CLIENTE")],2)
printHtmlPart(15)
if(true && (incidenteInstance?.folio)) {
printHtmlPart(16)
invokeTag('fieldValue','g',72,['bean':(incidenteInstance),'field':("folio")],-1)
printHtmlPart(17)
}
printHtmlPart(18)
if(true && (incidenteInstance?.tema)) {
printHtmlPart(19)
invokeTag('fieldValue','g',78,['bean':(incidenteInstance),'field':("tema")],-1)
printHtmlPart(17)
}
printHtmlPart(18)
if(true && (incidenteInstance?.estatus)) {
printHtmlPart(20)
expressionOut.print(incidenteInstance?.estatus?.encodeAsHTML())
printHtmlPart(17)
}
printHtmlPart(18)
if(true && (incidenteInstance?.descripcion)) {
printHtmlPart(21)
invokeTag('fieldValue','g',90,['bean':(incidenteInstance),'field':("descripcion")],-1)
printHtmlPart(17)
}
printHtmlPart(18)
if(true && (incidenteInstance?.registradoPor)) {
printHtmlPart(22)
expressionOut.print(incidenteInstance?.registradoPor?.nombre)
printHtmlPart(23)
expressionOut.print(incidenteInstance?.registradoPor?.apellidoPat)
printHtmlPart(23)
expressionOut.print(incidenteInstance?.registradoPor?.apellidoMat)
printHtmlPart(24)
}
printHtmlPart(18)
if(true && (incidenteInstance?.fechaRegistro)) {
printHtmlPart(25)
invokeTag('formatDate','g',102,['format':("dd MMMMM yyyy"),'date':(incidenteInstance?.fechaRegistro)],-1)
printHtmlPart(17)
}
printHtmlPart(18)
if(true && (incidenteInstance?.asignadoA)) {
printHtmlPart(26)
createTagBody(3, {->
printHtmlPart(27)
expressionOut.print(incidenteInstance?.asignadoA?.nombre)
printHtmlPart(23)
expressionOut.print(incidenteInstance?.asignadoA?.apellidoPat)
printHtmlPart(23)
expressionOut.print(incidenteInstance?.asignadoA?.apellidoMat)
printHtmlPart(28)
})
invokeTag('ifAnyGranted','sec',111,['roles':("ROLE_ADMIN")],3)
printHtmlPart(18)
}
printHtmlPart(29)
if(true && (incidenteInstance?.fechaAsignacion)) {
printHtmlPart(30)
invokeTag('formatDate','g',116,['format':("dd MMMMM yyyy"),'date':(incidenteInstance?.fechaAsignacion)],-1)
printHtmlPart(31)
}
printHtmlPart(18)
if(true && (incidenteInstance?.solucion)) {
printHtmlPart(32)
invokeTag('fieldValue','g',122,['bean':(incidenteInstance),'field':("solucion")],-1)
printHtmlPart(17)
}
printHtmlPart(18)
if(true && (incidenteInstance?.fechaAtencion)) {
printHtmlPart(33)
invokeTag('formatDate','g',128,['format':("dd MMMMM yyyy"),'date':(incidenteInstance?.fechaAtencion)],-1)
printHtmlPart(34)
}
printHtmlPart(18)
if(true && (incidenteInstance?.estatus?.id==4)) {
printHtmlPart(26)
createTagBody(3, {->
printHtmlPart(35)
createTagBody(4, {->
invokeTag('actionSubmit','g',135,['class':("btn btn-success"),'value':("Finalizar Incidente")],-1)
})
invokeTag('link','g',135,['controller':("incidente"),'action':("cerrarIncidente"),'id':(incidenteInstance.id)],4)
printHtmlPart(36)
})
invokeTag('ifAnyGranted','sec',138,['roles':("ROLE_CLIENTE")],3)
printHtmlPart(18)
}
printHtmlPart(37)
if(true && (incidenteInstance?.estatus?.id==2 || incidenteInstance?.estatus?.id==3)) {
printHtmlPart(38)
createTagBody(3, {->
printHtmlPart(26)
createTagBody(4, {->
printHtmlPart(39)
expressionOut.print(incidenteInstance.id)
printHtmlPart(40)
})
invokeTag('formRemote','g',150,['name':("formComentario"),'url':([controller:'incidente',action:'enviarComentario']),'update':([success:'message',failure:'error'])],4)
printHtmlPart(26)
})
invokeTag('ifAnyGranted','sec',151,['roles':("ROLE_DESARROLLADOR,ROLE_CLIENTE")],3)
printHtmlPart(41)
createTagBody(3, {->
printHtmlPart(42)
invokeTag('include','g',152,['controller':("comentario"),'action':("contarComentarios"),'id':(incidenteInstance.id)],-1)
printHtmlPart(43)
})
invokeTag('remoteLink','g',152,['controller':("comentario"),'action':("index"),'id':(incidenteInstance.id),'update':([success:'message',failure:'error'])],3)
printHtmlPart(44)
}
printHtmlPart(18)
createTagBody(2, {->
printHtmlPart(26)
if(true && (incidenteInstance?.estatus?.id==3)) {
printHtmlPart(45)
createTagBody(4, {->
printHtmlPart(46)
expressionOut.print(incidenteInstance.folio)
printHtmlPart(23)
})
invokeTag('remoteLink','g',156,['controller':("incidente"),'action':("atender"),'id':(incidenteInstance.id),'update':([success:'message',failure:'error'])],4)
printHtmlPart(47)
}
printHtmlPart(18)
})
invokeTag('ifAnyGranted','sec',158,['roles':("ROLE_DESARROLLADOR")],2)
printHtmlPart(48)
createTagBody(2, {->
printHtmlPart(26)
if(true && (incidenteInstance?.estatus?.id==1)) {
printHtmlPart(49)
createClosureForHtmlPart(50, 4)
invokeTag('form','g',170,['url':([resource:incidenteInstance, action:'delete']),'method':("DELETE"),'id':("delete"),'name':("delete")],4)
printHtmlPart(26)
}
printHtmlPart(51)
})
invokeTag('ifAnyGranted','sec',173,['roles':("ROLE_CLIENTE")],2)
printHtmlPart(18)
if(true && (incidenteInstance?.estatus?.id > 3)) {
printHtmlPart(41)
createTagBody(3, {->
printHtmlPart(42)
invokeTag('include','g',175,['controller':("comentario"),'action':("contarComentarios"),'id':(incidenteInstance.id)],-1)
printHtmlPart(43)
})
invokeTag('remoteLink','g',175,['controller':("comentario"),'action':("index"),'id':(incidenteInstance.id),'update':([success:'message',failure:'error'])],3)
printHtmlPart(52)
createTagBody(3, {->
printHtmlPart(53)
invokeTag('include','g',176,['controller':("documento"),'action':("contarDocumentos"),'id':(incidenteInstance.id)],-1)
printHtmlPart(43)
})
invokeTag('remoteLink','g',176,['controller':("documento"),'action':("index"),'id':(incidenteInstance.id),'update':([success:'message',failure:'error'])],3)
printHtmlPart(54)
}
printHtmlPart(55)
})
invokeTag('captureBody','sitemesh',221,[:],1)
printHtmlPart(56)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1524347820000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
