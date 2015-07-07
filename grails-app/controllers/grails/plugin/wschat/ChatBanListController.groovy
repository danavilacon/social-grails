package grails.plugin.wschat



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ChatBanListController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ChatBanList.list(params), model:[chatBanListInstanceCount: ChatBanList.count()]
    }

    def show(ChatBanList chatBanListInstance) {
        respond chatBanListInstance
    }

    def create() {
        respond new ChatBanList(params)
    }

    @Transactional
    def save(ChatBanList chatBanListInstance) {
        if (chatBanListInstance == null) {
            notFound()
            return
        }

        if (chatBanListInstance.hasErrors()) {
            respond chatBanListInstance.errors, view:'create'
            return
        }

        chatBanListInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'chatBanList.label', default: 'ChatBanList'), chatBanListInstance.id])
                redirect chatBanListInstance
            }
            '*' { respond chatBanListInstance, [status: CREATED] }
        }
    }

    def edit(ChatBanList chatBanListInstance) {
        respond chatBanListInstance
    }

    @Transactional
    def update(ChatBanList chatBanListInstance) {
        if (chatBanListInstance == null) {
            notFound()
            return
        }

        if (chatBanListInstance.hasErrors()) {
            respond chatBanListInstance.errors, view:'edit'
            return
        }

        chatBanListInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ChatBanList.label', default: 'ChatBanList'), chatBanListInstance.id])
                redirect chatBanListInstance
            }
            '*'{ respond chatBanListInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ChatBanList chatBanListInstance) {

        if (chatBanListInstance == null) {
            notFound()
            return
        }

        chatBanListInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ChatBanList.label', default: 'ChatBanList'), chatBanListInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'chatBanList.label', default: 'ChatBanList'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
