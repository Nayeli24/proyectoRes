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
        incidenteInstance.save flush:true
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
    def asignarIncidente (Incidente incidenteInstance){
        println ":::::asignar incidente::::::::::::::$params.asignadoA"
        def usuario=Usuario.findByNombre(params.asignadoA)
        println "usuario________"+usuario
        if(params.incidente.size()>1){
            for(def i in params.incidente){
                println ":::::::::::::"+i
                def incident=Incidente.findByTema(i)
                incident.asignadoA = usuario
                incident.estatus = Estatus.get(2 as int)
                incident.fechaAsignacion = new Date()
                incident.save flush:true
                def gf = incidenteService.guardarFlujo(springSecurityService.currentUser.username,2,incident)
            }
        }
    
        
        redirect (action: "index")
    }
    
    
    
    def cerrarIncidente (Incidente incidenteInstance){
      
        incidenteInstance.estatus = Estatus.get(5 as int)
     
        println "incidente"+incidenteInstance
        incidenteInstance.save flush:true
        def gf = incidenteService.guardarFlujo(springSecurityService.currentUser.username,5,incidenteInstance)
        redirect (action: "index")
     
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
    
    def upload(Incidente incidenteInstance){ 
        println "::::::::::::::::::::173:$params"
        def archivos = []
        def mapa 
        int i=0
        def id=params.id
        def inc=incidenteService.incidente(id)
        def solucion=params.solucion
        incidenteInstance.estatus = Estatus.get(4 as int)
        incidenteInstance.solucion=solucion
        incidenteInstance.save flush:true
        println ":::::::::::::::::"+solucion
      
    
 
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
            documento.incidente = Incidente.get(inc.id_incidente)
            
            def nombre="Achivo_Incidente_"+params.id+"_"+(archivo.nombreDelArchivo).toString()
            println "nombre archivo:::::::::::::::::"+nombre
            documento.nombre = nombre
            documento.fechaSubio = new Date ()
            documento.urlArchivo = "/var/documentos/" + nombre
            if(documento.save(flush:true)){ println "se guardo"
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
        def gf = incidenteService.guardarFlujo(springSecurityService.currentUser.username,4,incidenteInstance)
        render (view: "index")
    }
    
    
    def atender(){
        println "::::::::::::::::::::$params"
        def id=params.id
        return ["id":id]
        render (view: "atender")
    }
       
    def revisar(Incidente incidenteInstance){
        println "::::::::::::::::::::::::::::|169$params"
        //def incidente = Incidente.get(params.incidente as long)
        incidenteInstance.estatus = Estatus.get(3 as int)
        def respuesta= Incidente.get(params.id as long)
        def id=respuesta.id
        println "id incidente::::::::::::::::::"+id
        incidenteInstance.save flush:true
        def gf = incidenteService.guardarFlujo(springSecurityService.currentUser.username,3,incidenteInstance)
        redirect (controller: "comentario", action: "create", params: [id:id])
    }
    
    def enviarEmail(){
        println "mail$params"
        def incidente=Incidente.get(params.id as long)
        def email=incidente.registradoPor.email
        MailService.sendMail {
            to email
            //  to "jonathan.g.o.itt@gmail.com"
            from "neli1124.sc@gmail.com"
            subject "Aquí va el asunto"
            html "Este es un correo de <b>ejemplo</b>"
            render "Correo enviado con éxito"
        }
    }
    
    def printReport(){
        println params
        def mapa = []
        def datos= Incidente.get(params.idIncidente as long)
        def respuesta = [:]
        respuesta.folio=datos.folio
        respuesta.estatus=datos.estatus
        respuesta.descripcion= datos.descripcion
        respuesta.fechaRegistro=datos.fechaRegistro
        respuesta.registradoPor=datos.registradoPor.username
        mapa<<respuesta
        println mapa
        params._format="PDF"
     
      
        chain(controller:"jasper",action:"index",model:[data:mapa], params :params)
     
    }
    
    
    def enviarComentario(){
        println "comentarios::::::::....$params"
        
        def b = Incidente.get( params.id )
        def us = springSecurityService.currentUser.username
        def comentario = new Comentario()
        comentario.incidente = b
        comentario.descripcion=params.comentario
        comentario.usuario=Usuario.findByUsername(us)
        comentario.fechaComentario = new Date()
        comentario.save flush:true
        println "incidente:::enviarComentario:::::::::::::..."+b
        b.estatus = Estatus.get(3 as int)
        b.save flush:true
        def gf = incidenteService.guardarFlujo(us,3,b)
        
        redirect(controller: "comentario", action: "index", id: params.id)
        //        render "El incidente con id ${b.id} se envió correctamente."
    }
    
    def welcome(){
        println "_:::::::::::::::::::::::311$params"
        render (view:"welcome") 
    }

    
    //    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    //    @ResponseBody
    //    public ResponseEntity<?> uploadFile(
    //        @RequestParam("uploadfile") MultipartFile uploadfile) {
    //  
    //        try {
    //            // Get the filename and build the local file path (be sure that the 
    //            // application have write permissions on such directory)
    //            String filename = uploadfile.getOriginalFilename();
    //            String directory = "/var/netgloo_blog/uploads";
    //            String filepath = Paths.get(directory, filename).toString();
    //    
    //            // Save the file locally
    //            BufferedOutputStream stream =
    //            new BufferedOutputStream(new FileOutputStream(new File(filepath)));
    //            stream.write(uploadfile.getBytes());
    //            stream.close();
    //        }
    //        catch (Exception e) {
    //            System.out.println(e.getMessage());
    //            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    //        }
    //  
    //        return new ResponseEntity<>(HttpStatus.OK);
    //    } // method uploadFile
    //    
    
}
