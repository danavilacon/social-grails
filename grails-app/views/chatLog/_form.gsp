<%@ page import="grails.plugin.wschat.ChatLog" %>



<div class="fieldcontain ${hasErrors(bean: chatLogInstance, field: 'messages', 'error')} ">
	<label for="messages">
		<g:message code="chatLog.messages.label" default="Messages" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${chatLogInstance?.messages?}" var="m">
    <li><g:link controller="chatMessage" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="chatMessage" action="create" params="['chatLog.id': chatLogInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'chatMessage.label', default: 'ChatMessage')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: chatLogInstance, field: 'offline', 'error')} ">
	<label for="offline">
		<g:message code="chatLog.offline.label" default="Offline" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${chatLogInstance?.offline?}" var="o">
    <li><g:link controller="offLineMessage" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="offLineMessage" action="create" params="['chatLog.id': chatLogInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'offLineMessage.label', default: 'OffLineMessage')])}</g:link>
</li>
</ul>


</div>

