<script>

var event_users = $('#event-users');
var event_user_input = $('#event-user-input');
var event_user_none = $('#event-user-none');
var event_user_index = ${event_edited.participantsCount};

event_user_input.autocomplete({
	source: function(request, response) {
		$.ajax({
			url: '<c:url value='/user/getUsers'/>',
			dataType: 'json',
			data: {info: request.term},
			success: function(data) {
				response($.map(data, function(item) {
					return {
						id: item.id,
						label: item.fullName,
						value: item.fullName,
						picture: item.picture,
						fullName: item.fullName
					  }
				}));
			}
		});
	},
	minLength: 1,
	select: function(event, ui) {
		if($('#followed' + ui.item.id).length == 0) {
			draw_user(ui.item);
		}
		return false;
	}
});

function draw_user(user)
{
	var img;
	if(user.picture == null)
		img = '<i class="follow-photo-default"></i>';
	else
		img = '<img class="follow-photo-img" src="/daris/assets/img/users/' + user.picture + '">';
		
	var $user = 
			'<div id="followed' + user.id + '" class="followed col-xs-6 col-sm-4 col-md-12 col-lg-6">'
		+		'<input type="hidden" name="participants[' + event_user_index + '].id" value="' + user.id + '"/>'
		+		'<div class="follow-photo">'
		+			img
		+		'</div>'
		+		'<div class="follow-content">'
		+			'<div class="follow-name">' + user.fullName + '</div>'
		+			'<em><i class="fa-circle"></i> Hors-ligne</i></em>'
		+		'</div>'
		+		'<div class="user-remove">'
		+			'<i id="event-user-remove' + user.id + '" class="i-times-light fa-times i-btn"></i>'
		+		'</div>'
		+	'</div>';
		
	event_user_none.remove();
	event_users.append($user);
	
	<%-- Bind btn remove --%>
	$('#event-user-remove' + user.id).click(function () {
		$('#followed' + user.id).remove();
	});
	
	event_user_index++;
}



<%-- Si on �dite un �v�nemlent, r�cup�re les activit�s --%> 
<c:if test='${event_edited.participantsCount != 0}'>
	$.ajax({
		url: '<c:url value='/user/getUsersByEventId'/>',
		dataType: 'json',
		data: {event_id: '${event_edited.id}'},
		success: function(data) {
			$.each(data, function(index, value) {
				draw_user(value);
			});
		}
	});
</c:if>


</script>