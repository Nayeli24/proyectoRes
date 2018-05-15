import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_mesayuda_layoutsmain_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/layouts/main.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
createTagBody(1, {->
printHtmlPart(1)
createTagBody(2, {->
createTagBody(3, {->
invokeTag('layoutTitle','g',4,['default':("Inicio")],-1)
})
invokeTag('captureTitle','sitemesh',4,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',4,[:],2)
printHtmlPart(2)
invokeTag('layoutResources','r',6,[:],-1)
printHtmlPart(3)
invokeTag('stylesheet','asset',8,['src':("application.css")],-1)
printHtmlPart(4)
invokeTag('captureMeta','sitemesh',9,['gsp_sm_xmlClosingForEmptyTag':(""),'http-equiv':("content-type"),'content':("text/html; charset=UTF-8")],-1)
printHtmlPart(4)
invokeTag('captureMeta','sitemesh',10,['gsp_sm_xmlClosingForEmptyTag':(""),'charset':("utf-8")],-1)
printHtmlPart(4)
createTagBody(2, {->
createClosureForHtmlPart(5, 3)
invokeTag('captureTitle','sitemesh',11,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',11,[:],2)
printHtmlPart(6)
invokeTag('captureMeta','sitemesh',12,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("viewport"),'content':("width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no")],-1)
printHtmlPart(4)
invokeTag('captureMeta','sitemesh',13,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("description"),'content':("")],-1)
printHtmlPart(4)
invokeTag('captureMeta','sitemesh',14,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("author"),'content':("")],-1)
printHtmlPart(7)
invokeTag('external','g',15,['dir':("web-app/js"),'file':("script.js")],-1)
printHtmlPart(8)
invokeTag('external','g',23,['dir':("css"),'file':("cloud-admin.css")],-1)
printHtmlPart(4)
invokeTag('external','g',24,['dir':("css/themes"),'file':("night.css")],-1)
printHtmlPart(4)
invokeTag('external','g',25,['dir':("css"),'file':("responsive.css")],-1)
printHtmlPart(4)
invokeTag('external','g',26,['dir':("font-awesome/css"),'file':("font-awesome.min.css")],-1)
printHtmlPart(9)
invokeTag('external','g',28,['dir':("js/jquery-ui-1.10.3.custom/css/custom-theme"),'file':("jquery-ui-1.10.3.custom.min.css")],-1)
printHtmlPart(10)
invokeTag('external','g',30,['dir':("js/bootstrap-daterangepicker"),'file':("daterangepicker-bs3.css")],-1)
printHtmlPart(11)
invokeTag('external','g',32,['dir':("js/datatables/media/css"),'file':("jquery.dataTables.min.css")],-1)
printHtmlPart(4)
invokeTag('external','g',33,['dir':("js/datatables/media/assets/css"),'file':("datatables.min.css")],-1)
printHtmlPart(4)
invokeTag('external','g',34,['dir':("js/datatables/extras/TableTools/media/css"),'file':("TableTools.min.css")],-1)
printHtmlPart(12)
invokeTag('external','g',38,['dir':("js/dropzone"),'file':("dropzone.min.css")],-1)
printHtmlPart(2)
invokeTag('layoutHead','g',40,[:],-1)
printHtmlPart(13)
})
invokeTag('captureHead','sitemesh',41,[:],1)
printHtmlPart(13)
createTagBody(1, {->
printHtmlPart(14)
invokeTag('render','g',44,['template':("/layouts/header")],-1)
printHtmlPart(15)
invokeTag('render','g',46,['template':("/layouts/navbar")],-1)
printHtmlPart(16)
invokeTag('layoutBody','g',48,[:],-1)
printHtmlPart(17)
invokeTag('javascript','asset',49,['src':("application.js")],-1)
printHtmlPart(18)
invokeTag('external','g',54,['dir':("js/jquery"),'file':("jquery-2.0.3.min.js")],-1)
printHtmlPart(19)
invokeTag('external','g',56,['dir':("js/jquery-ui-1.10.3.custom/js"),'file':("jquery-ui-1.10.3.custom.min.js")],-1)
printHtmlPart(20)
invokeTag('external','g',58,['dir':("bootstrap-dist/js"),'file':("bootstrap.min.js")],-1)
printHtmlPart(10)
invokeTag('external','g',60,['dir':("js/bootstrap-daterangepicker"),'file':("moment.min.js")],-1)
printHtmlPart(4)
invokeTag('external','g',61,['dir':("js/bootstrap-daterangepicker"),'file':("daterangepicker.min.js")],-1)
printHtmlPart(21)
invokeTag('external','g',63,['dir':("js/jQuery-slimScroll-1.3.0"),'file':("jquery.slimscroll.min.js")],-1)
printHtmlPart(4)
invokeTag('external','g',64,['dir':("js/jQuery-slimScroll-1.3.0"),'file':("slimScrollHorizontal.min.js")],-1)
printHtmlPart(22)
invokeTag('external','g',66,['dir':("js/jQuery-BlockUI"),'file':("jquery.blockUI.min.js")],-1)
printHtmlPart(23)
invokeTag('external','g',68,['dir':("js/dropzone"),'file':("dropzone.min.js")],-1)
printHtmlPart(24)
invokeTag('external','g',70,['dir':("js/datatables/media/js"),'file':("jquery.dataTables.min.js")],-1)
printHtmlPart(4)
invokeTag('external','g',71,['dir':("js/datatables/media/assets/js"),'file':("datatables.min.js")],-1)
printHtmlPart(4)
invokeTag('external','g',72,['dir':("js/datatables/extras/TableTools/media/js"),'file':("TableTools.min.js")],-1)
printHtmlPart(4)
invokeTag('external','g',73,['dir':("js/datatables/extras/TableTools/media/js"),'file':("ZeroClipboard.min.js")],-1)
printHtmlPart(25)
invokeTag('external','g',75,['dir':("js/jQuery-Cookie"),'file':("jquery.cookie.min.js")],-1)
printHtmlPart(26)
invokeTag('javascript','asset',78,['src':("script.js")],-1)
printHtmlPart(27)
})
invokeTag('captureBody','sitemesh',86,[:],1)
printHtmlPart(28)
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
