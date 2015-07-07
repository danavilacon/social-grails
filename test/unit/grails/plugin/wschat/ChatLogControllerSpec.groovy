package grails.plugin.wschat



import grails.test.mixin.*
import spock.lang.*

@TestFor(ChatLogController)
@Mock(ChatLog)
class ChatLogControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.chatLogInstanceList
            model.chatLogInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.chatLogInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def chatLog = new ChatLog()
            chatLog.validate()
            controller.save(chatLog)

        then:"The create view is rendered again with the correct model"
            model.chatLogInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            chatLog = new ChatLog(params)

            controller.save(chatLog)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/chatLog/show/1'
            controller.flash.message != null
            ChatLog.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def chatLog = new ChatLog(params)
            controller.show(chatLog)

        then:"A model is populated containing the domain instance"
            model.chatLogInstance == chatLog
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def chatLog = new ChatLog(params)
            controller.edit(chatLog)

        then:"A model is populated containing the domain instance"
            model.chatLogInstance == chatLog
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/chatLog/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def chatLog = new ChatLog()
            chatLog.validate()
            controller.update(chatLog)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.chatLogInstance == chatLog

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            chatLog = new ChatLog(params).save(flush: true)
            controller.update(chatLog)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/chatLog/show/$chatLog.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/chatLog/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def chatLog = new ChatLog(params).save(flush: true)

        then:"It exists"
            ChatLog.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(chatLog)

        then:"The instance is deleted"
            ChatLog.count() == 0
            response.redirectedUrl == '/chatLog/index'
            flash.message != null
    }
}
