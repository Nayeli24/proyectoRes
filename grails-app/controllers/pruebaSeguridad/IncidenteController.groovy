package pruebaSeguridad



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
        respond incidenteInstance
    }

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
        incidenteInstance.save flush:true
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
        def usuario=Usuario.findByNombre(params.asignadoA)
        println "usuario________"+usuario.nombre
        def lista=[]
        lista=params.incidente
        for( i in lista){
            println ":::::::::::::"+i

            lista.each{
                def incident=Incidente.findByTema(it)
                println "incidente:::::::::::"+incident
                incident.asignadoA =Usuario.findByNombre(params.asignadoA)
                incident.estatus = Estatus.get(2 as int)
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
        incidente.fechaCerrado=new Date()
        def gf = incidenteService.guardarFlujo(springSecurityService.currentUser.username,estatus,consulta)
        println "incidente:......::::..."+incidente
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
   
    def upload(){ 
        println "::::::::::::::::::::173:$params"
        def archivos = []
        def mapa 
        int i=0
        def id=params.id
        def incidente=incidenteService.cambiarEstatus(4,id)
        incidente.fechaAtencion=new Date()
        incidente.solucion=params.solucion
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
          
            def archivo = archivos.getAt(i)
            println archivo.nombreDelArchivo
                
            def documento = new Documento ()
            documento.incidente = incidente
            
            def nombre="Achivo_Incidente_"+params.id+"_"+(archivo.nombreDelArchivo).toString()
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
    
    
    def atender(){
        println "::::::::::::::::::::$params"
        def id=params.id
        return ["id":id]
        render (view: "atender")
    }
       
   
    
    def enviarEmail(){
        println "::::::::::$params"
        def incidente=Incidente.get(params.id as long)
        println "Incidente:::::::"+incidente
        def email=incidente.registradoPor.email
       
        MailService.sendMail {
            to email
            multipart true
            from "neli1124.sc@gmail.com"
            subject "Detalle de incidente cerrado"
            html "<h1>incidente con folio $incidente.folio </h1>\n\
                <div><label><em><strong>Tema:</strong></label><p>$incidente.tema</p></em></div>\n\
                <div><label><em><strong>Fecha de registro:</strong></label><p>$incidente.fechaRegistro</p></em></div>\n\
                <div><label><em><strong>Lo atendió:</strong></label><p>$incidente.asignadoA</p></em></div>\n\
                <div><label><em><strong>Fecha de atención:</strong></label><p>$incidente.fechaAtencion</p></em></div>\n\
               <div><label><em><strong>Solución:</strong></label><p>$incidente.solucion</p></em></div>\n\
                <div><label><em><strong>Se finalizó el incidente:</strong></label><p>$incidente.fechaCerrado</p></em></div>"
            flash.message = "some message"
            chain(controller:"incidente", action:"index")
        }
        incidente.envioCorreo=true
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
        respuesta.registradoPor=Usuario.findByUsername(datos.registradoPor.username)
        respuesta.asignadoA=Usuario.findByUsername(datos.asignadoA.username)
        respuesta.solucion=datos.solucion
        respuesta.fechaCerrado=datos.fechaCerrado
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
    
        
        redirect(controller: "comentario", action: "index", id: params.id)
        //        render "El incidente con id ${b.id} se envió correctamente."
    }
    
    
}
