package grails.plugin.wschat



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ChatBookingInvitesController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ChatBookingInvites.list(params), model:[chatBookingInvitesInstanceCount: ChatBookingInvites.count()]
    }

    def show(ChatBookingInvites chatBookingInvitesInstance) {
        respond chatBookingInvitesInstance
    }

    def create() {
        respond new ChatBookingInvites(params)
    }

    @Transactional
    def save(ChatBookingInvites chatBookingInvitesInstance) {
        if (chatBookingInvitesInstance == null) {
            notFound()
            return
        }

        if (chatBookingInvitesInstance.hasErrors()) {
            respond chatBookingInvitesInstance.errors, view:'create'
            return
        }

        chatBookingInvitesInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'chatBookingInvites.label', default: 'ChatBookingInvites'), chatBookingInvitesInstance.id])
                redirect chatBookingInvitesInstance
            }
            '*' { respond chatBookingInvitesInstance, [status: CREATED] }
        }
    }

    def edit(ChatBookingInvites chatBookingInvitesInstance) {
        respond chatBookingInvitesInstance
    }

    @Transactional
    def update(ChatBookingInvites chatBookingInvitesInstance) {
        if (chatBookingInvitesInstance == null) {
            notFound()
            return
        }

        if (chatBookingInvitesInstance.hasErrors()) {
            respond chatBookingInvitesInstance.errors, view:'edit'
            return
        }

        chatBookingInvitesInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ChatBookingInvites.label', default: 'ChatBookingInvites'), chatBookingInvitesInstance.id])
                redirect chatBookingInvitesInstance
            }
            '*'{ respond chatBookingInvitesInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ChatBookingInvites chatBookingInvitesInstance) {

        if (chatBookingInvitesInstance == null) {
            notFound()
            return
        }

        chatBookingInvitesInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ChatBookingInvites.label', default: 'ChatBookingInvites'), chatBookingInvitesInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'chatBookingInvites.label', default: 'ChatBookingInvites'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
