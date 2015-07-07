<%@ page import="grails.plugin.wschat.ChatUserProfile" %>



<div class="fieldcontain ${hasErrors(bean: chatUserProfileInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="chatUserProfile.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" maxlength="50" value="${chatUserProfileInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: chatUserProfileInstance, field: 'middleName', 'error')} ">
	<label for="middleName">
		<g:message code="chatUserProfile.middleName.label" default="Middle Name" />
		
	</label>
	<g:textField name="middleName" maxlength="50" value="${chatUserProfileInstance?.middleName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: chatUserProfileInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="chatUserProfile.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" maxlength="50" value="${chatUserProfileInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: chatUserProfileInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="chatUserProfile.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${chatUserProfileInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: chatUserProfileInstance, field: 'age', 'error')} ">
	<label for="age">
		<g:message code="chatUserProfile.age.label" default="Age" />
		
	</label>
	<g:select name="age" from="${0..150}" class="range" value="${fieldValue(bean: chatUserProfileInstance, field: 'age')}" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: chatUserProfileInstance, field: 'gender', 'error')} ">
	<label for="gender">
		<g:message code="chatUserProfile.gender.label" default="Gender" />
		
	</label>
	<g:select name="gender" from="${chatUserProfileInstance.constraints.gender.inList}" value="${chatUserProfileInstance?.gender}" valueMessagePrefix="chatUserProfile.gender" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: chatUserProfileInstance, field: 'martialStatus', 'error')} ">
	<label for="martialStatus">
		<g:message code="chatUserProfile.martialStatus.label" default="Martial Status" />
		
	</label>
	<g:select name="martialStatus" from="${chatUserProfileInstance.constraints.martialStatus.inList}" value="${chatUserProfileInstance?.martialStatus}" valueMessagePrefix="chatUserProfile.martialStatus" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: chatUserProfileInstance, field: 'birthDate', 'error')} ">
	<label for="birthDate">
		<g:message code="chatUserProfile.birthDate.label" default="Birth Date" />
		
	</label>
	<g:datePicker name="birthDate" precision="day"  value="${chatUserProfileInstance?.birthDate}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: chatUserProfileInstance, field: 'wage', 'error')} ">
	<label for="wage">
		<g:message code="chatUserProfile.wage.label" default="Wage" />
		
	</label>
	<g:field name="wage" value="${fieldValue(bean: chatUserProfileInstance, field: 'wage')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: chatUserProfileInstance, field: 'children', 'error')} ">
	<label for="children">
		<g:message code="chatUserProfile.children.label" default="Children" />
		
	</label>
	<g:field name="children" type="number" min="0" max="10" value="${chatUserProfileInstance.children}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: chatUserProfileInstance, field: 'homePage', 'error')} ">
	<label for="homePage">
		<g:message code="chatUserProfile.homePage.label" default="Home Page" />
		
	</label>
	<g:field type="url" name="homePage" value="${chatUserProfileInstance?.homePage}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: chatUserProfileInstance, field: 'chatuser', 'error')} required">
	<label for="chatuser">
		<g:message code="chatUserProfile.chatuser.label" default="Chatuser" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="chatuser" name="chatuser.id" from="${grails.plugin.wschat.ChatUser.list()}" optionKey="id" required="" value="${chatUserProfileInstance?.chatuser?.id}" class="many-to-one"/>

</div>

