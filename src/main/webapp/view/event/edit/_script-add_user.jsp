<script>

var event_users = $('#event-users');
var event_user_input = $('#event-user-input');
var event_user_none = $('#event-user-none');
var event_user_index = 0;

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
						picture: item.picture
					  }
				}));
			}
		});
	},
	minLength: 1,
	select: function(event, ui) {
		if($('#followed' + ui.item.id).length == 0) {
			var img;
			if(ui.item.picture == null)
				img = '<i class="follow-photo-default"></i>';
			else
				img = '<img class="follow-photo-img" src="/daris/assets/img/users/' + ui.item.picture + '">';
				
			var user = 
					'<div id="followed' + ui.item.id + '" class="followed col-xs-6 col-sm-4 col-md-12 col-lg-6">'
				+		'<input type="hidden" name="participants[' + event_user_index + '].id" value="' + ui.item.id + '"/>'
				+		'<div class="follow-photo">'
				+			img
				+		'</div>'
				+		'<div class="follow-content">'
				+			'<div class="follow-name">' + ui.item.label + '</div>'
				+			'<em><i class="fa-circle"></i> Hors-ligne</i></em>'
				+		'</div>'
				+		'<div class="user-remove">'
				+			'<i id="event-user-remove' + ui.item.id + '" class="i-times-light fa-times i-btn"></i>'
				+		'</div>'
				+	'</div>';
				
			event_user_none.remove();
			event_users.append(user);
			
			<%-- Bind btn remove --%>
			$('#event-user-remove' + ui.item.id).click(function () {
				$('#followed' + ui.item.id).remove();
			});
			
			event_user_index++;
		}
		return false;
	}
});

</script>