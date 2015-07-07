package grails.plugin.wschat



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ChatPermissionsController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ChatPermissions.list(params), model:[chatPermissionsInstanceCount: ChatPermissions.count()]
    }

    def show(ChatPermissions chatPermissionsInstance) {
        respond chatPermissionsInstance
    }

    def create() {
        respond new ChatPermissions(params)
    }

    @Transactional
    def save(ChatPermissions chatPermissionsInstance) {
        if (chatPermissionsInstance == null) {
            notFound()
            return
        }

        if (chatPermissionsInstance.hasErrors()) {
            respond chatPermissionsInstance.errors, view:'create'
            return
        }

        chatPermissionsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'chatPermissions.label', default: 'ChatPermissions'), chatPermissionsInstance.id])
                redirect chatPermissionsInstance
            }
            '*' { respond chatPermissionsInstance, [status: CREATED] }
        }
    }

    def edit(ChatPermissions chatPermissionsInstance) {
        respond chatPermissionsInstance
    }

    @Transactional
    def update(ChatPermissions chatPermissionsInstance) {
        if (chatPermissionsInstance == null) {
            notFound()
            return
        }

        if (chatPermissionsInstance.hasErrors()) {
            respond chatPermissionsInstance.errors, view:'edit'
            return
        }

        chatPermissionsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ChatPermissions.label', default: 'ChatPermissions'), chatPermissionsInstance.id])
                redirect chatPermissionsInstance
            }
            '*'{ respond chatPermissionsInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ChatPermissions chatPermissionsInstance) {

        if (chatPermissionsInstance == null) {
            notFound()
            return
        }

        chatPermissionsInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ChatPermissions.label', default: 'ChatPermissions'), chatPermissionsInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'chatPermissions.label', default: 'ChatPermissions'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
