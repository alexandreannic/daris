<script>
	var event_add_day = $("#addEvent-day");
	var event_form = $("#event-form");
	
	event_add_day.datepicker();
	
	addWrapperBtn('event-btn-submit', 'panel-btn-save', 'Valider');
	
	$("#event-btn-submit").click(function() {
		event_form.submit();
	});
</script>