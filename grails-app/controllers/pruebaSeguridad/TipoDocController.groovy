package pruebaSeguridad



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TipoDocController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TipoDoc.list(params), model:[tipoDocInstanceCount: TipoDoc.count()]
    }

    def show(TipoDoc tipoDocInstance) {
        respond tipoDocInstance
    }

    def create() {
        respond new TipoDoc(params)
    }

    @Transactional
    def save(TipoDoc tipoDocInstance) {
        if (tipoDocInstance == null) {
            notFound()
            return
        }

        if (tipoDocInstance.hasErrors()) {
            respond tipoDocInstance.errors, view:'create'
            return
        }

        tipoDocInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tipoDoc.label', default: 'TipoDoc'), tipoDocInstance.id])
                redirect tipoDocInstance
            }
            '*' { respond tipoDocInstance, [status: CREATED] }
        }
    }

    def edit(TipoDoc tipoDocInstance) {
        respond tipoDocInstance
    }

    @Transactional
    def update(TipoDoc tipoDocInstance) {
        if (tipoDocInstance == null) {
            notFound()
            return
        }

        if (tipoDocInstance.hasErrors()) {
            respond tipoDocInstance.errors, view:'edit'
            return
        }

        tipoDocInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TipoDoc.label', default: 'TipoDoc'), tipoDocInstance.id])
                redirect tipoDocInstance
            }
            '*'{ respond tipoDocInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TipoDoc tipoDocInstance) {

        if (tipoDocInstance == null) {
            notFound()
            return
        }

        tipoDocInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TipoDoc.label', default: 'TipoDoc'), tipoDocInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoDoc.label', default: 'TipoDoc'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
