<%@ page import="grails.plugin.wschat.ChatUserPics" %>



<div class="fieldcontain ${hasErrors(bean: chatUserPicsInstance, field: 'photo', 'error')} required">
	<label for="photo">
		<g:message code="chatUserPics.photo.label" default="Photo" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="photo" name="photo" />

</div>

<div class="fieldcontain ${hasErrors(bean: chatUserPicsInstance, field: 'chatuser', 'error')} required">
	<label for="chatuser">
		<g:message code="chatUserPics.chatuser.label" default="Chatuser" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="chatuser" name="chatuser.id" from="${grails.plugin.wschat.ChatUser.list()}" optionKey="id" required="" value="${chatUserPicsInstance?.chatuser?.id}" class="many-to-one"/>

</div>

