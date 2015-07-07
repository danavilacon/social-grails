package grails.plugin.wschat



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ChatUserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ChatUser.list(params), model:[chatUserInstanceCount: ChatUser.count()]
    }

    def show(ChatUser chatUserInstance) {
        respond chatUserInstance
    }

    def create() {
        respond new ChatUser(params)
    }

    @Transactional
    def save(ChatUser chatUserInstance) {
        if (chatUserInstance == null) {
            notFound()
            return
        }

        if (chatUserInstance.hasErrors()) {
            respond chatUserInstance.errors, view:'create'
            return
        }

        chatUserInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'chatUser.label', default: 'ChatUser'), chatUserInstance.id])
                redirect chatUserInstance
            }
            '*' { respond chatUserInstance, [status: CREATED] }
        }
    }

    def edit(ChatUser chatUserInstance) {
        respond chatUserInstance
    }

    @Transactional
    def update(ChatUser chatUserInstance) {
        if (chatUserInstance == null) {
            notFound()
            return
        }

        if (chatUserInstance.hasErrors()) {
            respond chatUserInstance.errors, view:'edit'
            return
        }

        chatUserInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ChatUser.label', default: 'ChatUser'), chatUserInstance.id])
                redirect chatUserInstance
            }
            '*'{ respond chatUserInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ChatUser chatUserInstance) {

        if (chatUserInstance == null) {
            notFound()
            return
        }

        chatUserInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ChatUser.label', default: 'ChatUser'), chatUserInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'chatUser.label', default: 'ChatUser'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
