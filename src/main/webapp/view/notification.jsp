<script>
	<c:if test="${not empty NOTIFICATION_ERROR}">
		alert("erreur : ${NOTIFICATION_ERROR}");
	</c:if>
	
	<c:if test="${not empty NOTIFICATION_SUCCESS}">
		alert("erreur : ${NOTIFICATION_SUCCESS}");
	</c:if>
</script>