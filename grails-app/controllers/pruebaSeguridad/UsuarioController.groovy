package pruebaSeguridad



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import java.util.StringTokenizer;

@Transactional//(readOnly = true)
class UsuarioController {
    def springSecurityService
   
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def usuarioService
    def index(Integer max) {
       
        params.max = Math.min(max ?: 10, 100)
        def usuario=usuarioService.usuarioId()
        render (view:"usuariosList", model: [usuarios: usuario])

    }

    def show(Usuario usuarioInstance) {
        respond usuarioInstance
               
    }

    def create() {
        def data = [:]
        data.empresas= usuarioService.obtenerEmpresas()
        data.id= usuarioService.ultimoRegistro()  
        
        println ";;;;;;;;;;;;;;;;$data"
        render (view:"create", model: [detalle: data])              
    }

     @Transactional
    def save(Usuario usuarioInstance) {
        println params
        if (usuarioInstance == null) {
            notFound()
            return
        }

        if (usuarioInstance.hasErrors()) {
            respond usuarioInstance.errors, view:'create'
            return
        }
        
        usuarioInstance.enabled=true;
        usuarioInstance.accountLocked=false;
        def arreglo=params.areaDpto
        if(arreglo.size()==2){
            if(arreglo[0] =="Otro"){
                usuarioInstance.areaDpto=arreglo[1]
            }else{
                usuarioInstance.areaDpto=arreglo[0]
            }
        }
               
        usuarioInstance.save()
       
        for (roleId in params.list('rolUsuario')){
                println "roleeeeeeeeeeeeeee"+roleId
            Role r = Role.get(roleId)
            UsuarioRole.create(usuarioInstance, r,true)
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
    
    
    def usuarioLog() {
        def usuario=usuarioService.usuarioLog(springSecurityService.currentUser.username)
        println "recibe controler usuario dfdfsdfdsfdsfdsfdsfdsfdsdf" +usuario
        render (view:"usuariolog", model: [usuario: usuario])
    }

    @Transactional
    def update(Usuario usuarioInstance) {
        println "update deeee------------------------------------------$params"
        if (usuarioInstance == null) {
            notFound()
            return
        }

        if (usuarioInstance.hasErrors()) {
            respond usuarioInstance.errors, view:'edit'
            return
        }
        usuarioInstance.areaDpto=params.areaDpto     
        usuarioInstance.save()
        UsuarioRole.removeAll(usuarioInstance)
       
        for (roleId in params.list('rolUsuario')){
            Role r = Role.get(roleId)
            UsuarioRole.create(usuarioInstance, r,true)
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
        //Recuperar id_usuarioRole del con la relacion id_usuario
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

