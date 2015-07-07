
<%@ page import="com.crossover.Blog" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'blog.label', default: 'Blog')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-blog" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-blog" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list blog">
			
				<g:if test="${blogInstance?.department}">
				<li class="fieldcontain">
					<span id="department-label" class="property-label"><g:message code="blog.department.label" default="Department" /></span>
					
						<span class="property-value" aria-labelledby="department-label"><g:link controller="department" action="show" id="${blogInstance?.department?.id}">${blogInstance?.department?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${blogInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="blog.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${blogInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${blogInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="blog.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${blogInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${blogInstance?.posts}">
				<li class="fieldcontain">
					<span id="posts-label" class="property-label"><g:message code="blog.posts.label" default="Posts" /></span>
					
						<g:each in="${blogInstance.posts}" var="p">
						<span class="property-value" aria-labelledby="posts-label"><g:link controller="post" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:blogInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${blogInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
