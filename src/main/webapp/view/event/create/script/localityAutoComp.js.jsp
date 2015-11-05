<%-- 
	Script permettant de récupérer les noms des localités existante en
	temps réel selon les caractères saisis par l'utilisateur
 --%>

<script>
	$(document).ready(function() {
		$('#addEvent-locality').autocomplete({

			serviceUrl : "/locality/getLocalities",
			paramName : "tagName",
			delimiter : ",",

			transformResult : function(response) {
				
				return {
					// conversion des résultats en JSON
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