<%@ page import="grails.plugin.wschat.ChatBlockList" %>



<div class="fieldcontain ${hasErrors(bean: chatBlockListInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="chatBlockList.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${chatBlockListInstance?.username}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: chatBlockListInstance, field: 'chatuser', 'error')} required">
	<label for="chatuser">
		<g:message code="chatBlockList.chatuser.label" default="Chatuser" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="chatuser" name="chatuser.id" from="${grails.plugin.wschat.ChatUser.list()}" optionKey="id" required="" value="${chatBlockListInstance?.chatuser?.id}" class="many-to-one"/>

</div>

