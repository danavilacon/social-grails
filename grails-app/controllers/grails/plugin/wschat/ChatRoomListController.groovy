package grails.plugin.wschat



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ChatRoomListController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ChatRoomList.list(params), model:[chatRoomListInstanceCount: ChatRoomList.count()]
    }

    def show(ChatRoomList chatRoomListInstance) {
        respond chatRoomListInstance
    }

    def create() {
        respond new ChatRoomList(params)
    }

    @Transactional
    def save(ChatRoomList chatRoomListInstance) {
        if (chatRoomListInstance == null) {
            notFound()
            return
        }

        if (chatRoomListInstance.hasErrors()) {
            respond chatRoomListInstance.errors, view:'create'
            return
        }

        chatRoomListInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'chatRoomList.label', default: 'ChatRoomList'), chatRoomListInstance.id])
                redirect chatRoomListInstance
            }
            '*' { respond chatRoomListInstance, [status: CREATED] }
        }
    }

    def edit(ChatRoomList chatRoomListInstance) {
        respond chatRoomListInstance
    }

    @Transactional
    def update(ChatRoomList chatRoomListInstance) {
        if (chatRoomListInstance == null) {
            notFound()
            return
        }

        if (chatRoomListInstance.hasErrors()) {
            respond chatRoomListInstance.errors, view:'edit'
            return
        }

        chatRoomListInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ChatRoomList.label', default: 'ChatRoomList'), chatRoomListInstance.id])
                redirect chatRoomListInstance
            }
            '*'{ respond chatRoomListInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ChatRoomList chatRoomListInstance) {

        if (chatRoomListInstance == null) {
            notFound()
            return
        }

        chatRoomListInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ChatRoomList.label', default: 'ChatRoomList'), chatRoomListInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'chatRoomList.label', default: 'ChatRoomList'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
