<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored='false' pageEncoding="ISO-8859-1"%>

<script>

<%-- Retenir les elements dans des variables pour ne pas avoir � reparcourir le DOM --%>
var signup_dialog = $('#signup-dialog');
var signup_form = $('#form-signup');
var signup_open = $('#signup-btn');
var signup_input_pwd = $('#signup-password');
var signup_input_pwdConfirm = $('#signup-confirm');
var signup_input_salted = $('#signup-saltedPwd');
var signup_input_firstName = $('#signup-firstName');
var signup_input_lastName = $('#signup-lastName');
var signup_input_email = $('#signup-email');


<%-- Fen�tre d'inscription --%>
signup_dialog.dialog({
	width: 500,
	buttons:
	{
		<%-- Boutton de validation (pas de texte car un icone est d�finie en css) --%>
		' ': function() {
			if(checkInputs($(this))) {
				signup_input_salted.val(CryptoJS.SHA1(signup_input_pwd.val()));
				signup_input_pwd.val('');
				signup_form.submit();
			}
			else {
				alert('<spring:message code="view.checkInputs"/>');
			}
		},
		
		<%-- Boutton de fermeture (pas de texte car un icone est d�finie en css) --%>
		'': function() {
			$(this).dialog('close');
		}
	}
});


<%-- Ouverture de la fen�tre d'inscription --%>
signup_open.click(function() {
	signup_dialog.dialog('open');
});


<%-- V�rification des inputs --%>
signup_input_firstName.validate({
	required: true,
	length: {
		enabled: true,
		minLength: 3,
		maxLength: 32
	}
});

signup_input_lastName.validate({
	required: true,
	length: {
		enabled: true,
		minLength: 3,
		maxLength: 32
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
		maxLength: 32
	},
	password: {
		enabled: true,
		equalsTo: signup_input_pwdConfirm
	}
});

</script>