<script>
	<%-- Retenir les elements dans des variables pour ne pas avoir a reparcourir le DOM --%>
	var locality_new_dialog = $('#locality-new-dialog');
	var locality_new_btn = $('#locality-new-btn');
	var locality_form = $('#locality-form');
	var locality_submit = $('#locality-submit');

	
	locality_new_btn.click(function() {
		locality_new_dialog.dialog('open');	
	});
	
	
	locality_new_dialog.dialog({
		width: 500,
		buttons:
		{
			<%-- Boutton de validation (pas de texte car un icone est définie en css) --%>
			' ': function() {
				if(checkInputs($(this))) {
					locality_form.submit();
				}
				else {
					alert('<spring:message code='view.checkInputs'/>');
				}
			},
			
			<%-- Boutton de fermeture (pas de texte car un icone est définie en css) --%>
			'': function() {
				$(this).dialog('close');
			}
		}
	});
	
	
	$('#addLocality-ZIP').validate({
		required: true,
		regex: {
			enabled: true,
			regex: /^\d{5}$/,
			message: '<spring:message code='locality.view.input.validate.zip'/>'
		}
	});
	
	$('#addLocality-name').validate({
		required: true,
		length: {
			enabled: true,
			minLength: 3,
			maxLength: 32
		}
	});
	
	$('#addLocality-address').validate({
		required: true,
		length: {
			enabled: true,
			minLength: 3,
			maxLength: 32
		}
	});
</script>