
<%@ page import="grails.plugin.wschat.ChatUserPics" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'chatUserPics.label', default: 'ChatUserPics')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-chatUserPics" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-chatUserPics" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="photo" title="${message(code: 'chatUserPics.photo.label', default: 'Photo')}" />
					
						<th><g:message code="chatUserPics.chatuser.label" default="Chatuser" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'chatUserPics.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'chatUserPics.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${chatUserPicsInstanceList}" status="i" var="chatUserPicsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${chatUserPicsInstance.id}">${fieldValue(bean: chatUserPicsInstance, field: "photo")}</g:link></td>
					
						<td>${fieldValue(bean: chatUserPicsInstance, field: "chatuser")}</td>
					
						<td><g:formatDate date="${chatUserPicsInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${chatUserPicsInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${chatUserPicsInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
