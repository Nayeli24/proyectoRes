package pruebaSeguridad



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import java.io.File

@Transactional(readOnly = true)
class DocumentoController {
    def documentoService
    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
  
    def index(Integer max) {
        println "documento index::::::::::::::::::::$params"
        params.max = Math.min(max ?: 10, 100)
        // respond Comentario.list(params), model:[comentarioInstanceCount: Comentario.count()]
        def documentos=documentoService.listarDocumentos(params.id)
        def id= params.id
 
        
        render (template:"docList", model: [documentosVer: documentos, documentosCount: documentos.size(), id:id])
    }

    def show(Documento documentoInstance) {
        respond documentoInstance
    }

    def importarArchivos () {
        println ":::::::;;;24 documento Controller:::$params"
        def fileNames = request.getFileNames()
        def archivo= request.getFile(fileNames)
        def webRootDir = servletContext.getRealPath("/")
        def userDir = new File(webRootDir, "/cargaArchivos")
        userDir.mkdirs()
        println "::::::::::::::::34"+userDir
        archivo.transferTo( new File( userDir, archivo.originalFilename))
        String file=userDir.toString()+ File.separator + archivo.originalFilename
        ArrayList nomArchivo=new ArrayList()
        nomArchivo.add(archivo.originalFilename)
        render (view:'importarArchivos', model:[nomArchivo:nomArchivo])
    }
    
    
    def contarDocumentos(){
       println "comentariov  $params"
       def id=params.id
       def respuesta
            def contador = Documento.countByIncidente(Incidente.get(id))
            println "contador $contador"
            if (contador==null){
                respuesta= 0
            }else{
                respuesta= contador
            }
        println "docuemntos:::::.....Controller"+ respuesta
        render respuesta as String
 
    }
    
    
    def create() {
        
        params.incidente=params.id
       
        respond new Documento(params)
    }

    @Transactional
    def save(Documento documentoInstance) {
        println "52::::::::::::::::::::::::$params"
        if (documentoInstance == null) {
            notFound()
            return
        }

        if (documentoInstance.hasErrors()) {
            respond documentoInstance.errors, view:'create'
            return
        }
        def us = springSecurityService.currentUser.username
        println us
        documentoInstance.usuario = Usuario.findByUsername(us)
        documentoInstance.save()

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'documento.label', default: 'Documento'), documentoInstance.id])
                redirect documentoInstance
            }
            '*' { respond documentoInstance, [status: CREATED] }
        }
    }

    def edit(Documento documentoInstance) {
        respond documentoInstance
    }

    @Transactional
    def update(Documento documentoInstance) {
        if (documentoInstance == null) {
            notFound()
            return
        }

        if (documentoInstance.hasErrors()) {
            respond documentoInstance.errors, view:'edit'
            return
        }

        documentoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Documento.label', default: 'Documento'), documentoInstance.id])
                redirect documentoInstance
            }
            '*'{ respond documentoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Documento documentoInstance) {
        println "params::::::::.documeneto delete :$params"
        if (documentoInstance == null) {
            notFound()
            return
        }

        documentoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Documento.label', default: 'Documento'), documentoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'documento.label', default: 'Documento'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
