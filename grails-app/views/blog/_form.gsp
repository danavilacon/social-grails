<%@ page import="com.crossover.Blog" %>



<div class="fieldcontain ${hasErrors(bean: blogInstance, field: 'department', 'error')} required">
	<label for="department">
		<g:message code="blog.department.label" default="Department" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="department" name="department.id" from="${com.crossover.Department.list()}" optionKey="id" required="" value="${blogInstance?.department?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: blogInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="blog.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${blogInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: blogInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="blog.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${blogInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: blogInstance, field: 'posts', 'error')} ">
	<label for="posts">
		<g:message code="blog.posts.label" default="Posts" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${blogInstance?.posts?}" var="p">
    <li><g:link controller="post" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="post" action="create" params="['blog.id': blogInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'post.label', default: 'Post')])}</g:link>
</li>
</ul>


</div>

