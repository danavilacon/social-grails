package grails.plugin.wschat



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ChatLogController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ChatLog.list(params), model:[chatLogInstanceCount: ChatLog.count()]
    }

    def show(ChatLog chatLogInstance) {
        respond chatLogInstance
    }

    def create() {
        respond new ChatLog(params)
    }

    @Transactional
    def save(ChatLog chatLogInstance) {
        if (chatLogInstance == null) {
            notFound()
            return
        }

        if (chatLogInstance.hasErrors()) {
            respond chatLogInstance.errors, view:'create'
            return
        }

        chatLogInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'chatLog.label', default: 'ChatLog'), chatLogInstance.id])
                redirect chatLogInstance
            }
            '*' { respond chatLogInstance, [status: CREATED] }
        }
    }

    def edit(ChatLog chatLogInstance) {
        respond chatLogInstance
    }

    @Transactional
    def update(ChatLog chatLogInstance) {
        if (chatLogInstance == null) {
            notFound()
            return
        }

        if (chatLogInstance.hasErrors()) {
            respond chatLogInstance.errors, view:'edit'
            return
        }

        chatLogInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ChatLog.label', default: 'ChatLog'), chatLogInstance.id])
                redirect chatLogInstance
            }
            '*'{ respond chatLogInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ChatLog chatLogInstance) {

        if (chatLogInstance == null) {
            notFound()
            return
        }

        chatLogInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ChatLog.label', default: 'ChatLog'), chatLogInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'chatLog.label', default: 'ChatLog'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
