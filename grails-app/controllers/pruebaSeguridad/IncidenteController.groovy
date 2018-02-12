package pruebaSeguridad



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.plugins.jasper.JasperExportFormat
import org.codehaus.groovy.grails.plugins.jasper.JasperReportDef

@Transactional//(readOnly = true)
class IncidenteController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    
    def springSecurityService
    def incidenteService
    static final  int i=0
    def flujoController
   
    def index(Integer max) {
        
        params.max = Math.min(max ?: 10, 100)
        respond Incidente.list(params), model:[incidenteInstanceCount: Incidente.count()]
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
        
        println "paramssssssssss 90::::::::::$params"
        //Recuperar id del flujo con la relacion id_incidente
        def res= Flujo.findByIncidente(Incidente.get(params.id))
          
        println "flujo:::::::::::::::::"+res
        if (incidenteInstance == null) {
            notFound()
            return
        }
        
        res.delete flush:true

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
           
        data.incidentes = incidenteService.obtenerIncidentes("SinAsignar" , "ROLE_CLIENTE")
        data.usuarios = incidenteService.obtenerUsuarios("ROLE_DESARROLLADOR")
        println "D A T A :::::::::::::::::::::::::::"+data
        render (view:"asignar", model: [detalle: data])
        
    }
    def asignarIncidente (){
        
        def incidente = Incidente.get(params.incidente as long)
        println "incidente"+incidente
        incidente.asignadoA = Usuario.get(params.asignadoA as long )
        incidente.estatus = Estatus.get(2 as int)
        incidente.fechaAsignacion = new Date()
        println "incidente"+incidente
        incidente.save flush:true
        def gf = incidenteService.guardarFlujo(springSecurityService.currentUser.username,2,incidente)
        redirect (action: "index")
     
    }
    
    def crearUsuarios(){
        redirect(controller: "usuario", action: "create")
    }
    
    def listarAsignados(){
        def incidentes = incidenteService.obtenerIncidentes("Asignados","ROLE_DESARROLLADOR")
        println "/////////////////////////////   " + incidentes 
        render (view:"index", model: [asignados: incidentes])
    }
    
    def detalleRevisar(){
        def respuesta = Incidente.get(params.id as long )
        render (view:"detalleRevisar", model: [detalle: respuesta])
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
}
