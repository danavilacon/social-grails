package grails.plugin.wschat



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ChatUserProfileController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ChatUserProfile.list(params), model:[chatUserProfileInstanceCount: ChatUserProfile.count()]
    }

    def show(ChatUserProfile chatUserProfileInstance) {
        respond chatUserProfileInstance
    }

    def create() {
        respond new ChatUserProfile(params)
    }

    @Transactional
    def save(ChatUserProfile chatUserProfileInstance) {
        if (chatUserProfileInstance == null) {
            notFound()
            return
        }

        if (chatUserProfileInstance.hasErrors()) {
            respond chatUserProfileInstance.errors, view:'create'
            return
        }

        chatUserProfileInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'chatUserProfile.label', default: 'ChatUserProfile'), chatUserProfileInstance.id])
                redirect chatUserProfileInstance
            }
            '*' { respond chatUserProfileInstance, [status: CREATED] }
        }
    }

    def edit(ChatUserProfile chatUserProfileInstance) {
        respond chatUserProfileInstance
    }

    @Transactional
    def update(ChatUserProfile chatUserProfileInstance) {
        if (chatUserProfileInstance == null) {
            notFound()
            return
        }

        if (chatUserProfileInstance.hasErrors()) {
            respond chatUserProfileInstance.errors, view:'edit'
            return
        }

        chatUserProfileInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ChatUserProfile.label', default: 'ChatUserProfile'), chatUserProfileInstance.id])
                redirect chatUserProfileInstance
            }
            '*'{ respond chatUserProfileInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ChatUserProfile chatUserProfileInstance) {

        if (chatUserProfileInstance == null) {
            notFound()
            return
        }

        chatUserProfileInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ChatUserProfile.label', default: 'ChatUserProfile'), chatUserProfileInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'chatUserProfile.label', default: 'ChatUserProfile'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
