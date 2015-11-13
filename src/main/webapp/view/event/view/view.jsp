<%--
	Cette page permet d'afficher un événement particulier.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored='false' pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%-- bloack de la fiche détaillée de l'événement --%>
<div class="col-xs-12 col-md-6">
	<div class="panel">
	
		<h1 class="panel-title">
			<c:out value="${event.name}" />
		</h1>
		
		<%-- bouton de participation à l'événement --%>
		<a href="<c:url value="event/attend"/>"><spring:message code='event.view.participate' /></a>
		<br />
		
		<c:out value="${event.description}" />
		<br />
	</div>
</div>


<%-- Right column --%>
<div class='col-xs-12 col-md-6'>
	
	<%-- Pannel users --%>
	<div class='panel'>
		<h1 class='panel-title'>
			<input id='event-user-input' class='input-with-icon' placeholder="Rechercher une personne"/><i class='fa-search input-icon'></i>
		</h1>
		
		<div id='event-users'>
			<em id='event-user-none'>Aucun membre ajouté</em>
		</div>
	</div>
	
</div>



<%@ include file='_script-add_user.jsp'%>
<%@ include file='_script.jsp'%>