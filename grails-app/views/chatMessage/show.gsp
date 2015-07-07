
<%@ page import="grails.plugin.wschat.ChatMessage" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'chatMessage.label', default: 'ChatMessage')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-chatMessage" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-chatMessage" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list chatMessage">
			
				<g:if test="${chatMessageInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="chatMessage.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${chatMessageInstance}" field="user"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${chatMessageInstance?.contents}">
				<li class="fieldcontain">
					<span id="contents-label" class="property-label"><g:message code="chatMessage.contents.label" default="Contents" /></span>
					
						<span class="property-value" aria-labelledby="contents-label"><g:fieldValue bean="${chatMessageInstance}" field="contents"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${chatMessageInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="chatMessage.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${chatMessageInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${chatMessageInstance?.log}">
				<li class="fieldcontain">
					<span id="log-label" class="property-label"><g:message code="chatMessage.log.label" default="Log" /></span>
					
						<span class="property-value" aria-labelledby="log-label"><g:link controller="chatLog" action="show" id="${chatMessageInstance?.log?.id}">${chatMessageInstance?.log?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:chatMessageInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${chatMessageInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
