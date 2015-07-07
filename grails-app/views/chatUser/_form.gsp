<%@ page import="grails.plugin.wschat.ChatUser" %>



<div class="fieldcontain ${hasErrors(bean: chatUserInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="chatUser.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${chatUserInstance?.username}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: chatUserInstance, field: 'friends', 'error')} ">
	<label for="friends">
		<g:message code="chatUser.friends.label" default="Friends" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${chatUserInstance?.friends?}" var="f">
    <li><g:link controller="chatFriendList" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="chatFriendList" action="create" params="['chatUser.id': chatUserInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'chatFriendList.label', default: 'ChatFriendList')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: chatUserInstance, field: 'blocked', 'error')} ">
	<label for="blocked">
		<g:message code="chatUser.blocked.label" default="Blocked" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${chatUserInstance?.blocked?}" var="b">
    <li><g:link controller="chatBlockList" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="chatBlockList" action="create" params="['chatUser.id': chatUserInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'chatBlockList.label', default: 'ChatBlockList')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: chatUserInstance, field: 'photos', 'error')} ">
	<label for="photos">
		<g:message code="chatUser.photos.label" default="Photos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${chatUserInstance?.photos?}" var="p">
    <li><g:link controller="chatUserPics" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="chatUserPics" action="create" params="['chatUser.id': chatUserInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'chatUserPics.label', default: 'ChatUserPics')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: chatUserInstance, field: 'profile', 'error')} ">
	<label for="profile">
		<g:message code="chatUser.profile.label" default="Profile" />
		
	</label>
	<g:select id="profile" name="profile.id" from="${grails.plugin.wschat.ChatUserProfile.list()}" optionKey="id" value="${chatUserInstance?.profile?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: chatUserInstance, field: 'log', 'error')} ">
	<label for="log">
		<g:message code="chatUser.log.label" default="Log" />
		
	</label>
	<g:select id="log" name="log.id" from="${grails.plugin.wschat.ChatLog.list()}" optionKey="id" value="${chatUserInstance?.log?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: chatUserInstance, field: 'offlog', 'error')} ">
	<label for="offlog">
		<g:message code="chatUser.offlog.label" default="Offlog" />
		
	</label>
	<g:select id="offlog" name="offlog.id" from="${grails.plugin.wschat.ChatLog.list()}" optionKey="id" value="${chatUserInstance?.offlog?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: chatUserInstance, field: 'permissions', 'error')} required">
	<label for="permissions">
		<g:message code="chatUser.permissions.label" default="Permissions" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="permissions" name="permissions.id" from="${grails.plugin.wschat.ChatPermissions.list()}" optionKey="id" required="" value="${chatUserInstance?.permissions?.id}" class="many-to-one"/>

</div>

