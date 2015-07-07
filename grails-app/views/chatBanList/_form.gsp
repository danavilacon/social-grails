<%@ page import="grails.plugin.wschat.ChatBanList" %>



<div class="fieldcontain ${hasErrors(bean: chatBanListInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="chatBanList.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${chatBanListInstance?.username}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: chatBanListInstance, field: 'period', 'error')} required">
	<label for="period">
		<g:message code="chatBanList.period.label" default="Period" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="period" required="" value="${chatBanListInstance?.period}"/>

</div>

