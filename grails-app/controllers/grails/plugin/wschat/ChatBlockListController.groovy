package grails.plugin.wschat



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ChatBlockListController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ChatBlockList.list(params), model:[chatBlockListInstanceCount: ChatBlockList.count()]
    }

    def show(ChatBlockList chatBlockListInstance) {
        respond chatBlockListInstance
    }

    def create() {
        respond new ChatBlockList(params)
    }

    @Transactional
    def save(ChatBlockList chatBlockListInstance) {
        if (chatBlockListInstance == null) {
            notFound()
            return
        }

        if (chatBlockListInstance.hasErrors()) {
            respond chatBlockListInstance.errors, view:'create'
            return
        }

        chatBlockListInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'chatBlockList.label', default: 'ChatBlockList'), chatBlockListInstance.id])
                redirect chatBlockListInstance
            }
            '*' { respond chatBlockListInstance, [status: CREATED] }
        }
    }

    def edit(ChatBlockList chatBlockListInstance) {
        respond chatBlockListInstance
    }

    @Transactional
    def update(ChatBlockList chatBlockListInstance) {
        if (chatBlockListInstance == null) {
            notFound()
            return
        }

        if (chatBlockListInstance.hasErrors()) {
            respond chatBlockListInstance.errors, view:'edit'
            return
        }

        chatBlockListInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ChatBlockList.label', default: 'ChatBlockList'), chatBlockListInstance.id])
                redirect chatBlockListInstance
            }
            '*'{ respond chatBlockListInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ChatBlockList chatBlockListInstance) {

        if (chatBlockListInstance == null) {
            notFound()
            return
        }

        chatBlockListInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ChatBlockList.label', default: 'ChatBlockList'), chatBlockListInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'chatBlockList.label', default: 'ChatBlockList'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
