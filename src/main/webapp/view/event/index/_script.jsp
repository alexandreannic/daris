<script>


addWrapperBtn('event-btn-create', 'fa-plus-circle', 'Cr�er un nouvel �v�nement');

$('#event-btn-create').click(function() {
	window.location = "<c:url value='/event/create'/>";
});


</script>