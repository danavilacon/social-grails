<%@ page import="com.crossover.Comment" %>



<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'rating', 'error')} required">
	<label for="rating">
		<g:message code="comment.rating.label" default="Rating" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="rating" from="${1..5}" class="range" required="" value="${fieldValue(bean: commentInstance, field: 'rating')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'content', 'error')} required">
	<label for="content">
		<g:message code="comment.content.label" default="Content" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="content" required="" value="${commentInstance?.content}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'post', 'error')} required">
	<label for="post">
		<g:message code="comment.post.label" default="Post" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="post" name="post.id" from="${com.crossover.Post.list()}" optionKey="id" required="" value="${commentInstance?.post?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="comment.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${com.crossover.User.list()}" optionKey="id" required="" value="${commentInstance?.user?.id}" class="many-to-one"/>

</div>

