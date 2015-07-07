
<%@ page import="grails.plugin.wschat.OffLineMessage" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'offLineMessage.label', default: 'OffLineMessage')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-offLineMessage" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-offLineMessage" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="user" title="${message(code: 'offLineMessage.user.label', default: 'User')}" />
					
						<g:sortableColumn property="contents" title="${message(code: 'offLineMessage.contents.label', default: 'Contents')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'offLineMessage.dateCreated.label', default: 'Date Created')}" />
					
						<th><g:message code="offLineMessage.offlog.label" default="Offlog" /></th>
					
						<g:sortableColumn property="readMsg" title="${message(code: 'offLineMessage.readMsg.label', default: 'Read Msg')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${offLineMessageInstanceList}" status="i" var="offLineMessageInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${offLineMessageInstance.id}">${fieldValue(bean: offLineMessageInstance, field: "user")}</g:link></td>
					
						<td>${fieldValue(bean: offLineMessageInstance, field: "contents")}</td>
					
						<td><g:formatDate date="${offLineMessageInstance.dateCreated}" /></td>
					
						<td>${fieldValue(bean: offLineMessageInstance, field: "offlog")}</td>
					
						<td><g:formatBoolean boolean="${offLineMessageInstance.readMsg}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${offLineMessageInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
