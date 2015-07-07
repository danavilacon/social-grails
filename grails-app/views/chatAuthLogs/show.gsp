
<%@ page import="grails.plugin.wschat.ChatAuthLogs" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'chatAuthLogs.label', default: 'ChatAuthLogs')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-chatAuthLogs" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-chatAuthLogs" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list chatAuthLogs">
			
				<g:if test="${chatAuthLogsInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="chatAuthLogs.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${chatAuthLogsInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${chatAuthLogsInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="chatAuthLogs.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${chatAuthLogsInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${chatAuthLogsInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="chatAuthLogs.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${chatAuthLogsInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${chatAuthLogsInstance?.loggedIn}">
				<li class="fieldcontain">
					<span id="loggedIn-label" class="property-label"><g:message code="chatAuthLogs.loggedIn.label" default="Logged In" /></span>
					
						<span class="property-value" aria-labelledby="loggedIn-label"><g:formatBoolean boolean="${chatAuthLogsInstance?.loggedIn}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${chatAuthLogsInstance?.loggedOut}">
				<li class="fieldcontain">
					<span id="loggedOut-label" class="property-label"><g:message code="chatAuthLogs.loggedOut.label" default="Logged Out" /></span>
					
						<span class="property-value" aria-labelledby="loggedOut-label"><g:formatBoolean boolean="${chatAuthLogsInstance?.loggedOut}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:chatAuthLogsInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${chatAuthLogsInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
