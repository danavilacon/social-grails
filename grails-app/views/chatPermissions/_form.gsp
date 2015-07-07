<%@ page import="grails.plugin.wschat.ChatPermissions" %>



<div class="fieldcontain ${hasErrors(bean: chatPermissionsInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="chatPermissions.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${chatPermissionsInstance?.name}"/>

</div>

