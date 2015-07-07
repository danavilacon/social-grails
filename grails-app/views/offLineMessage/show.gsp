
<%@ page import="grails.plugin.wschat.OffLineMessage" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'offLineMessage.label', default: 'OffLineMessage')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-offLineMessage" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-offLineMessage" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list offLineMessage">
			
				<g:if test="${offLineMessageInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="offLineMessage.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${offLineMessageInstance}" field="user"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${offLineMessageInstance?.contents}">
				<li class="fieldcontain">
					<span id="contents-label" class="property-label"><g:message code="offLineMessage.contents.label" default="Contents" /></span>
					
						<span class="property-value" aria-labelledby="contents-label"><g:fieldValue bean="${offLineMessageInstance}" field="contents"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${offLineMessageInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="offLineMessage.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${offLineMessageInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${offLineMessageInstance?.offlog}">
				<li class="fieldcontain">
					<span id="offlog-label" class="property-label"><g:message code="offLineMessage.offlog.label" default="Offlog" /></span>
					
						<span class="property-value" aria-labelledby="offlog-label"><g:link controller="chatLog" action="show" id="${offLineMessageInstance?.offlog?.id}">${offLineMessageInstance?.offlog?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${offLineMessageInstance?.readMsg}">
				<li class="fieldcontain">
					<span id="readMsg-label" class="property-label"><g:message code="offLineMessage.readMsg.label" default="Read Msg" /></span>
					
						<span class="property-value" aria-labelledby="readMsg-label"><g:formatBoolean boolean="${offLineMessageInstance?.readMsg}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:offLineMessageInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${offLineMessageInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
