package grails.plugin.wschat



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ChatMessageController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ChatMessage.list(params), model:[chatMessageInstanceCount: ChatMessage.count()]
    }

    def show(ChatMessage chatMessageInstance) {
        respond chatMessageInstance
    }

    def create() {
        respond new ChatMessage(params)
    }

    @Transactional
    def save(ChatMessage chatMessageInstance) {
        if (chatMessageInstance == null) {
            notFound()
            return
        }

        if (chatMessageInstance.hasErrors()) {
            respond chatMessageInstance.errors, view:'create'
            return
        }

        chatMessageInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'chatMessage.label', default: 'ChatMessage'), chatMessageInstance.id])
                redirect chatMessageInstance
            }
            '*' { respond chatMessageInstance, [status: CREATED] }
        }
    }

    def edit(ChatMessage chatMessageInstance) {
        respond chatMessageInstance
    }

    @Transactional
    def update(ChatMessage chatMessageInstance) {
        if (chatMessageInstance == null) {
            notFound()
            return
        }

        if (chatMessageInstance.hasErrors()) {
            respond chatMessageInstance.errors, view:'edit'
            return
        }

        chatMessageInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ChatMessage.label', default: 'ChatMessage'), chatMessageInstance.id])
                redirect chatMessageInstance
            }
            '*'{ respond chatMessageInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ChatMessage chatMessageInstance) {

        if (chatMessageInstance == null) {
            notFound()
            return
        }

        chatMessageInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ChatMessage.label', default: 'ChatMessage'), chatMessageInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'chatMessage.label', default: 'ChatMessage'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
