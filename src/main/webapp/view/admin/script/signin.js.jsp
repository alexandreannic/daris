<script>
<%-- Retenir les elements dans des variables pour ne pas avoir a reparcourir le DOM --%>
	var signin_form = $('#signin-form');
	var signin_pwd = $('#signin-pwd');
	var signin_pwd_salted = $('#signin-pwd-salted');
	var signin_submit = $('#signin-submit');

	<%-- Section dédiée au cryptage du mot de passe avant l'envoie 
	     (*** annulée pour le moment car on créél'admin en dur dans la BDD !! ***) --%>
	signin_submit.click(function() {
		signin_pwd_salted.val(signin_pwd.val());
		signin_pwd.val('');
		signin_form.submit();
	});
</script>