<%@ page language='java' contentType='text/html; charset=ISO-8859-1' isELIgnored='false' pageEncoding='ISO-8859-1'%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<c:set var="title"><tiles:getAsString name="title"/></c:set>

<!doctype html>

<html lang="fr">

	<head>
		<title><spring:message code="${title}"/> </title>  
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" href="<c:url value="/assets/style/.css/main.css"/>"/>
		<script src="<c:url value="/assets/script/jquery-2.1.4.js"/>"></script>
		<script src="<c:url value="/assets/script/jquery-ui.js"/>"></script>
		<script src="<c:url value="/assets/script/sha1.js"/>"></script>
		<script src="<c:url value="/assets/script/validate.js"/>"></script>
	    <script>
	        <%-- Définis des options par défaut pour les JQuery dialogs --%>
	        $.extend($.ui.dialog.prototype.options, {
	            autoOpen: false,
	            modal: true,
	            resizable: false,
	            width: 500,
	            show: {effect: 'fade', duration: 200},
	        });
	        
	        
	        $(function() {
        		<%-- Permet de changer de titre dynamiquement --%>
	 	        function changeTitle(title) {
	 	        	$("title").text(title);
	 	        	$("#wrapper-title").text(title);
	 	        }
	 	        
	 	       	<%-- Définit un titre indiqué par le controller --%>
		        <c:if test="${not empty pageTitle}">
	       			changeTitle("${pageTitle}");
		        </c:if>
	        });
	        
	    </script>
	</head>
	
	
	<body>
		<%@ include file='alert.jsp'%>
		
			
		<%-- Affiche la sidebar uniquement si l'utilisateur est connecté --%>
		<c:if test="${not empty sessionScope.user}">
			<div id="sb-container">
				<%@ include file='sidebar.jsp'%>
			</div>
		</c:if>
		
		
		<div id="page">
		
			<%-- Affiche le wrapper uniquement si l'utilisateur est connecté --%>
			<c:if test="${not empty sessionScope.user}">
				<div id="wrapper">
					<div id="wrapper-title"><spring:message code="${title}"/></div>
				</div>
			</c:if>
		
			<div id="content">
				<tiles:insertAttribute name="content"/>
			</div>
		</div>
	</body>
	
</html>