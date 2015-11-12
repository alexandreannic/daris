<%--
	Cette page permet la création d'un nouvel événement
--%>

<%@ page language='java' contentType='text/html; charset=ISO-8859-1' isELIgnored='false' pageEncoding='ISO-8859-1'%>
<%@taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@taglib uri='http://www.springframework.org/tags' prefix='spring'%>
<%@taglib uri='http://www.springframework.org/tags/form' prefix='form'%>


<form:form id='event-form' method='POST' action='/daris/event/add' commandName='event'>
	
	<div class='col-xs-12 col-md-6'>
	
		<div  class='panel'>
			<h1 class='panel-title'>
				Création d'un nouvel événement
			</h1>
			
			
				<form:input type='hidden' path='creator.id' value='${sessionScope.user.id}'/>
				
				<div class='form-field'>
					<label for='addEvent-name'><spring:message code='event.field.name'/></label>
					<form:input id='addEvent-name' path='name'/>
				</div>
				
				<div class='form-field'>
					<label for='addEvent-day'><spring:message code='view.date'/></label>
					<form:input id='addEvent-day' path='day'/>
				</div>
				
<!-- 				<div class='form-field'> -->
<%-- 					<label for='addEvent-picture'><spring:message code='event.field.picture'/></label> --%>
<%-- 					<form:input id='addEvent-picture' path='picture'/> --%>
<!-- 				</div> -->
				
<!-- 				<div class='form-field'> -->
<%-- 					<label for='addEvent-picture'><spring:message code='event.field.max'/></label> --%>
<%-- 					<form:input type='number' id='addEvent-number' path='max' min='1' value='2'/> --%>
<!-- 				</div> -->
				
				<div class='form-field'>
					<label><spring:message code='field.description'/></label>
					<form:textarea path='description'/>
				</div>
		</div>
		
		<div id='panel-map' class='panel'>
			<h1 class='panel-title'>
				<spring:message code=''/>
			</h1>
			
			<div id='map'>
			</div>
		</div>
		
	</div>
	


	<div class='col-xs-12 col-md-6'>
	
		<div class='panel'>
			<h1 class='panel-title'>
				<input id='event-act-input' class='input-with-icon' placeholder="Rechercher un point d'intérêt"/><i class='fa-search input-icon'></i>
			</h1>
			<div id='event-acts'>
			</div>
		</div>
		
		
		<div class='panel'>
			<h1 class='panel-title'>
				<input id='event-user-input' class='input-with-icon' placeholder="Rechercher une personne"/><i class='fa-search input-icon'></i>
			</h1>
			<div id='event-users'>
				<c:choose>
					<c:when test='${event_edited == null && event_edited.participantsCount > 0}'>
						<em id='event-user-none'>Aucun membre ajoutée</em>
					</c:when>
					<c:otherwise>
						<c:forEach items='${event_edited.participants}' var='participant'>
							<div>
								${participant.fullName}
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		
	</div>
</form:form>

<%@ include file='_script-map.jsp'%>
<%@ include file='_script.jsp'%>
<%@ include file='_script-add_activity.jsp'%>
<%@ include file='_script-add_user.jsp'%>

	
	
