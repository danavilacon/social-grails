
<%@ page import="grails.plugin.wschat.ChatUserProfile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'chatUserProfile.label', default: 'ChatUserProfile')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-chatUserProfile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-chatUserProfile" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list chatUserProfile">
			
				<g:if test="${chatUserProfileInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="chatUserProfile.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${chatUserProfileInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${chatUserProfileInstance?.middleName}">
				<li class="fieldcontain">
					<span id="middleName-label" class="property-label"><g:message code="chatUserProfile.middleName.label" default="Middle Name" /></span>
					
						<span class="property-value" aria-labelledby="middleName-label"><g:fieldValue bean="${chatUserProfileInstance}" field="middleName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${chatUserProfileInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="chatUserProfile.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${chatUserProfileInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${chatUserProfileInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="chatUserProfile.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${chatUserProfileInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${chatUserProfileInstance?.age}">
				<li class="fieldcontain">
					<span id="age-label" class="property-label"><g:message code="chatUserProfile.age.label" default="Age" /></span>
					
						<span class="property-value" aria-labelledby="age-label"><g:fieldValue bean="${chatUserProfileInstance}" field="age"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${chatUserProfileInstance?.gender}">
				<li class="fieldcontain">
					<span id="gender-label" class="property-label"><g:message code="chatUserProfile.gender.label" default="Gender" /></span>
					
						<span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${chatUserProfileInstance}" field="gender"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${chatUserProfileInstance?.martialStatus}">
				<li class="fieldcontain">
					<span id="martialStatus-label" class="property-label"><g:message code="chatUserProfile.martialStatus.label" default="Martial Status" /></span>
					
						<span class="property-value" aria-labelledby="martialStatus-label"><g:fieldValue bean="${chatUserProfileInstance}" field="martialStatus"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${chatUserProfileInstance?.birthDate}">
				<li class="fieldcontain">
					<span id="birthDate-label" class="property-label"><g:message code="chatUserProfile.birthDate.label" default="Birth Date" /></span>
					
						<span class="property-value" aria-labelledby="birthDate-label"><g:formatDate date="${chatUserProfileInstance?.birthDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${chatUserProfileInstance?.wage}">
				<li class="fieldcontain">
					<span id="wage-label" class="property-label"><g:message code="chatUserProfile.wage.label" default="Wage" /></span>
					
						<span class="property-value" aria-labelledby="wage-label"><g:fieldValue bean="${chatUserProfileInstance}" field="wage"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${chatUserProfileInstance?.children}">
				<li class="fieldcontain">
					<span id="children-label" class="property-label"><g:message code="chatUserProfile.children.label" default="Children" /></span>
					
						<span class="property-value" aria-labelledby="children-label"><g:fieldValue bean="${chatUserProfileInstance}" field="children"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${chatUserProfileInstance?.homePage}">
				<li class="fieldcontain">
					<span id="homePage-label" class="property-label"><g:message code="chatUserProfile.homePage.label" default="Home Page" /></span>
					
						<span class="property-value" aria-labelledby="homePage-label"><g:fieldValue bean="${chatUserProfileInstance}" field="homePage"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${chatUserProfileInstance?.chatuser}">
				<li class="fieldcontain">
					<span id="chatuser-label" class="property-label"><g:message code="chatUserProfile.chatuser.label" default="Chatuser" /></span>
					
						<span class="property-value" aria-labelledby="chatuser-label"><g:link controller="chatUser" action="show" id="${chatUserProfileInstance?.chatuser?.id}">${chatUserProfileInstance?.chatuser?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${chatUserProfileInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="chatUserProfile.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${chatUserProfileInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${chatUserProfileInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="chatUserProfile.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${chatUserProfileInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:chatUserProfileInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${chatUserProfileInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
