<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>

<c:if test="${not empty NOTIFICATION_ERROR}">
	signup_dialog.dialog("open");
</c:if>

</script>