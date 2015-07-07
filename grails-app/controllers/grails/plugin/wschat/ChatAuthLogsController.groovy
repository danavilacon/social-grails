package grails.plugin.wschat



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ChatAuthLogsController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ChatAuthLogs.list(params), model:[chatAuthLogsInstanceCount: ChatAuthLogs.count()]
    }

    def show(ChatAuthLogs chatAuthLogsInstance) {
        respond chatAuthLogsInstance
    }

    def create() {
        respond new ChatAuthLogs(params)
    }

    @Transactional
    def save(ChatAuthLogs chatAuthLogsInstance) {
        if (chatAuthLogsInstance == null) {
            notFound()
            return
        }

        if (chatAuthLogsInstance.hasErrors()) {
            respond chatAuthLogsInstance.errors, view:'create'
            return
        }

        chatAuthLogsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'chatAuthLogs.label', default: 'ChatAuthLogs'), chatAuthLogsInstance.id])
                redirect chatAuthLogsInstance
            }
            '*' { respond chatAuthLogsInstance, [status: CREATED] }
        }
    }

    def edit(ChatAuthLogs chatAuthLogsInstance) {
        respond chatAuthLogsInstance
    }

    @Transactional
    def update(ChatAuthLogs chatAuthLogsInstance) {
        if (chatAuthLogsInstance == null) {
            notFound()
            return
        }

        if (chatAuthLogsInstance.hasErrors()) {
            respond chatAuthLogsInstance.errors, view:'edit'
            return
        }

        chatAuthLogsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ChatAuthLogs.label', default: 'ChatAuthLogs'), chatAuthLogsInstance.id])
                redirect chatAuthLogsInstance
            }
            '*'{ respond chatAuthLogsInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ChatAuthLogs chatAuthLogsInstance) {

        if (chatAuthLogsInstance == null) {
            notFound()
            return
        }

        chatAuthLogsInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ChatAuthLogs.label', default: 'ChatAuthLogs'), chatAuthLogsInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'chatAuthLogs.label', default: 'ChatAuthLogs'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
