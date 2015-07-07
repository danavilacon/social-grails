
<%@ page import="grails.plugin.wschat.ChatBookingInvites" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'chatBookingInvites.label', default: 'ChatBookingInvites')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-chatBookingInvites" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-chatBookingInvites" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list chatBookingInvites">
			
				<g:if test="${chatBookingInvitesInstance?.emailAddress}">
				<li class="fieldcontain">
					<span id="emailAddress-label" class="property-label"><g:message code="chatBookingInvites.emailAddress.label" default="Email Address" /></span>
					
						<span class="property-value" aria-labelledby="emailAddress-label"><g:fieldValue bean="${chatBookingInvitesInstance}" field="emailAddress"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${chatBookingInvitesInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="chatBookingInvites.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${chatBookingInvitesInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${chatBookingInvitesInstance?.accepted}">
				<li class="fieldcontain">
					<span id="accepted-label" class="property-label"><g:message code="chatBookingInvites.accepted.label" default="Accepted" /></span>
					
						<span class="property-value" aria-labelledby="accepted-label"><g:formatBoolean boolean="${chatBookingInvitesInstance?.accepted}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${chatBookingInvitesInstance?.booking}">
				<li class="fieldcontain">
					<span id="booking-label" class="property-label"><g:message code="chatBookingInvites.booking.label" default="Booking" /></span>
					
						<span class="property-value" aria-labelledby="booking-label"><g:link controller="chatBooking" action="show" id="${chatBookingInvitesInstance?.booking?.id}">${chatBookingInvitesInstance?.booking?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${chatBookingInvitesInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="chatBookingInvites.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${chatBookingInvitesInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${chatBookingInvitesInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="chatBookingInvites.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${chatBookingInvitesInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${chatBookingInvitesInstance?.token}">
				<li class="fieldcontain">
					<span id="token-label" class="property-label"><g:message code="chatBookingInvites.token.label" default="Token" /></span>
					
						<span class="property-value" aria-labelledby="token-label"><g:fieldValue bean="${chatBookingInvitesInstance}" field="token"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:chatBookingInvitesInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${chatBookingInvitesInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
