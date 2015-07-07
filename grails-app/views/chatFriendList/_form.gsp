<%@ page import="grails.plugin.wschat.ChatFriendList" %>



<div class="fieldcontain ${hasErrors(bean: chatFriendListInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="chatFriendList.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${chatFriendListInstance?.username}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: chatFriendListInstance, field: 'chatuser', 'error')} required">
	<label for="chatuser">
		<g:message code="chatFriendList.chatuser.label" default="Chatuser" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="chatuser" name="chatuser.id" from="${grails.plugin.wschat.ChatUser.list()}" optionKey="id" required="" value="${chatFriendListInstance?.chatuser?.id}" class="many-to-one"/>

</div>

