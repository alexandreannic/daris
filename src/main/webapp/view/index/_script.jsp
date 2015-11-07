<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored='false' pageEncoding="ISO-8859-1"%>

<script>

<c:if test="${not empty NOTIFICATION_ERROR}">
	signup_dialog.dialog("open");
</c:if>

</script>