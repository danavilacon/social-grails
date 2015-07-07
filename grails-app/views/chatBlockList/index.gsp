
<%@ page import="grails.plugin.wschat.ChatBlockList" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'chatBlockList.label', default: 'ChatBlockList')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-chatBlockList" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-chatBlockList" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="username" title="${message(code: 'chatBlockList.username.label', default: 'Username')}" />
					
						<th><g:message code="chatBlockList.chatuser.label" default="Chatuser" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'chatBlockList.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'chatBlockList.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${chatBlockListInstanceList}" status="i" var="chatBlockListInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${chatBlockListInstance.id}">${fieldValue(bean: chatBlockListInstance, field: "username")}</g:link></td>
					
						<td>${fieldValue(bean: chatBlockListInstance, field: "chatuser")}</td>
					
						<td><g:formatDate date="${chatBlockListInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${chatBlockListInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${chatBlockListInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
