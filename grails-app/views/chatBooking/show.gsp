
<%@ page import="grails.plugin.wschat.ChatBooking" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'chatBooking.label', default: 'ChatBooking')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-chatBooking" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-chatBooking" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list chatBooking">
			
				<g:if test="${chatBookingInstance?.conferenceName}">
				<li class="fieldcontain">
					<span id="conferenceName-label" class="property-label"><g:message code="chatBooking.conferenceName.label" default="Conference Name" /></span>
					
						<span class="property-value" aria-labelledby="conferenceName-label"><g:fieldValue bean="${chatBookingInstance}" field="conferenceName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${chatBookingInstance?.dateTime}">
				<li class="fieldcontain">
					<span id="dateTime-label" class="property-label"><g:message code="chatBooking.dateTime.label" default="Date Time" /></span>
					
						<span class="property-value" aria-labelledby="dateTime-label"><g:formatDate date="${chatBookingInstance?.dateTime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${chatBookingInstance?.endDateTime}">
				<li class="fieldcontain">
					<span id="endDateTime-label" class="property-label"><g:message code="chatBooking.endDateTime.label" default="End Date Time" /></span>
					
						<span class="property-value" aria-labelledby="endDateTime-label"><g:formatDate date="${chatBookingInstance?.endDateTime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${chatBookingInstance?.invites}">
				<li class="fieldcontain">
					<span id="invites-label" class="property-label"><g:message code="chatBooking.invites.label" default="Invites" /></span>
					
						<g:each in="${chatBookingInstance.invites}" var="i">
						<span class="property-value" aria-labelledby="invites-label"><g:link controller="chatBookingInvites" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${chatBookingInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="chatBooking.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${chatBookingInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${chatBookingInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="chatBooking.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${chatBookingInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:chatBookingInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${chatBookingInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
