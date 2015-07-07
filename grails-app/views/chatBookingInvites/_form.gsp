<%@ page import="grails.plugin.wschat.ChatBookingInvites" %>



<div class="fieldcontain ${hasErrors(bean: chatBookingInvitesInstance, field: 'emailAddress', 'error')} required">
	<label for="emailAddress">
		<g:message code="chatBookingInvites.emailAddress.label" default="Email Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="emailAddress" required="" value="${chatBookingInvitesInstance?.emailAddress}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: chatBookingInvitesInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="chatBookingInvites.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${chatBookingInvitesInstance?.username}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: chatBookingInvitesInstance, field: 'accepted', 'error')} ">
	<label for="accepted">
		<g:message code="chatBookingInvites.accepted.label" default="Accepted" />
		
	</label>
	<g:checkBox name="accepted" value="${chatBookingInvitesInstance?.accepted}" />

</div>

<div class="fieldcontain ${hasErrors(bean: chatBookingInvitesInstance, field: 'booking', 'error')} required">
	<label for="booking">
		<g:message code="chatBookingInvites.booking.label" default="Booking" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="booking" name="booking.id" from="${grails.plugin.wschat.ChatBooking.list()}" optionKey="id" required="" value="${chatBookingInvitesInstance?.booking?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: chatBookingInvitesInstance, field: 'token', 'error')} required">
	<label for="token">
		<g:message code="chatBookingInvites.token.label" default="Token" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="token" required="" value="${chatBookingInvitesInstance?.token}"/>

</div>

