<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<form id='signin-form' method='POST' action='user/signin'>

	<p class='field'>
		<i class='field-i fa-user' title='<spring:message code='index.view.icon.email'/>'></i> 
		<input id='signin-email' class='field-input' name='email' value='' />
	</p>

	<p class='field'>
		<i class='field-i fa-lock' title='<spring:message code='index.view.icon.pwd'/>'></i> 
		<input id='signin-pwd' type='password' class='field-input' /> 
		<input id='signin-pwd-salted' type='hidden' name='password' />
	</p>

	<div class="form-field">
		<div id='signin-submit' class='input-btn'>
			<i id='submit-i' class='fa-sign-in'></i>
			<spring:message code='index.view.signin' />
		</div>
	</div>
		
	<div class="form-field">
		<div id="signup-btn" class='input-btn'>
			<i id='signup-btn-i' class='fa-check-square-o'></i>
			<spring:message code='index.view.signup' />
		</div>
	</div>
	
</form>