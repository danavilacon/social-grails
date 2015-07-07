package grails.plugin.wschat



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ChatBookingController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ChatBooking.list(params), model:[chatBookingInstanceCount: ChatBooking.count()]
    }

    def show(ChatBooking chatBookingInstance) {
        respond chatBookingInstance
    }

    def create() {
        respond new ChatBooking(params)
    }

    @Transactional
    def save(ChatBooking chatBookingInstance) {
        if (chatBookingInstance == null) {
            notFound()
            return
        }

        if (chatBookingInstance.hasErrors()) {
            respond chatBookingInstance.errors, view:'create'
            return
        }

        chatBookingInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'chatBooking.label', default: 'ChatBooking'), chatBookingInstance.id])
                redirect chatBookingInstance
            }
            '*' { respond chatBookingInstance, [status: CREATED] }
        }
    }

    def edit(ChatBooking chatBookingInstance) {
        respond chatBookingInstance
    }

    @Transactional
    def update(ChatBooking chatBookingInstance) {
        if (chatBookingInstance == null) {
            notFound()
            return
        }

        if (chatBookingInstance.hasErrors()) {
            respond chatBookingInstance.errors, view:'edit'
            return
        }

        chatBookingInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ChatBooking.label', default: 'ChatBooking'), chatBookingInstance.id])
                redirect chatBookingInstance
            }
            '*'{ respond chatBookingInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ChatBooking chatBookingInstance) {

        if (chatBookingInstance == null) {
            notFound()
            return
        }

        chatBookingInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ChatBooking.label', default: 'ChatBooking'), chatBookingInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'chatBooking.label', default: 'ChatBooking'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
