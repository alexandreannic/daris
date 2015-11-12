<script>
var act_index = 0;
var event_acts = $('#event-acts');
var event_act_input = $('#event-act-input');
var panel_map = $("#panel-map");

event_act_input.autocomplete({
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
						value: item.name,
						picture: item.picture,
						lng: item.longetude,
						lat: item.latitude
					  }
				}));
			}
		});
	},
	minLength: 1,
	select: function(event, ui) {
		if($('#add-act-row' + ui.item.id).length == 0) {
			<%-- Prépare les parties de l'élément --%>
			var activity = $('<div>')
				.prop('id', 'add-act-row' + ui.item.id)
				.addClass('add-act-row')
				.prop('id', 'add-act-row' + ui.item.id);
			var img = $('<div>')
				.addClass('add-act-row-img')
				.append($('<img>')
					.prop('src', '/daris/assets/img/localities/' + ui.item.picture)
				);
			
			var name = $('<div>')
				.addClass('add-act-row-name')
				.text(ui.item.label);
			
			var dates = $('<div>')
				.addClass('add-act-row-dates')
				.append($('<div>')
					.addClass('add-act-row-from')
					.html(
							'<div>De : </div>'
						+	'<input id="addEvent-from' + act_index + '" name="activities[' + act_index + '].from" value="' + ui.item.id + '"/>'
					)
				)
				.append($('<div>')
					.addClass('add-act-row-to')
					.html(	
							'<div>Jusqu\'à : </div>'
						+	'<input id="addEvent-to' + act_index + '" name="activities[' + act_index + '].to"/>'
					)
				);
			
			var actions = $('<div>')
				.append($('<i>')
					.prop('id', 'add-act-remove' + ui.item.id)
					.addClass('fa-times')
					.addClass('i-times-light')
					.addClass('i-btn')
				);
			
			<%-- Hidden input pour envoyer l'id de l'event --%>
			var input_id = $('<input>')
				.prop('type', 'hidden')
				.prop('name', 'activities[' + act_index + '].locality.id')
				.val(ui.item.id);
				
			<%-- Forme l'élément --%>
			activity
				.append(img)
				.append(name)
				.append(dates)
				.append(input_id)
				.append(actions);
			
			<%-- Ajoute l'élément --%>
			$('#event-acts-noone').remove();
			event_acts.append(activity);
			event_act_input.val('');
			
			<%-- Init timepicker --%>
			$('#addEvent-from' + act_index).timepicker();
			$('#addEvent-to' + act_index).timepicker();
			
			<%-- Bind btn remove --%>
			$('#add-act-remove' + ui.item.id).click(function () {
				$('#add-act-row' + ui.item.id).remove();
			});

			act_index++;

			<%-- Marque la google map --%>
			console.log(ui.item.lat);
			console.log(ui.item.lng);
			map_addMarker(ui.item.name, ui.item.lat, ui.item.lng);
			panel_map.addClass('focus');
			setTimeout(function() {
		       panel_map.removeClass('focus');
		   	}, 100);
		}
		
		return false;
	}
});

</script>