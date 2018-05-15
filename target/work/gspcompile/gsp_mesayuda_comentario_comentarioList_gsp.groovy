import pruebaSeguridad.Comentario
import pruebaSeguridad.Incidente
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_mesayuda_comentario_comentarioList_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/comentario/_comentarioList.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
printHtmlPart(1)
printHtmlPart(1)
printHtmlPart(2)
if(true && (comentariosVer)) {
printHtmlPart(3)
for( _it1695528207 in (comentariosVer) ) {
changeItVariable(_it1695528207)
printHtmlPart(4)
invokeTag('formatDate','g',35,['format':("dd / MMMMM / yyyy hh:mm aa"),'date':(it.fechaComentario)],-1)
printHtmlPart(5)
expressionOut.print(it?.usuario?.nombre)
printHtmlPart(6)
expressionOut.print(it?.usuario?.apellidoPat)
printHtmlPart(6)
expressionOut.print(it?.usuario?.apellidoMat)
printHtmlPart(7)
expressionOut.print(it.descripcion)
printHtmlPart(8)
}
printHtmlPart(9)
}
printHtmlPart(10)
invokeTag('javascript','asset',55,['src':("script.js")],-1)
printHtmlPart(11)
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
