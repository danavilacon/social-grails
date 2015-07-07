
<%@ page import="grails.plugin.wschat.ChatUserProfile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'chatUserProfile.label', default: 'ChatUserProfile')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-chatUserProfile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-chatUserProfile" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="firstName" title="${message(code: 'chatUserProfile.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="middleName" title="${message(code: 'chatUserProfile.middleName.label', default: 'Middle Name')}" />
					
						<g:sortableColumn property="lastName" title="${message(code: 'chatUserProfile.lastName.label', default: 'Last Name')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'chatUserProfile.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="age" title="${message(code: 'chatUserProfile.age.label', default: 'Age')}" />
					
						<g:sortableColumn property="gender" title="${message(code: 'chatUserProfile.gender.label', default: 'Gender')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${chatUserProfileInstanceList}" status="i" var="chatUserProfileInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${chatUserProfileInstance.id}">${fieldValue(bean: chatUserProfileInstance, field: "firstName")}</g:link></td>
					
						<td>${fieldValue(bean: chatUserProfileInstance, field: "middleName")}</td>
					
						<td>${fieldValue(bean: chatUserProfileInstance, field: "lastName")}</td>
					
						<td>${fieldValue(bean: chatUserProfileInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: chatUserProfileInstance, field: "age")}</td>
					
						<td>${fieldValue(bean: chatUserProfileInstance, field: "gender")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${chatUserProfileInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
