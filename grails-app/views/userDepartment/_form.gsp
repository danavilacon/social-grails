<%@ page import="com.crossover.UserDepartment" %>



<div class="fieldcontain ${hasErrors(bean: userDepartmentInstance, field: 'department', 'error')} required">
	<label for="department">
		<g:message code="userDepartment.department.label" default="Department" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="department" name="department.id" from="${com.crossover.Department.list()}" optionKey="id" required="" value="${userDepartmentInstance?.department?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userDepartmentInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="userDepartment.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${com.crossover.User.list()}" optionKey="id" required="" value="${userDepartmentInstance?.user?.id}" class="many-to-one"/>

</div>

