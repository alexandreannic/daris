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
</head>
<body>
	<nav id="sb">
		<tiles:insertAttribute name="sidebar"/>
	</nav>
	
	<div id="content">
		<tiles:insertAttribute name="content"/>
	</div>  
	
<!-- 	<script src="js/scripts.js"></script> -->
</body>
</html>