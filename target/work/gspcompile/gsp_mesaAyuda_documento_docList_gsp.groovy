import pruebaSeguridad.Comentario
import pruebaSeguridad.Incidente
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_mesaAyuda_documento_docList_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/documento/_docList.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
printHtmlPart(1)
printHtmlPart(1)
printHtmlPart(2)
invokeTag('paginate','g',23,['next':("Forward"),'prev':("Back"),'maxsteps':("0"),'controller':("comentario"),'action':("index"),'total':(documentosCount)],-1)
printHtmlPart(3)
if(true && (documentosVer)) {
printHtmlPart(4)
for( _it966416978 in (documentosVer) ) {
changeItVariable(_it966416978)
printHtmlPart(5)
expressionOut.print(it.id)
printHtmlPart(6)
createTagBody(3, {->
printHtmlPart(7)
expressionOut.print(it.nombre)
printHtmlPart(7)
})
invokeTag('link','g',39,['controller':("incidente"),'action':("descarga"),'id':(it.id)],3)
printHtmlPart(8)
invokeTag('formatDate','g',40,['format':("dd / MMMMM / yyyy hh:mm aa"),'date':(it.fechaSubio)],-1)
printHtmlPart(9)
}
printHtmlPart(10)
}
printHtmlPart(11)
invokeTag('javascript','asset',59,['src':("script.js")],-1)
printHtmlPart(12)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1524246379000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
