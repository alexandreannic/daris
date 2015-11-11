<script>
	
	<%-- Envoyer le formulaire de l'�v�nement --%>
	var event_form = $('#event-form');
	var event_submit = $('#event-submit');

	event_submit.click(function() {
		event_form.submit();
	});
	
	<%-- Ajouter la nouvelle activit� en asynchrone et l'afficher dans la page --%>
	var activity_form = $('#activity-form');
	var activity_submit = $('#activity-submit');

	activity_submit.click(function() {
		
		// R�cup�rer les valeurs saisies dans le formulaire
	    var locality = $('#addEvent-locality').val();
	    var from = $('#addEvent-from').val();
	    var to = $('#addEvent-to').val();
	    var comment = $('#addEvent-comment').val();
	      
	    var json = { "locality" : locality, "from" : from, "to": to, "comment" : comment};
	    
	    // lancer la requ�te en asynchrone
	    $.ajax({
	        url: $("#activity-form").attr( "action"),
	        data: JSON.stringify(json),
	        type: "POST",
	         
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader("Accept", "application/json");
	            xhr.setRequestHeader("Content-Type", "application/json");
	        },
	        
	        // une fois l'activit� ajout�e, l'afficher dans la partie �v�nement
	        success: function(activitty) {
	            var respContent = "";
	             
	            respContent += "<span class='activity'> Activite: [";
	            respContent += activitty.locality + " : ";
	            respContent += activitty.from + " : " ;
	            respContent += activitty.to + "]</span>";
	             
	            $("#event-form").html(respContent);         
	        }
	        
	    });
	    
	});
	
	var addEvent_input_name = $(".addEvent-locality");
	var addEvent_input_id = $(".addEvent-locality-id");
</script>