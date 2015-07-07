package com.crossover



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserDepartmentController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond UserDepartment.list(params), model:[userDepartmentInstanceCount: UserDepartment.count()]
    }

    def show(UserDepartment userDepartmentInstance) {
        respond userDepartmentInstance
    }

    def create() {
        respond new UserDepartment(params)
    }

    @Transactional
    def save(UserDepartment userDepartmentInstance) {
        if (userDepartmentInstance == null) {
            notFound()
            return
        }

        if (userDepartmentInstance.hasErrors()) {
            respond userDepartmentInstance.errors, view:'create'
            return
        }

        userDepartmentInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'userDepartment.label', default: 'UserDepartment'), userDepartmentInstance.id])
                redirect userDepartmentInstance
            }
            '*' { respond userDepartmentInstance, [status: CREATED] }
        }
    }

    def edit(UserDepartment userDepartmentInstance) {
        respond userDepartmentInstance
    }

    @Transactional
    def update(UserDepartment userDepartmentInstance) {
        if (userDepartmentInstance == null) {
            notFound()
            return
        }

        if (userDepartmentInstance.hasErrors()) {
            respond userDepartmentInstance.errors, view:'edit'
            return
        }

        userDepartmentInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'UserDepartment.label', default: 'UserDepartment'), userDepartmentInstance.id])
                redirect userDepartmentInstance
            }
            '*'{ respond userDepartmentInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(UserDepartment userDepartmentInstance) {

        if (userDepartmentInstance == null) {
            notFound()
            return
        }

        userDepartmentInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'UserDepartment.label', default: 'UserDepartment'), userDepartmentInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'userDepartment.label', default: 'UserDepartment'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
