<%@ page import="grails.plugin.wschat.ChatMessage" %>



<div class="fieldcontain ${hasErrors(bean: chatMessageInstance, field: 'user', 'error')} ">
	<label for="user">
		<g:message code="chatMessage.user.label" default="User" />
		
	</label>
	<g:textField name="user" value="${chatMessageInstance?.user}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: chatMessageInstance, field: 'contents', 'error')} required">
	<label for="contents">
		<g:message code="chatMessage.contents.label" default="Contents" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="contents" required="" value="${chatMessageInstance?.contents}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: chatMessageInstance, field: 'log', 'error')} required">
	<label for="log">
		<g:message code="chatMessage.log.label" default="Log" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="log" name="log.id" from="${grails.plugin.wschat.ChatLog.list()}" optionKey="id" required="" value="${chatMessageInstance?.log?.id}" class="many-to-one"/>

</div>

