<%@ page import="grails.plugin.wschat.ChatRoomList" %>



<div class="fieldcontain ${hasErrors(bean: chatRoomListInstance, field: 'room', 'error')} required">
	<label for="room">
		<g:message code="chatRoomList.room.label" default="Room" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="room" required="" value="${chatRoomListInstance?.room}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: chatRoomListInstance, field: 'roomType', 'error')} ">
	<label for="roomType">
		<g:message code="chatRoomList.roomType.label" default="Room Type" />
		
	</label>
	<g:textField name="roomType" value="${chatRoomListInstance?.roomType}"/>

</div>

