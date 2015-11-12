<%--
	Cette page permet la création d'un nouvel évènement
--%>

<%@ page language='java' contentType='text/html; charset=ISO-8859-1' isELIgnored='false' pageEncoding='ISO-8859-1'%>
<%@taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@taglib uri='http://www.springframework.org/tags' prefix='spring'%>
<%@taglib uri='http://www.springframework.org/tags/form' prefix='form'%>

<%-- Block de création d'un nouvel évènement --%>

<form:form id='event-form' method='POST' action='/daris/event/add' commandName='event'>
	
<!-- 	<input type="hidden" name="participants[0].id" value="4"/> -->
<!-- 	<input type="hidden" name="activities[0].from" value="4"/> -->
<!-- 	<input type="hidden" name="activities[0].to" value="4"/> -->
<!-- 	<input type="hidden" name="activities[0].locality.id" value="1"/> -->
	
	<div class='col-xs-12 col-md-6'>
	
		<div  class='panel'>
			<h1 class='panel-title'>
				Création d'un nouvel évènement
			</h1>
			
			
				<form:input type='hidden' path='creator.id' value='${sessionScope.user.id}'/>
				
				<div class='form-field'>
					<label for='addEvent-name'><spring:message code='event.field.name'/></label>
					<form:input id='addEvent-name' path='name' value='geageagea'/>
				</div>
				
				<div class='form-field'>
					<label for='addEvent-day'><spring:message code='view.date'/></label>
					<form:input id='addEvent-day' path='day' value='2015-11-03'/>
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
				<em id='event-acts-noone'>Aucune activité ajoutée</em>
			</div>
		</div>
		
		
		<div class='panel'>
			<h1 class='panel-title'>
				<input id='event-user-input' class='input-with-icon' placeholder="Rechercher une personne"/><i class='fa-search input-icon'></i>
			</h1>
			<div id='event-users'>
				<em id='event-user-none'>Aucun membre ajoutée</em>
			</div>
		</div>
		
	</div>
</form:form>

<%@ include file='_script-map.jsp'%>
<%@ include file='_script.jsp'%>
<%@ include file='_script-add_activity.jsp'%>
<%@ include file='_script-add_user.jsp'%>

	
	
