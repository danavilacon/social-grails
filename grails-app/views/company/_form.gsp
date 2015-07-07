<%@ page import="com.crossover.Company" %>



<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'departments', 'error')} ">
	<label for="departments">
		<g:message code="company.departments.label" default="Departments" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${companyInstance?.departments?}" var="d">
    <li><g:link controller="department" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="department" action="create" params="['company.id': companyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'department.label', default: 'Department')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="company.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${companyInstance?.name}"/>

</div>

