package pruebaSeguridad



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UsuarioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def usuarioService
    def index(Integer max) {
       
        params.max = Math.min(max ?: 10, 100)
     
        respond Usuario.list(params), model:[usuarioInstanceCount: Usuario.count()] 
        
        //        incidente.asignadoA = Usuario.get(params.asignadoA as long )
        //        incidente.estatus = Estatus.get(2 as int)
        //        incidente.fechaAsignacion = new Date()
        //        println "incidente"+incidente
        //        incidente.save flush:true
        def usuario=usuarioService.usuarioId(Usuario.list(params.username))
        println "fbbvbbvvvbnvbnvbn.....Controller"+ usuario
       
    }

    def show(Usuario usuarioInstance) {
        respond usuarioInstance
               
    }

    def create() {
        respond new Usuario(params)
        
    }

    @Transactional
    def save(Usuario usuarioInstance) {
        if (usuarioInstance == null) {
            notFound()
            return
        }

        if (usuarioInstance.hasErrors()) {
            respond usuarioInstance.errors, view:'create'
            return
        }
        usuarioInstance.save flush:true

        
        println params
        def rolUsuario=params.rolUsuario
        println rolUsuario
        def  clienteRole=Role.findByAuthority('ROLE_CLIENTE')
        def  userRole=Role.findByAuthority('ROLE_DESARROLLADOR')
        println rolUsuario
        if(params.rolUsuario=="cliente"){ 
            println rolUsuario
            println clienteRole
            UsuarioRole.create (usuarioInstance, clienteRole, true)
          
        }else if(params.rolUsuario=="empleado"){
            UsuarioRole.create (usuarioInstance, userRole, true)
            
        }
       
     

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.id])
                redirect usuarioInstance
            }
            '*' { respond usuarioInstance, [status: CREATED] }
        }
    }

    def edit(Usuario usuarioInstance) {
        respond usuarioInstance
    }

    @Transactional
    def update(Usuario usuarioInstance) {
        if (usuarioInstance == null) {
            notFound()
            return
        }

        if (usuarioInstance.hasErrors()) {
            respond usuarioInstance.errors, view:'edit'
            return
        }

        usuarioInstance.save flush:true
        def rolUsuario=UsuarioRole.findByUsuario(Usuario.get(params.id))
        println rolUsuario
        def  clienteRole=Role.findByAuthority('ROLE_CLIENTE')
        def  userRole=Role.findByAuthority('ROLE_DESARROLLADOR')
        println rolUsuario
        if(params.rolUsuario=="cliente"){ 
            println rolUsuario
            println clienteRole
            UsuarioRole.create (usuarioInstance, clienteRole, true)
        }else if(params.rolUsuario=="empleado"){
            UsuarioRole.create (usuarioInstance, userRole, true)
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Usuario.label', default: 'Usuario'), usuarioInstance.id])
                redirect usuarioInstance
            }
            '*'{ respond usuarioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Usuario usuarioInstance) {
        println "paramssssssssss 101::::::::::$params"
        //Recuperar id del flujo con la relacion id_incidente
        def res= UsuarioRole.findByUsuario(Usuario.get(params.id))
        println res

        if (usuarioInstance == null) {
            notFound()
            return
        }

        res.delete flush:true
        usuarioInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Usuario.label', default: 'Usuario'), usuarioInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
