<%@ page language='java' contentType='text/html; charset=ISO-8859-1' isELIgnored='false' pageEncoding='ISO-8859-1'%>
<%@taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@taglib uri='http://www.springframework.org/tags' prefix='spring'%>
<%@taglib uri='http://www.springframework.org/tags/form' prefix='form'%>

<script>
var act_index = ${event_edited.activitiesCount};
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
						lat: item.latitude,
						name: item.name
					  }
				}));
			}
		});
	},
	minLength: 1,
	select: function(event, ui) {
		if($('#add-act-row' + ui.item.id).length == 0) {
			draw_activity(ui.item);
		}
		return false;
	}
});


<%-- Si on édite un événemlent, récupère les activités --%> 
<c:if test='${event_edited.activitiesCount != 0}'>
	$.ajax({
		url: '<c:url value='/activity/getActivities'/>',
		dataType: 'json',
		data: {id: '${event_edited.id}'},
		success: function(data) {
			$.each(data, function(index, value) {
				draw_activity(value.locality, value.from, value.to);
			});
		}
	});
</c:if>


function draw_activity(item, from, to)
{
	if(from == undefined) from = "";
	if(to == undefined) to = "";
	
	<%-- Prépare les parties de l'élément --%>
	var activity = $('<div>')
		.prop('id', 'add-act-row' + item.id)
		.addClass('add-act-row')
		.prop('id', 'add-act-row' + item.id);
	var img = $('<div>')
		.addClass('add-act-row-img')
		.append($('<img>')
			.prop('src', '/daris/assets/img/localities/' + item.picture)
		);
	
	var name = $('<div>')
		.addClass('add-act-row-name')
		.text(item.name);
	
	var dates = $('<div>')
		.addClass('add-act-row-dates')
		.append($('<div>')
			.addClass('add-act-row-from')
			.html(
					'<div>De : </div>'
				+	'<input id="addEvent-from' + act_index + '" name="activities[' + act_index + '].from" value="' + from + '"/>'
			)
		)
		.append($('<div>')
			.addClass('add-act-row-to')
			.html(	
					'<div>Jusqu\'à : </div>'
				+	'<input id="addEvent-to' + act_index + '" name="activities[' + act_index + '].to" value="' + to + '"/>'
			)
		);
	
	var actions = $('<div>')
		.append($('<i>')
			.prop('id', 'add-act-remove' + item.id)
			.addClass('fa-times')
			.addClass('i-times-light')
			.addClass('i-btn')
		);
	
	<%-- Hidden input pour envoyer l'id de l'event --%>
	var input_id = $('<input>')
		.prop('type', 'hidden')
		.prop('name', 'activities[' + act_index + '].locality.id')
		.val(item.id);
		
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
	$('#add-act-remove' + item.id).click(function () {
		$('#add-act-row' + item.id).remove();
	});

	act_index++;

	<%-- Marque la google map --%>
// 	map_addMarker(item.name, item.lat, item.lng);
// 	panel_map.addClass('focus');
// 	setTimeout(function() {
//        panel_map.removeClass('focus');
//    	}, 100);
}

</script>