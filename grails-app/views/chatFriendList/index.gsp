
<%@ page import="grails.plugin.wschat.ChatFriendList" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'chatFriendList.label', default: 'ChatFriendList')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-chatFriendList" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-chatFriendList" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="username" title="${message(code: 'chatFriendList.username.label', default: 'Username')}" />
					
						<th><g:message code="chatFriendList.chatuser.label" default="Chatuser" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'chatFriendList.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'chatFriendList.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${chatFriendListInstanceList}" status="i" var="chatFriendListInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${chatFriendListInstance.id}">${fieldValue(bean: chatFriendListInstance, field: "username")}</g:link></td>
					
						<td>${fieldValue(bean: chatFriendListInstance, field: "chatuser")}</td>
					
						<td><g:formatDate date="${chatFriendListInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${chatFriendListInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${chatFriendListInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
