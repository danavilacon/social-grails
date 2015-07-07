package grails.plugin.wschat



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ChatUserPicsController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ChatUserPics.list(params), model:[chatUserPicsInstanceCount: ChatUserPics.count()]
    }

    def show(ChatUserPics chatUserPicsInstance) {
        respond chatUserPicsInstance
    }

    def create() {
        respond new ChatUserPics(params)
    }

    @Transactional
    def save(ChatUserPics chatUserPicsInstance) {
        if (chatUserPicsInstance == null) {
            notFound()
            return
        }

        if (chatUserPicsInstance.hasErrors()) {
            respond chatUserPicsInstance.errors, view:'create'
            return
        }

        chatUserPicsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'chatUserPics.label', default: 'ChatUserPics'), chatUserPicsInstance.id])
                redirect chatUserPicsInstance
            }
            '*' { respond chatUserPicsInstance, [status: CREATED] }
        }
    }

    def edit(ChatUserPics chatUserPicsInstance) {
        respond chatUserPicsInstance
    }

    @Transactional
    def update(ChatUserPics chatUserPicsInstance) {
        if (chatUserPicsInstance == null) {
            notFound()
            return
        }

        if (chatUserPicsInstance.hasErrors()) {
            respond chatUserPicsInstance.errors, view:'edit'
            return
        }

        chatUserPicsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ChatUserPics.label', default: 'ChatUserPics'), chatUserPicsInstance.id])
                redirect chatUserPicsInstance
            }
            '*'{ respond chatUserPicsInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ChatUserPics chatUserPicsInstance) {

        if (chatUserPicsInstance == null) {
            notFound()
            return
        }

        chatUserPicsInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ChatUserPics.label', default: 'ChatUserPics'), chatUserPicsInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'chatUserPics.label', default: 'ChatUserPics'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
