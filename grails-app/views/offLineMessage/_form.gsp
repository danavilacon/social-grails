<%@ page import="grails.plugin.wschat.OffLineMessage" %>



<div class="fieldcontain ${hasErrors(bean: offLineMessageInstance, field: 'user', 'error')} ">
	<label for="user">
		<g:message code="offLineMessage.user.label" default="User" />
		
	</label>
	<g:textField name="user" value="${offLineMessageInstance?.user}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: offLineMessageInstance, field: 'contents', 'error')} required">
	<label for="contents">
		<g:message code="offLineMessage.contents.label" default="Contents" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="contents" required="" value="${offLineMessageInstance?.contents}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: offLineMessageInstance, field: 'offlog', 'error')} required">
	<label for="offlog">
		<g:message code="offLineMessage.offlog.label" default="Offlog" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="offlog" name="offlog.id" from="${grails.plugin.wschat.ChatLog.list()}" optionKey="id" required="" value="${offLineMessageInstance?.offlog?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: offLineMessageInstance, field: 'readMsg', 'error')} ">
	<label for="readMsg">
		<g:message code="offLineMessage.readMsg.label" default="Read Msg" />
		
	</label>
	<g:checkBox name="readMsg" value="${offLineMessageInstance?.readMsg}" />

</div>

