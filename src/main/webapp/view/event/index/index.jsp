<%--
	Cette page permet d'afficher, de trier et de rechercher les points di'intérêts.
--%>
<%@ page language='java' contentType='text/html; charset=ISO-8859-1' isELIgnored='false' pageEncoding='ISO-8859-1'%>
<%@ taglib uri='http://tiles.apache.org/tags-tiles' prefix='tiles'%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@ taglib uri='http://www.springframework.org/tags' prefix='spring'%>
<%@ taglib uri='http://www.springframework.org/tags/form' prefix='form'%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
 
<div class='col-xs-12 col-md-6'>
	<div class='panel'>
		<h1 class='panel-title'>Evénements inscrits</h1>
		
		<div class='event-row-ct'>
			<c:if test='${fn:length(participated) == 0}'>
				<em>Vous n'êtes inscrits à aucun événement</em>
			</c:if>
			<c:forEach items='${participated}' var='event'>
				<div class='event-row' onclick='window.location="/daris/event/view/${event.id}"'>
					<div class='event-row-img-ct'>
						<img class='event-row-img' src='<c:url value="/assets/img/localities/${event.activities[0].locality.picture}"/>'/>
					</div>
					
					<div class='event-row-field'>
						<div class='event-row-name'>
							${event.name}
						</div>
						<div class='event-row-creator'>
							<div class='event-row-creater-photo'>
								<c:choose>
									<c:when test='${not empty event.creator}'>
										<img class="follow-photo-img" src='<c:url value="/assets/img/users/${event.creator.picture}"/>'/>
									</c:when>
									<c:otherwise>
										<i class="follow-photo-default"></i>
									</c:otherwise>
								</c:choose>
							</div>
							
							<div class='event-row-creator-name'>
								${event.creator.fullName}
							</div>
						</div>
					</div>
					
					<div class='event-row-info'>
						<div>
							Activités <strong>${event.activitiesCount}</strong>
						</div>
						
						<div>
							Inscrits <strong>${event.participantsCount}</strong>
						</div>
					</div>
				</div>
				<hr/>
			</c:forEach>
		</div>
	</div>
</div>


<div class='col-xs-12 col-md-6'>
	<div class='panel'>
		<h1 class='panel-title'>Evénements créés</h1>
		
		<div class='event-row-ct'>
			<c:if test='${fn:length(participated) == 0}'>
				<em>Vous n'avez créé aucun événement</em>
			</c:if>
			<c:forEach items='${created}' var='event'>
				<div class='event-row' onclick='window.location="/daris/event/edit/${event.id}"'>
					<div class='event-row-img-ct'>
						<img class='event-row-img' src='<c:url value="/assets/img/localities/${event.activities[0].locality.picture}"/>'/>
					</div>
					
					<div class='event-row-field'>
						<div class='event-row-name'>
							${event.name}
						</div>
	<%-- 					<a class='event-row-creator' href='/daris/user/view/${event.creator.id}'> --%>
	<!-- 						<div class='event-row-creater-photo'> -->
	<%-- 							<c:choose> --%>
	<%-- 								<c:when test='${not empty event.creator}'> --%>
	<%-- 									<img class="follow-photo-img" src='<c:url value="/assets/img/users/${event.creator.picture}"/>'/> --%>
	<%-- 								</c:when> --%>
	<%-- 								<c:otherwise> --%>
	<!-- 									<i class="follow-photo-default"></i> -->
	<%-- 								</c:otherwise> --%>
	<%-- 							</c:choose> --%>
	<!-- 						</div> -->
							
	<!-- 						<div class='event-row-creator-name'> -->
	<%-- 							${event.creator.fullName} --%>
	<!-- 						</div> -->
	<!-- 					</a> -->
					</div>
					
					<div class='event-row-info'>
						<div>
							Activités <strong>${event.activitiesCount}</strong>
						</div>
						
						<div>
							Inscrits <strong>${event.participantsCount}</strong>
						</div>
					</div>
				</div>
				<hr/>
			</c:forEach>
		</div>
	</div>
</div>


<br id='fix-space'/>


<h1 class='bg-title'>Tous les événements</h1>


<div id='events-header'>
	<input id='events-search' class='input-with-icon' placeholder='Rechercher un événement'/>
	<i class="fa-search input-icon"></i>
	
	<div id='events-count'>${events_count} événements</div>
</div>


<div id='events'>
<%-- 	<c:forEach items='${events}' var='event'> --%>
<!-- 		<div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'> -->
<!-- 			<div class='panel'> -->
<!-- 				<div class='event-box-img-ct'> -->
<%-- 					<a href='<c:url value="/event/view/${event.id}"/>'> --%>
<%-- 						<img class='event-box-img' src='<c:url value="/assets/img/localities/${event.activities[0].locality.picture}"/>'/> --%>
<!-- 					</a> -->
<!-- 				</div> -->
				
<%-- 				<div class='event-box-h1'>${event.name}</div> --%>
<%-- 				<a class='event-box-author' href='/daris/user/view/${event.creator.id}'> --%>
<!-- 					<div class="event-box-author-photo"> -->
<%-- 						<c:choose> --%>
<%-- 							<c:when test='${not empty event.creator}'> --%>
<%-- 								<img class="follow-photo-img" src='<c:url value="/assets/img/users/${event.creator.picture}"/>'/> --%>
<%-- 							</c:when> --%>
<%-- 							<c:otherwise> --%>
<!-- 								<i class="follow-photo-default"></i> -->
<%-- 							</c:otherwise> --%>
<%-- 						</c:choose> --%>
<!-- 					</div> -->
					
<!-- 					<div class='event-box-author-name'> -->
<%-- 						${event.creator.fullName} --%>
<!-- 					</div> -->
<!-- 				</a> -->
<%-- 				Nombre d'étapes : <strong>${event.activitiesCount}</strong> --%>
<!-- 				<br/> -->
<%-- 				Nombre de participants : <strong>${event.participantsCount}</strong> --%>
 	<%-- 			 / ${event.max}</strong> --%>
<!-- 			</div> -->
<!-- 		</div> -->
<%-- 	</c:forEach> --%>
</div>

<%@ include file='_script.jsp'%>
<%@ include file='_script-all_events.jsp'%>

