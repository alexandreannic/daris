<%--
	Cette page permet d'afficher un événement particulier.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored='false' pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%-- bloack de la fiche détaillée de l'événement --%>
<div class="col-xs-12 col-md-8">
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

<%-- bloack de la carte --%>
<div class="col-xs-12 col-md-8">
	<div id="map" class="panel"></div>
	
	<script type="text/javascript">
		var map;
		function initMap() {
			map = new google.maps.Map(document.getElementById('map'), {
				center : {
					lat : 100,
					lng : 1100
				},
				zoom : 8
			});
		}
	</script>
</div>



<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA93ma1bj-uq8h9BoDcwQgee7EcKPhX778=initMap">
</script>

<%-- bloack des activités --%>
<div class="col-xs-12 col-md-8">
	<div class="panel">
	
		<h1 class="panel-title"><spring:message code='event.view.activities' /></h1>
		
		<c:forEach items="${activities}" var="activity">
		
			<%-- visualisation d'une activité (lien vers la localié + horraires) --%>
			<c:url value="/locality/view" var="url">
				<c:param name="localityId" value="${activity.id}" />
			</c:url>
			
			<a href="${url}"><c:out value="${activity.locality.name}" /></a>
			<br />
			
			<c:out value="${activity.from}" /> - <c:out value="${activity.to}" />
			<br />
			
		</c:forEach>
	</div>
</div>

<%-- bloack des participants --%>
<!-- <div class="col-xs-12 col-md-8"> -->
<!-- 	<div class="panel"> -->
	
<%-- 		<h1 class="panel-title"><spring:message code='event.view.participants' /></h1> --%>
		
<%-- 		<c:forEach items="${participantList}" var="participant"> --%>
		
<%-- 			<%-- visualisation des participants --%> --%>
<%-- 			<c:url value="/user/view" var="url"> --%>
<%-- 				<c:param name="userId" value="${participant.userId}" /> --%>
<%-- 			</c:url> --%>
			
<%-- 			<a href="${url}"><c:out value="${participant.name}" /></a> --%>
<!-- 			<br /> -->
			
<%-- 		</c:forEach> --%>
		
<!-- 	</div> -->
<!-- </div> -->