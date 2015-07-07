<%@ page import="com.crossover.Department" %>



<div class="fieldcontain ${hasErrors(bean: departmentInstance, field: 'company', 'error')} required">
	<label for="company">
		<g:message code="department.company.label" default="Company" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="company" name="company.id" from="${com.crossover.Company.list()}" optionKey="id" required="" value="${departmentInstance?.company?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: departmentInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="department.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${departmentInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: departmentInstance, field: 'users', 'error')} ">
	<label for="users">
		<g:message code="department.users.label" default="Users" />
		
	</label>
	<g:select name="users" from="${com.crossover.User.list()}" multiple="multiple" optionKey="id" size="5" value="${departmentInstance?.users*.id}" class="many-to-many"/>

</div>

