<%--
	Cette page affiche le tableau de bord d'un utilsateur.
--%>
<%@ page language='java' contentType='text/html; charset=ISO-8859-1' isELIgnored='false' pageEncoding='ISO-8859-1'%>
<%@ taglib uri='http://tiles.apache.org/tags-tiles' prefix='tiles'%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@ taglib uri='http://www.springframework.org/tags' prefix='spring'%>
<%@ taglib uri='http://www.springframework.org/tags/form' prefix='form'%>

<div class='col-xs-12 col-md-8'>
	<div class='panel'>
		<h1 class='panel-title'><i class="fa-exclamation-triangle"></i> Exemple affichage popup d'un point d'intérêt</h1>
		Pensez à modifier la base de données. Le fichier est dans le repertoire <strong>ressources</strong>
		
		<br/><br/>
		
       	<strong><a onclick='locality_openPopup(1)' href='#'>Lien qui marche</a></strong>
       	<br/>
       	<strong><a onclick='locality_openPopup(12)' href='#'>Lien qui marche pas !</a></strong>
		
	</div>
</div>

<div class='col-xs-12 col-md-4'>
	<div class='panel'>
	
		<h1 class='panel-title'>Autre chose</h1>
		Blablabla
		<br>
		<br>
		<br>
		<br>
		<br>
		geagea
		<br>
		<br>
		<br>
		<br>
		<br>
		geageagea
		
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		geagae
	</div>
</div>

<%@ include file='../locality/view/get_view.jsp'%>