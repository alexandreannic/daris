<script>

<%-- Retenir les elements pour ne pas avoir à reparcourir le DOM --%>
var signup_dialog = $("#signup-dialog");
var form_singup = $("#form-signup");
var btn_signup = $("#btn-signup");
var input_pwd = $("#signup-password");
var input_salted = $("#signup-saltedPwd");


<%-- Fenêtre d'inscription --%>
signup_dialog.dialog({
	width: 500,
	buttons: {
		" ": function() {
			if(checkInputs($(this))) {
				alert();
			}
			else {
				input_salted.val(CryptoJS.SHA1("aa"));
				input_pwd.val("");
				form_singup.submit();
			}
		},
		
		"": function() {
			$(this).dialog("close");
		}
	},			
	open: function(event, ui) {
		$(".validateTips").hide();
	}
});


<%-- Ouverture de la fenêtre d'inscription --%>
btn_signup.click(function() {
	signup_dialog.dialog("open");
});
	

</script>