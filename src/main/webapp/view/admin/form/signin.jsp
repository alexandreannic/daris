<form id='signin-form' method='POST' action='admin/signin'>

	<p class='field'>
		<i class='field-i fa-user' title='<spring:message code='index.admin.view.icon.idf'/>'></i> 
		<input id='signin-idf' class='field-input' name='idf' value='' />
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
	
</form>