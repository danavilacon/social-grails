
<%@ page import="grails.plugin.wschat.ChatBooking" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'chatBooking.label', default: 'ChatBooking')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-chatBooking" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-chatBooking" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="conferenceName" title="${message(code: 'chatBooking.conferenceName.label', default: 'Conference Name')}" />
					
						<g:sortableColumn property="dateTime" title="${message(code: 'chatBooking.dateTime.label', default: 'Date Time')}" />
					
						<g:sortableColumn property="endDateTime" title="${message(code: 'chatBooking.endDateTime.label', default: 'End Date Time')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'chatBooking.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'chatBooking.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${chatBookingInstanceList}" status="i" var="chatBookingInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${chatBookingInstance.id}">${fieldValue(bean: chatBookingInstance, field: "conferenceName")}</g:link></td>
					
						<td><g:formatDate date="${chatBookingInstance.dateTime}" /></td>
					
						<td><g:formatDate date="${chatBookingInstance.endDateTime}" /></td>
					
						<td><g:formatDate date="${chatBookingInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${chatBookingInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${chatBookingInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
