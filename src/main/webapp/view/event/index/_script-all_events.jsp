<script>

var event_search = $('#events-search');
var events_container = $('#events');

function load_events(info)
{
	
	$.ajax({
		url: '<c:url value='/event/getEvents'/>',
		dataType: 'json',
		data: {info: event_search.val()},
		success: function(data) {
			events_container.empty();
			$.each(data, function(index, value) {
				create_event(value);	
			});
		}
	});
}

function create_event(event)
{
	var img;
	if(event.creator.picture == null)
		img = "<i class='follow-photo-default'></i>";
	else
		img = "<img class='follow-photo-img' src='/daris/assets/img/users/" + event.creator.picture + "'/>"
	
	var event = 
		"<div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>"
	+		"<div class='panel'>"
	+			"<div class='event-box-img-ct'>"
	+				"<a href='/daris/event/view/" + event.id + "'>"
	+					"<img class='event-box-img' src='/daris/assets/img/localities/" + event.activities[0].locality.picture + "'/>"
	+				"</a>"
	+			"</div>"
				
	+			"<div class='event-box-h1'>" + event.name + "</div>"
	+			"<a class='event-box-author' href='/daris/user/view/" + event.creator.id + "''>"
	+				"<div class='event-box-author-photo'>"
	+					img
	+				"</div>"
					
	+				"<div class='event-box-author-name'>"
	+					event.creator.fullName
	+				"</div>"
	+			"</a>"
	+			"Nombre d'activités : <strong>" + event.activitiesCount + "</strong>"
	+			"<br/>"
	+			"Nombre de participants : <strong>" + event.participantsCount + "</strong>"
	+		"</div>"
	+	"</div>"
	
	events_container.append(event);
}

event_search.keyup(function() {
	load_events(event_search.val());
	$("html, body").animate({ scrollTop: $(document).height() }, 1000);
});

load_events("");

</script>