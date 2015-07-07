package grails.plugin.wschat



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ChatFriendListController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ChatFriendList.list(params), model:[chatFriendListInstanceCount: ChatFriendList.count()]
    }

    def show(ChatFriendList chatFriendListInstance) {
        respond chatFriendListInstance
    }

    def create() {
        respond new ChatFriendList(params)
    }

    @Transactional
    def save(ChatFriendList chatFriendListInstance) {
        if (chatFriendListInstance == null) {
            notFound()
            return
        }

        if (chatFriendListInstance.hasErrors()) {
            respond chatFriendListInstance.errors, view:'create'
            return
        }

        chatFriendListInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'chatFriendList.label', default: 'ChatFriendList'), chatFriendListInstance.id])
                redirect chatFriendListInstance
            }
            '*' { respond chatFriendListInstance, [status: CREATED] }
        }
    }

    def edit(ChatFriendList chatFriendListInstance) {
        respond chatFriendListInstance
    }

    @Transactional
    def update(ChatFriendList chatFriendListInstance) {
        if (chatFriendListInstance == null) {
            notFound()
            return
        }

        if (chatFriendListInstance.hasErrors()) {
            respond chatFriendListInstance.errors, view:'edit'
            return
        }

        chatFriendListInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ChatFriendList.label', default: 'ChatFriendList'), chatFriendListInstance.id])
                redirect chatFriendListInstance
            }
            '*'{ respond chatFriendListInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ChatFriendList chatFriendListInstance) {

        if (chatFriendListInstance == null) {
            notFound()
            return
        }

        chatFriendListInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ChatFriendList.label', default: 'ChatFriendList'), chatFriendListInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'chatFriendList.label', default: 'ChatFriendList'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
