<script>
<%-- Retenir les elements dans des variables pour ne pas avoir a reparcourir le DOM --%>
	var locality_form = $('#locality-form');
	var locality_submit = $('#locality-submit');

	locality_submit.click(function() {
		locality_form.submit();
	});
</script>