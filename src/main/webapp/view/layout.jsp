<%@ page language='java' contentType='text/html; charset=ISO-8859-1' isELIgnored='false' pageEncoding='ISO-8859-1'%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<c:set var="pageTitle"><tiles:getAsString name="title"/></c:set>

<!doctype html>

<html lang="fr">

	<head>
		<title><spring:message code="${pageTitle}"/>
		</title>  
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" href="<c:url value="/assets/style/.css/main.css"/>"/>
		<script src="<c:url value="/assets/script/jquery-2.1.4.js"/>"></script>
		<script src="<c:url value="/assets/script/jquery-ui.js"/>"></script>
		<script src="<c:url value="/assets/script/sha1.js"/>"></script>
	    <script>
	        <%-- Définis des options par défaut pour les JQuery dialogs --%>
	        $.extend($.ui.dialog.prototype.options, {
	            autoOpen: false,
	            modal: true,
	            resizable: false,
	            width: 500,
	            show: {effect: 'fade', duration: 200},
	        });
	    </script>
	</head>
	
	
	<body>	
		<%@ include file='alert.jsp'%>
			
		<tiles:insertAttribute name="sidebar"/>
		
		<div id="content">
			<tiles:insertAttribute name="content"/>
		</div>  
	</body>
	
</html>