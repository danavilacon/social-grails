package grails.plugin.wschat



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class OffLineMessageController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond OffLineMessage.list(params), model:[offLineMessageInstanceCount: OffLineMessage.count()]
    }

    def show(OffLineMessage offLineMessageInstance) {
        respond offLineMessageInstance
    }

    def create() {
        respond new OffLineMessage(params)
    }

    @Transactional
    def save(OffLineMessage offLineMessageInstance) {
        if (offLineMessageInstance == null) {
            notFound()
            return
        }

        if (offLineMessageInstance.hasErrors()) {
            respond offLineMessageInstance.errors, view:'create'
            return
        }

        offLineMessageInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'offLineMessage.label', default: 'OffLineMessage'), offLineMessageInstance.id])
                redirect offLineMessageInstance
            }
            '*' { respond offLineMessageInstance, [status: CREATED] }
        }
    }

    def edit(OffLineMessage offLineMessageInstance) {
        respond offLineMessageInstance
    }

    @Transactional
    def update(OffLineMessage offLineMessageInstance) {
        if (offLineMessageInstance == null) {
            notFound()
            return
        }

        if (offLineMessageInstance.hasErrors()) {
            respond offLineMessageInstance.errors, view:'edit'
            return
        }

        offLineMessageInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'OffLineMessage.label', default: 'OffLineMessage'), offLineMessageInstance.id])
                redirect offLineMessageInstance
            }
            '*'{ respond offLineMessageInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(OffLineMessage offLineMessageInstance) {

        if (offLineMessageInstance == null) {
            notFound()
            return
        }

        offLineMessageInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'OffLineMessage.label', default: 'OffLineMessage'), offLineMessageInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'offLineMessage.label', default: 'OffLineMessage'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
