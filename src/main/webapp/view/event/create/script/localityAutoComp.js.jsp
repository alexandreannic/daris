<%-- 
	Script permettant de r�cup�rer les noms des localit�s existante en
	temps r�el selon les caract�res saisis par l'utilisateur
 --%>

<script>
	$(document).ready(function() {
		$('#addEvent-locality').autocomplete({

			serviceUrl : "/locality/getLocalities",
			paramName : "tagName",
			delimiter : ",",

			transformResult : function(response) {
				
				return {
					// conversion des r�sultats en JSON
					suggestions : $.map($.parseJSON(response), function(item) {
						return {
							value : item.name,
							data : item.locatityId
						};
					})
				}

			}

		});
	});
</script>