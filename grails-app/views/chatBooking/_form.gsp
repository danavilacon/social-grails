<%@ page import="grails.plugin.wschat.ChatBooking" %>



<div class="fieldcontain ${hasErrors(bean: chatBookingInstance, field: 'conferenceName', 'error')} required">
	<label for="conferenceName">
		<g:message code="chatBooking.conferenceName.label" default="Conference Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="conferenceName" required="" value="${chatBookingInstance?.conferenceName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: chatBookingInstance, field: 'dateTime', 'error')} required">
	<label for="dateTime">
		<g:message code="chatBooking.dateTime.label" default="Date Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateTime" precision="day"  value="${chatBookingInstance?.dateTime}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: chatBookingInstance, field: 'endDateTime', 'error')} required">
	<label for="endDateTime">
		<g:message code="chatBooking.endDateTime.label" default="End Date Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endDateTime" precision="day"  value="${chatBookingInstance?.endDateTime}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: chatBookingInstance, field: 'invites', 'error')} ">
	<label for="invites">
		<g:message code="chatBooking.invites.label" default="Invites" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${chatBookingInstance?.invites?}" var="i">
    <li><g:link controller="chatBookingInvites" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="chatBookingInvites" action="create" params="['chatBooking.id': chatBookingInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'chatBookingInvites.label', default: 'ChatBookingInvites')])}</g:link>
</li>
</ul>


</div>

