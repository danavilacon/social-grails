<%@ page import="grails.plugin.wschat.ChatAuthLogs" %>



<div class="fieldcontain ${hasErrors(bean: chatAuthLogsInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="chatAuthLogs.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${chatAuthLogsInstance?.username}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: chatAuthLogsInstance, field: 'loggedIn', 'error')} ">
	<label for="loggedIn">
		<g:message code="chatAuthLogs.loggedIn.label" default="Logged In" />
		
	</label>
	<g:checkBox name="loggedIn" value="${chatAuthLogsInstance?.loggedIn}" />

</div>

<div class="fieldcontain ${hasErrors(bean: chatAuthLogsInstance, field: 'loggedOut', 'error')} ">
	<label for="loggedOut">
		<g:message code="chatAuthLogs.loggedOut.label" default="Logged Out" />
		
	</label>
	<g:checkBox name="loggedOut" value="${chatAuthLogsInstance?.loggedOut}" />

</div>

