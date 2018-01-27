package pruebaSeguridad



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class FlujoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Flujo.list(params), model:[flujoInstanceCount: Flujo.count()]
    }

    def show(Flujo flujoInstance) {
        respond flujoInstance
    }

    def create() {
        respond new Flujo(params)
    }

    @Transactional
    def save(Flujo flujoInstance) {
        if (flujoInstance == null) {
            notFound()
            return
        }

        if (flujoInstance.hasErrors()) {
            respond flujoInstance.errors, view:'create'
            return
        }

        flujoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'flujo.label', default: 'Flujo'), flujoInstance.id])
                redirect flujoInstance
            }
            '*' { respond flujoInstance, [status: CREATED] }
        }
    }

    def edit(Flujo flujoInstance) {
        respond flujoInstance
    }

    @Transactional
    def update(Flujo flujoInstance) {
        if (flujoInstance == null) {
            notFound()
            return
        }

        if (flujoInstance.hasErrors()) {
            respond flujoInstance.errors, view:'edit'
            return
        }

        flujoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Flujo.label', default: 'Flujo'), flujoInstance.id])
                redirect flujoInstance
            }
            '*'{ respond flujoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Flujo flujoInstance) {

        if (flujoInstance == null) {
            notFound()
            return
        }

        flujoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Flujo.label', default: 'Flujo'), flujoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'flujo.label', default: 'Flujo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
