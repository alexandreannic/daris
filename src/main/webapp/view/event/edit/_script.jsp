<script>
	var event_add_day = $("#addEvent-day");
	var event_form = $("#event-form");
	
	event_add_day.datepicker();
	
	
	<c:if test='${event_edited.id != null}'>
		changeTitle("Administration de l'événement : ${event_edited.name}");

		<%-- Add remove btn --%>
		addWrapperBtn('event-btn-remove', 'fa-trash-o i-btn', 'Supprimer');
		
		$("#event-btn-remove").click(function() {
			$("#event-remove-form").submit();
		});
	</c:if>
	
	
	<%-- Add save btn --%> 
	addWrapperBtn('event-btn-submit', 'panel-btn-save', 'Valider');
	
	$("#event-btn-submit").click(function() {
		event_form.submit();
	});
	
</script>