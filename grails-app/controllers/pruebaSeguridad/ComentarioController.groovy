package pruebaSeguridad



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ComentarioController {
      def springSecurityService
      def comentarioService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        println "cometario index::::::::::::::::::::$params"
        params.max = Math.min(max ?: 10, 100)
       // respond Comentario.list(params), model:[comentarioInstanceCount: Comentario.count()]
        def comentarios=comentarioService.listarComentarios(params.id)
        def id= params.id
        println "Comentarios:::::.....Controller"+ comentarios
        render (view:"index", model: [comentariosVer: comentarios, comentarioInstanceCount: comentarios.size(), id:id])
    }

    def show(Comentario comentarioInstance) {
        respond comentarioInstance
    }

    def create() {
        params.incidente=params.id
        
        respond new Comentario(params)
    }

    @Transactional
    def save(Comentario comentarioInstance) {
        if (comentarioInstance == null) {
            notFound()
            return
        }

        if (comentarioInstance.hasErrors()) {
            respond comentarioInstance.errors, view:'create'
            return
        }
        
        def us = springSecurityService.currentUser.username
        println us
        comentarioInstance.usuario = Usuario.findByUsername(us)
        comentarioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'comentario.label', default: 'Comentario'), comentarioInstance.id])
                redirect comentarioInstance
            }
            '*' { respond comentarioInstance, [status: CREATED] }
        }
    }

    def edit(Comentario comentarioInstance) {
        respond comentarioInstance
    }

    @Transactional
    def update(Comentario comentarioInstance) {
        if (comentarioInstance == null) {
            notFound()
            return
        }

        if (comentarioInstance.hasErrors()) {
            respond comentarioInstance.errors, view:'edit'
            return
        }

        comentarioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Comentario.label', default: 'Comentario'), comentarioInstance.id])
                redirect comentarioInstance
            }
            '*'{ respond comentarioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Comentario comentarioInstance) {

        if (comentarioInstance == null) {
            notFound()
            return
        }

        comentarioInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Comentario.label', default: 'Comentario'), comentarioInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'comentario.label', default: 'Comentario'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
