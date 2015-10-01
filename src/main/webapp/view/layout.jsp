<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!doctype html>

<html lang="en">
<head>
	<title><tiles:insertAttribute name="title" ignore="true"/></title>  
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="@{'/public/css/style.css'}"/>
</head>
<body>
	<nav id="sb">
		<tiles:insertAttribute name="sidebar"/>
	</nav>
	
	<div id="content">
		<tiles:insertAttribute name="content"/>
	</div>  
	
	<script src="js/scripts.js"></script>
</body>
</html>