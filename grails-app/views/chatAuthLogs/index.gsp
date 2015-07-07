
<%@ page import="grails.plugin.wschat.ChatAuthLogs" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'chatAuthLogs.label', default: 'ChatAuthLogs')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-chatAuthLogs" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-chatAuthLogs" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="username" title="${message(code: 'chatAuthLogs.username.label', default: 'Username')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'chatAuthLogs.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'chatAuthLogs.lastUpdated.label', default: 'Last Updated')}" />
					
						<g:sortableColumn property="loggedIn" title="${message(code: 'chatAuthLogs.loggedIn.label', default: 'Logged In')}" />
					
						<g:sortableColumn property="loggedOut" title="${message(code: 'chatAuthLogs.loggedOut.label', default: 'Logged Out')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${chatAuthLogsInstanceList}" status="i" var="chatAuthLogsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${chatAuthLogsInstance.id}">${fieldValue(bean: chatAuthLogsInstance, field: "username")}</g:link></td>
					
						<td><g:formatDate date="${chatAuthLogsInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${chatAuthLogsInstance.lastUpdated}" /></td>
					
						<td><g:formatBoolean boolean="${chatAuthLogsInstance.loggedIn}" /></td>
					
						<td><g:formatBoolean boolean="${chatAuthLogsInstance.loggedOut}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${chatAuthLogsInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
