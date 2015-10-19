<script>

<%-- Retenir les elements dans des variables pour ne pas avoir à reparcourir le DOM --%>
var signup_dialog = $('#signup-dialog');
var signup_signup = $('#form-signup');
var signup_open = $('#btn-signup');
var signup_input_pwd = $('#signup-password');
var signup_input_pwdConfirm = $('#signup-confirm');
var signup_input_salted = $('#signup-saltedPwd');
var signup_input_firstName = $('#signup-firstName');
var signup_input_lastName = $('#signup-lastName');
var signup_input_email = $('#signup-email');


<%-- Fenêtre d'inscription --%>
signup_dialog.dialog({
	width: 500,
	buttons:
	{
		<%-- Boutton de validation (pas de texte car un icone est définie en css) --%>
		' ': function() {
			if(checkInputs($(this))) {
				alert('<spring:message code="view.checkInputs"/>');
			}
			else {
				signup_input_salted.val(CryptoJS.SHA1(signup_input_pwd.val()));
				signup_input_pwd.val('');
				signup_signup.submit();
			}
		},
		
		<%-- Boutton de fermeture (pas de texte car un icone est définie en css) --%>
		'': function() {
			$(this).dialog('close');
		}
	}
});


<%-- Ouverture de la fenêtre d'inscription --%>
signup_open.click(function() {
	signup_dialog.dialog('open');
});


<%-- Vérification des inputs --%>
signup_input_firstName.validate({
	required: true,
	length: {
		enabled: true,
		minLength: 2,
		maxLength: 5
	}
});

signup_input_lastName.validate({
	required: true,
	length: {
		enabled: true,
		minLength: 2,
		maxLength: 5
	}
});

signup_input_email.validate({
	required: true,
	email: {
		enabled: true
	}
});	

signup_input_pwd.validate({
	required: true,
	length: {
		enabled: true,
		minLength: 2,
		maxLength: 5
	},
	password: {
		enabled: true,
		equalsTo: signup_input_pwdConfirm
	}
});

</script>