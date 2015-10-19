<script>

<%-- Retenir les elements dans des variables pour ne pas avoir ï¿½ reparcourir le DOM --%>
var signup_dialog = $('#signup-dialog');
var signup_signup = $('#form-signup');
var signup_open = $('#btn-signup');
var signup_input_pwd = $('#signup-password');
var signup_input_salted = $('#signup-saltedPwd');


<%-- Fenêtre d'inscription --%>
signup_dialog.dialog({
	width: 500,
	buttons:
	{
		<%-- Boutton de validation (pas de texte car un icone est dï¿½finie en css) --%>
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
		
		<%-- Boutton de fermeture (pas de texte car un icone est dï¿½finie en css) --%>
		'': function() {
			$(this).dialog('close');
		}
	}
});


<%-- Ouverture de la fenï¿½tre d'inscription --%>
signup_open.click(function() {
	signup_dialog.dialog('open');
});

</script>