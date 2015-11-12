<script>


addWrapperBtn('event-btn-create', 'fa-plus-circle', 'Créer un nouvel événement');

$('#event-btn-create').click(function() {
	window.location = "<c:url value='/event/create'/>";
});


</script>