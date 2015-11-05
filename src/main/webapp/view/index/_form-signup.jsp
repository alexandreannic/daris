<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<form:form id='form-signup' method='POST' action='user/signup' commandName='user'>

	<div class='form-field'>
		<label for='signup-firstName'><spring:message code='user.field.firstName'/></label>
		<form:input id='signup-firstName' path='firstName'/>
	</div>
	
	
	<div class='form-field'>
		<label for='signup-lastName'><spring:message code='user.field.lastName'/></label>
		<form:input id='signup-lastName' path='lastName'/>
	</div>
	
	
	<div class='form-field'>
		<label for='signup-email'><spring:message code='user.field.email'/></label>
		<form:input id='signup-email' path='email' type='email'/>
		<form:errors path='email'/>
	</div>
	
	<br/>
	
	<div class='form-field'>
		<label for='signup-password' for='password'><spring:message code='user.field.password'/></label>
		<input id='signup-password' type='password'/>
		<form:input id='signup-saltedPwd' type='hidden' path='password' />
	</div>
	
	
	<div class='form-field'>
		<label for='signup-confirm' for='password'><spring:message code='user.field.password.confirm'/></label>
		<input id='signup-confirm' type='password'/>
	</div>
	
</form:form>