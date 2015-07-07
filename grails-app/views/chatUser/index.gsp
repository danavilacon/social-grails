
<%@ page import="grails.plugin.wschat.ChatUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'chatUser.label', default: 'ChatUser')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-chatUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-chatUser" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="username" title="${message(code: 'chatUser.username.label', default: 'Username')}" />
					
						<th><g:message code="chatUser.profile.label" default="Profile" /></th>
					
						<th><g:message code="chatUser.log.label" default="Log" /></th>
					
						<th><g:message code="chatUser.offlog.label" default="Offlog" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'chatUser.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'chatUser.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${chatUserInstanceList}" status="i" var="chatUserInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${chatUserInstance.id}">${fieldValue(bean: chatUserInstance, field: "username")}</g:link></td>
					
						<td>${fieldValue(bean: chatUserInstance, field: "profile")}</td>
					
						<td>${fieldValue(bean: chatUserInstance, field: "log")}</td>
					
						<td>${fieldValue(bean: chatUserInstance, field: "offlog")}</td>
					
						<td><g:formatDate date="${chatUserInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${chatUserInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${chatUserInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
