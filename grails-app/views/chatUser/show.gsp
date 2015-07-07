
<%@ page import="grails.plugin.wschat.ChatUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'chatUser.label', default: 'ChatUser')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-chatUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-chatUser" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list chatUser">
			
				<g:if test="${chatUserInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="chatUser.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${chatUserInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${chatUserInstance?.friends}">
				<li class="fieldcontain">
					<span id="friends-label" class="property-label"><g:message code="chatUser.friends.label" default="Friends" /></span>
					
						<g:each in="${chatUserInstance.friends}" var="f">
						<span class="property-value" aria-labelledby="friends-label"><g:link controller="chatFriendList" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${chatUserInstance?.blocked}">
				<li class="fieldcontain">
					<span id="blocked-label" class="property-label"><g:message code="chatUser.blocked.label" default="Blocked" /></span>
					
						<g:each in="${chatUserInstance.blocked}" var="b">
						<span class="property-value" aria-labelledby="blocked-label"><g:link controller="chatBlockList" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${chatUserInstance?.photos}">
				<li class="fieldcontain">
					<span id="photos-label" class="property-label"><g:message code="chatUser.photos.label" default="Photos" /></span>
					
						<g:each in="${chatUserInstance.photos}" var="p">
						<span class="property-value" aria-labelledby="photos-label"><g:link controller="chatUserPics" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${chatUserInstance?.profile}">
				<li class="fieldcontain">
					<span id="profile-label" class="property-label"><g:message code="chatUser.profile.label" default="Profile" /></span>
					
						<span class="property-value" aria-labelledby="profile-label"><g:link controller="chatUserProfile" action="show" id="${chatUserInstance?.profile?.id}">${chatUserInstance?.profile?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${chatUserInstance?.log}">
				<li class="fieldcontain">
					<span id="log-label" class="property-label"><g:message code="chatUser.log.label" default="Log" /></span>
					
						<span class="property-value" aria-labelledby="log-label"><g:link controller="chatLog" action="show" id="${chatUserInstance?.log?.id}">${chatUserInstance?.log?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${chatUserInstance?.offlog}">
				<li class="fieldcontain">
					<span id="offlog-label" class="property-label"><g:message code="chatUser.offlog.label" default="Offlog" /></span>
					
						<span class="property-value" aria-labelledby="offlog-label"><g:link controller="chatLog" action="show" id="${chatUserInstance?.offlog?.id}">${chatUserInstance?.offlog?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${chatUserInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="chatUser.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${chatUserInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${chatUserInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="chatUser.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${chatUserInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${chatUserInstance?.permissions}">
				<li class="fieldcontain">
					<span id="permissions-label" class="property-label"><g:message code="chatUser.permissions.label" default="Permissions" /></span>
					
						<span class="property-value" aria-labelledby="permissions-label"><g:link controller="chatPermissions" action="show" id="${chatUserInstance?.permissions?.id}">${chatUserInstance?.permissions?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:chatUserInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${chatUserInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
