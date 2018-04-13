package pruebaSeguridad


import java.text.SimpleDateFormat
import java.text.DateFormat
import java.text.DateFormatSymbols

import static org.springframework.http.HttpStatus.*
import static org.springframework.web.multipart.MultipartFile.*
import static org.springframework.web.multipart.commons.CommonsMultipartFile.*
import static org.springframework.web.multipart.MultipartHttpServletRequest.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.plugins.jasper.JasperExportFormat
import org.codehaus.groovy.grails.plugins.jasper.JasperReportDef

@Transactional//(readOnly = true)
class IncidenteController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def MailService
    def springSecurityService
    def incidenteService
    def comentarioService
    static final  int i=0
    def flujoController
    def fechaCerrado
   
    def index(Integer max) {
        params.max = Math.min(max ?: 10,100)
        def incidentes=[]
        //  respond Incidente.list(params), model:[incidenteInstanceCount: Incidente.count()]
        incidentes=incidenteService.verIncidentes(springSecurityService.currentUser.authorities.authority as String,springSecurityService.currentUser.username)
        println "fbbvbbvvvbnvbnvbn.....Controller"+ incidentes
        render (view:"index", model: [incidentesVer: incidentes, incidenteInstanceCount: incidentes.size()])
        
    } 

    def show(Incidente incidenteInstance) {
         
  
        respond incidenteInstance   }

    def create() {
        println "31:::::::::::::$params"
        def resp= incidenteService.ultimoRegistro()
        // def valor =resp.id_ticket as int
        //        def valor=Integer.valueOf(resp)
        params.folio=resp
        println "Folio$params.folio"    
        respond new Incidente(params)
    }

    @Transactional
    def save(Incidente incidenteInstance) {
        println ":::::::::::::::$params"
        if (incidenteInstance == null) {
            notFound()
            return
        }

        if (incidenteInstance.hasErrors()) {
            respond incidenteInstance.errors, view:'create'
            return
        }
        
        def us = springSecurityService.currentUser.username
        println us
        incidenteInstance.registradoPor = Usuario.findByUsername(us)
        incidenteInstance.estatus = Estatus.get(1 as long)
        incidenteInstance.save()
        def inf = incidenteService.guardarFlujo(us,1,incidenteInstance)
        
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'incidente.label', default: 'Incidente'), incidenteInstance.id])
                redirect incidenteInstance
            }
            '*' { respond incidenteInstance, [status: CREATED] }
        }
    }

    def edit(Incidente incidenteInstance) {
        respond incidenteInstance
    }

    @Transactional
    def update(Incidente incidenteInstance) {
        if (incidenteInstance == null) {
            notFound()
            return
        }

        if (incidenteInstance.hasErrors()) {
            respond incidenteInstance.errors, view:'edit'
            return
        }
        
        def us = springSecurityService.currentUser.username
        println us
        incidenteInstance.estatus = Estatus.get(4 as long)
        incidenteInstance.save()
        def inf = incidenteService.guardarFlujo(us,4,incidenteInstance)

        incidenteInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Incidente.label', default: 'Incidente'), incidenteInstance.id])
                redirect incidenteInstance
            }
            '*'{ respond incidenteInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Incidente incidenteInstance) {
        def res= Flujo.findByIncidente(Incidente.get(params.id))
        res.delete flush:true
        if (incidenteInstance == null) {
            notFound()
            return
        }
        
        incidenteInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Incidente.label', default: 'Incidente'), incidenteInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'incidente.label', default: 'Incidente'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    def asignar (){
        flash.error = "No existen incidentes nuevos para realizar la asignación"
        def data = [:]
        data.incidentes=incidenteService.obtenerIncidentes("SinAsignar" , "ROLE_CLIENTE",springSecurityService.currentUser.username)
        data.usuarios = incidenteService.obtenerUsuarios("ROLE_DESARROLLADOR")
        render (view:"asignar", model: [detalle: data ])  
    }
    def asignarIncidente (){
        println ":::::asignar incidente::::::::::::::$params"
        def lista=[]
        lista=params.incidente
        for( i in lista){
            println ":::::::::::::"+i
            i.each{
                def incident=Incidente.findById(it)
                println "incidente:::::::::::"+incident
                incident.asignadoA =Usuario.findById(params.asignadoA as long)
                incident.estatus = Estatus.get(2 as int)
                def date = new Date()      
	        incident.fechaAsignacion = new Date()            
                incident.save()
                def gf = incidenteService.guardarFlujo(springSecurityService.currentUser.username,2,incident)
            }
        }
       redirect (action: "index")
    }
    
    
    
    def cerrarIncidente (){
        println "::::::::::::cerrar:::::::$params"
        def id=params.id
        def incidente=Incidente.get(params.id as long)
        def date = new Date()
      
        incidente.fechaCerrado= new Date()
        incidente.estatus=Estatus.get(5 as int)
        def gf = incidenteService.guardarFlujo(springSecurityService.currentUser.username,5,incidente)
        redirect (controller:"incidente", action:"index")
    }
    
    def descarga() {
        println "::::::::::::.$params"
        def documento= Documento.get(params.id as long)
        println "::::::::::::::documento"+documento.urlArchivo
        def file = new File(documento.urlArchivo)    
        response.setContentType("application/octet-stream")
        response.setHeader("Content-disposition", "filename=${file.getName()}")
        response.getOutputStream() << new ByteArrayInputStream(file.getBytes())
 
    }
    def idUpload
    def cargaArchivos(){
        println ":::::::::::::::cargaArchivos::::::$params"
        idUpload=params.id
      
        render (template: "cargaArchivos")
    }

     def guardarSolucion(){
        println "::::::::::::::::::::$params"
        def id=params.id
         def incidente=incidenteService.cambiarEstatus(4,id)
       def date = new Date()
       incidente.fechaAtencion = new Date()
        incidente.solucion=params.solucion
        redirect(contoller:"incidente", action:"index")
    }
    
    def atender(){
        println "::::::::::::::::::::$params"
        def id=params.id
        return[id:id]
        render (view: "atender")
    }
  
    def upload(){ 
        println "::::::::::::::::::::173:$params"
        def archivos = []
        def mapa 
        int i=0
      def id=idUpload
        def uploadedFile = request.getFiles('file')
        println "::::::::::177"+uploadedFile
        for (def values: uploadedFile){
            println "::::::::::::::"+values
            InputStream inputStream = values.inputStream
            mapa = [:]
            mapa.archivo = inputStream
            mapa.nombreDelArchivo =values.originalFilename
            //mapa.extension = fileLabel.toLowerCase()
            archivos << mapa
            println "Archivos::0::::."+archivos
            def archivo = archivos.getAt(i)
            println archivo.nombreDelArchivo
                
            def documento = new Documento ()
            documento.incidente = Incidente.get(id as long)
            
            def nombre="Achivo_Incidente_"+id+"_"+(archivo.nombreDelArchivo).toString()
            println "nombre archivo:::::::::::::::::"+nombre
            documento.nombre = nombre
            documento.fechaSubio = new Date ()
            documento.urlArchivo = "/var/documentos/" + nombre
            if(documento.save()){ println "se guardo"
                def fileOutputStream = new FileOutputStream(documento.urlArchivo)
                File file = new File(documento.urlArchivo)
                if (file.exists() || file.createNewFile()) {
                    file.withOutputStream{fos->
                        fos << archivo.archivo
                    }
                }   
            }
            else{
                if (documento.hasErrors()) {
                    documento.errors.allErrors.each {
                        println it
                    }
                }
           
            }
            i=i+1
        }
    
        redirect (controller: "incidente", action: "index")
    }
    
    
   
    def enviarEmail(){
        println "::::::::::$params"
        def incidente=Incidente.get(params.id as long)
        println "Incidente:::::::"+incidente
        def email=incidente.registradoPor.email
      
        def fechaRegis=incidente.fechaRegistro
        def fechaR=fechaRegis.format("'El día' EEEEEEEEE dd 'de' MMMMM 'del' yyyy     hh:mm a")
        
        def fechaAte=incidente.fechaAtencion
        def fechaA=fechaAte.format("'El día' EEEEEEEEE dd 'de' MMMMM 'del' yyyy     hh:mm a")
 
        def fechaCer=incidente.fechaCerrado
        def fechaC=fechaCer.format("'El día' EEEEEEEE dd 'de' MMMMM 'del' yyyy     hh:mm a")
        
        MailService.sendMail {
            to email
            multipart true
            from "neli1124.sc@gmail.com"
            subject "Detalle de incidente cerrado"
            html "<h1>incidente con folio $incidente.folio </h1>\n\
                <div><label><em><strong>Tema:</strong></label><p>$incidente.tema</p></em></div>\n\
                <div><label><em><strong>Fecha de registro:</strong></label><p>$fechaR</p></em></div>\n\
                <div><label><em><strong>Lo atendió:</strong></label><p>$incidente.asignadoA</p></em></div>\n\
                <div><label><em><strong>Fecha de atención:</strong></label><p>$fechaA</p></em></div>\n\
               <div><label><em><strong>Solución:</strong></label><p>$incidente.solucion</p></em></div>\n\
                <div><label><em><strong>Se finalizó el incidente:</strong></label><p>$fechaC</p></em></div>"
            flash.message = "Correo enviado con éxito"
            incidente.envioCorreo=true
            chain(controller:"incidente", action:"index")
        }
        
    }
    
    def printReport(){
        println params
        def mapa = []
        def datos= Incidente.get(params.id as long)
        def respuesta = [:]
        respuesta.folio=datos.folio
        respuesta.estatus=datos.estatus
        respuesta.tema=datos.tema
        respuesta.fechaAtencion=datos.fechaAtencion
        respuesta.descripcion= datos.descripcion
        respuesta.fechaRegistro=datos.fechaRegistro
        def usuario=Usuario.findByUsername(datos.registradoPor.username)
        respuesta.registradoPor= usuario.nombre+" "+usuario.apellidoPat+" "+usuario.apellidoMat
        def usuarioAsi=Usuario.findByUsername(datos.asignadoA.username)
        respuesta.asignadoA=usuarioAsi.nombre+" "+usuarioAsi.apellidoPat+" "+usuarioAsi.apellidoMat
        respuesta.solucion=datos.solucion
        mapa<<respuesta
        println mapa
        params._format="PDF"
     
      
        chain(controller:"jasper",action:"index",model:[data:mapa], params :params)
     
    }
    
    
    def enviarComentario(){
        println "comentarios::::::::....$params"
        
        def b =  incidenteService.cambiarEstatus(3,params.id)
        println "::::::::::::b$b"
        def us = springSecurityService.currentUser.username
        def comentario = new Comentario()
        comentario.incidente =b
        comentario.descripcion=params.comentario
        comentario.usuario=Usuario.findByUsername(us)
        comentario.fechaComentario = new Date()
        comentario.save()
        println "incidente:::enviarComentario:::::::::::::..."+b
        render "Comentario enviado con éxito"
    }
    
   def alert(){
       render (view:"alert")
   }
}
