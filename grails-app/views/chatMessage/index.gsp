
<%@ page import="grails.plugin.wschat.ChatMessage" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'chatMessage.label', default: 'ChatMessage')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-chatMessage" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-chatMessage" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="user" title="${message(code: 'chatMessage.user.label', default: 'User')}" />
					
						<g:sortableColumn property="contents" title="${message(code: 'chatMessage.contents.label', default: 'Contents')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'chatMessage.dateCreated.label', default: 'Date Created')}" />
					
						<th><g:message code="chatMessage.log.label" default="Log" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${chatMessageInstanceList}" status="i" var="chatMessageInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${chatMessageInstance.id}">${fieldValue(bean: chatMessageInstance, field: "user")}</g:link></td>
					
						<td>${fieldValue(bean: chatMessageInstance, field: "contents")}</td>
					
						<td><g:formatDate date="${chatMessageInstance.dateCreated}" /></td>
					
						<td>${fieldValue(bean: chatMessageInstance, field: "log")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${chatMessageInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
