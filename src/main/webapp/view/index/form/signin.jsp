<form id='signin-form' method='POST' action='signin'>
	<p class='field'>
		<i class='field-i fa-user'
			title='<spring:message code='home.view.icon.email'/>'></i> <input
			id='signin-email' class='field-input' name='email' value='' />
	</p>

	<p class='field'>
		<i class='field-i fa-lock'
			title='<spring:message code='home.view.icon.pwd'/>'></i> <input
			id='signin-pwd' type='password' class='field-input' /> <input
			id='signin-pwd-salted' type='hidden' name='password' />
	</p>

	<div id='signin-submit' class='input-btn'>
		<i id='submit-i' class='fa-sign-in'></i>
		<spring:message code='home.view.signin.btn' />
	</div>
</form>