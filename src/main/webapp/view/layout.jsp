<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!doctype html>

<html lang="fr">

	<head>
		<title><tiles:insertAttribute name="title" ignore="true"/></title>  
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" href="<c:url value="/assets/style/.css/main.css"/>"/>
		<script src="<c:url value="/assets/script/jquery-2.1.4.js"/>"></script>
		<script src="<c:url value="/assets/script/jquery-ui.js"/>"></script>
	    <script>
	        <%-- Factorise quelques options pour JQuery dialog --%>
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
		
		<tiles:insertAttribute name="sidebar"/>
		
		<div id="content">
			<tiles:insertAttribute name="content"/>
		</div>  
	</body>
	
</html>