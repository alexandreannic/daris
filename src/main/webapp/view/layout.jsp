<%@ page language='java' contentType='text/html; charset=ISO-8859-1' isELIgnored='false' pageEncoding='ISO-8859-1'%>
<%@ taglib uri='http://tiles.apache.org/tags-tiles' prefix='tiles'%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri='http://www.springframework.org/tags' prefix='spring'%>
<%@ taglib uri='http://www.springframework.org/tags/form' prefix='form'%>

<c:set var='title'><tiles:getAsString name='title'/></c:set>

<!doctype html>

<html lang='fr'>

	<head>
		<title><spring:message code='${title}'/> </title>  
		<meta charset='ISO-8859-1'>
		<link rel='shortcut icon' href='<c:url value='/assets/img/favicon.ico'/>' />
		<link rel='stylesheet' type='text/css' href='<c:url value='/assets/style/.css/main.css'/>'/>
		<script src='<c:url value='/assets/script/jquery-2.1.4.js'/>'></script>
		<script src='<c:url value='/assets/script/jquery-ui.js'/>'></script>
		<script src='<c:url value='/assets/script/jquery-ui-timepicker.js'/>'></script>
		<script src='<c:url value='/assets/script/sha1.js'/>'></script>
		<script src='<c:url value='/assets/script/validate.js'/>'></script>
		<script src='<c:url value='/assets/script/highcharts/highcharts.js'/>'></script>
		<script src='<c:url value='/assets/script/jquery-ui.autosize.min.js'/>'></script>
	    <script>
	        <%-- Options par défaut pour les JQuery dialogs --%>
	        $.extend($.ui.dialog.prototype.options, {
	            autoOpen: false,
	            modal: true,
	            resizable: false,
	            width: 500,
	            show: {effect: 'fade', duration: 200},
	        });
	        
	        <%-- Options par défaut pour les JQuery datePicker --%>
	        var defaultFormat = {dateFormat: 'yy-mm-dd'};
	        $.datepicker.setDefaults(defaultFormat); 
	        
       		<%-- Permet de changer de titre dynamiquement --%>
 	        function changeTitle(title) {
 	        	$('title').text(title);
 	        	$('#wrapper-title').text(title);
 	        }
 	        
 	       	<%-- Définit un titre indiqué par le controller --%>
	        <c:if test='${not empty pageTitle}'>
       			changeTitle('${pageTitle}');
	        </c:if>
	        
	        <%-- Fonction d'ajoutant un bouton au wrapper --%>
	        function addWrapperBtn(id, btnClass, tooltip, action)
	        {
	        	var elt = $('<i>')
	        		.addClass('wrapper-btn')
	        		.addClass('i-btn')
	        		.addClass(btnClass)
	        		.prop('title', tooltip)
	        		.prop('id', id)
	        		.prop('onclick', action)
	        		.tooltip();
	        	
	        	addWrapperElt(elt);
	        }
	        
	        <%-- Fonction ajoutant un élément au wrapper --%>
	        function addWrapperElt(elt)
	        {
	        	$("#wrapper-actions").append(elt);
	        }
	    </script>
	</head>
	
	
	<body>
		<%@ include file='alert.jsp'%>
		
			
		<%-- Affiche la sidebar uniquement si l'utilisateur est connecté --%>
		<c:choose>
			<c:when test='${not empty sessionScope.user}'>
				<div id='sb-container'>
					<%@ include file='sidebar.jsp'%>
				</div>
			</c:when>
			<c:when test='${not empty sessionScope.session_admin}'>
				<div id='sb-container'>
					<%@ include file='admin/sidebar.jsp'%>
				</div>
			</c:when>
		</c:choose>
		
		<div id='page'>
		
			<%-- Affiche le wrapper uniquement si l'utilisateur est connecté --%>
			<c:if test='${not empty sessionScope.user || not empty sessionScope.session_admin}'>
				<div id='wrapper'>
					<h1 id='wrapper-title'><spring:message code='${title}'/></h1>
					<div id="wrapper-actions"></div>
				</div>
			</c:if>
		
			<div id='content'>
				<tiles:insertAttribute name='content'/>
			</div>
		</div>
		
	</body>
	
</html>