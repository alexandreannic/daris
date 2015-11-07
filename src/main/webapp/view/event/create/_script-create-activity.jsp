<script>

var activity_add_btn = $("#activiy-add-btn");
var activity_container = $("#activity-container");
var index = 0;

activity_add_btn.click(function() {
	var async_index = index;
	var event =
		"<br/>" +
		"<div class='form-field'>" +
			"<label for='addActivity-locality'><spring:message code='event.activity.field.locality'/></label>" +
			"<input id='addEvent-locality" + index + "'/>" +
			"<input type='hidden' id='addEvent-locality-id" + index + "' name='activities[" + index + "].locality'/>" +
		"</div>" +
		
		"<div class='form-field'>" +
			"<label for='addActivity-from'><spring:message code='event.activity.field.from'/></label>" +
			"<input id='addEvent-from" + index + "' name='activities[" + index + "].from'/>" +
		"</div>" +
			
		"<div class='form-field'>" +
			"<label for='addActivity-to'><spring:message code='event.activity.field.to'/></label>" +
			"<input id='addEvent-to" + index + "' name='activities[" + index + "].to'/>" +
		"</div>";
		
	activity_container.append(event);
	
	$("#addEvent-locality" + index).autocomplete({
		source: function(request, response) {
			$.ajax({
				url: '<c:url value='/locality/getLocalities'/>',
				dataType: 'json',
				data: {info: request.term},
				success: function(data) {
					response($.map(data, function(item) {
						return {
							id: item.id,
							label: item.name,
							value: item.name
						  }
					}));
				}
			});
		},
		minLength: 1,
		select: function(event, ui) {
			$("#addEvent-locality-id" + async_index).val(ui.item.id);
			
		}
	});
	
	$("#addEvent-to" + index).datepicker();
	$("#addEvent-from" + index).datepicker();
	
	index++;
});
</script>