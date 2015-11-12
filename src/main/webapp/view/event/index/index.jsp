<%--
	Cette page permet d'afficher, de trier et de rechercher les points di'intérêts.
--%>
<%@ page language='java' contentType='text/html; charset=ISO-8859-1' isELIgnored='false' pageEncoding='ISO-8859-1'%>
<%@ taglib uri='http://tiles.apache.org/tags-tiles' prefix='tiles'%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@ taglib uri='http://www.springframework.org/tags' prefix='spring'%>
<%@ taglib uri='http://www.springframework.org/tags/form' prefix='form'%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 

<c:forEach items='${events}' var='event'>
	<div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
		<div class='panel'>
			<div class='event-box-img-ct'>
				<a href='<c:url value="/event/view/${event.id}"/>'>
					<img class='event-box-img' src='<c:url value="/assets/img/localities/${event.activities[0].locality.picture}"/>'/>
				</a>
			</div>
			
			<div class='event-box-h1'>${event.name}</div>
			<a class='event-box-author' href='/daris/user/view/${event.creator.id}'>
				<div class="event-box-author-photo">
					<c:choose>
						<c:when test='${not empty event.creator}'>
							<img class="follow-photo-img" src='<c:url value="/assets/img/users/${event.creator.picture}"/>'/>
						</c:when>
						<c:otherwise>
							<i class="follow-photo-default"></i>
						</c:otherwise>
					</c:choose>
				</div>
				
				<div class='event-box-author-name'>
					${event.creator.fullName}
				</div>
			</a>
			Nombre d'étapes : <strong>${event.activitiesCount}</strong>
			<br/>
			Nombre de participants : <strong>${event.participantsCount}</strong>
<%-- 			 / ${event.max}</strong> --%>
		</div>
	</div>
</c:forEach>