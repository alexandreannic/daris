<%-- 
	Forluaire de saisie d'un évènement (informations de base) 
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored='false' pageEncoding="ISO-8859-1"%>
<%@taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@taglib uri='http://www.springframework.org/tags' prefix='spring'%>
<%@taglib uri='http://www.springframework.org/tags/form' prefix='form'%>

<form:form id='event-form' method='POST' action='/daris/event/add' commandName='event'>

	<div class='form-field'>
		<label for='addEvent-name'><spring:message code='event.field.name'/></label>
		<form:input id='addEvent-name' path='name' value='okgea'/>
	</div>
	
	<div class='form-field'>
		<label for='addEvent-description'><spring:message code='event.field.description'/></label>
		<form:input id='addEvent-description' path='description' value='okgea'/>
	</div>
	
	<div class='form-field'>
		<label for='addEvent-picture'><spring:message code='event.field.picture'/></label>
		<form:input id='addEvent-picture' path='picture'/>
	</div>
	
	<div class='form-field'>
		<label><spring:message code='field.note'/></label>
		<form:textarea path='note'/>
	</div>
	
	

	<div id=activity-container>
	<div class='form-field'>
			<label for='addActivity-locality'><spring:message code='event.activity.field.locality'/></label>
			<input id='addEvent-locality index '/>
			<form:input type='hidden' id='addEvent-locality-id0 ' path='activities[0].locality' value='1'/>
		</div>
		
		<div class='form-field'>
			<label for='addActivity-from'><spring:message code='event.activity.field.from'/></label>
			<form:input id='addEvent-from0 ' path='activities[0].from' value="2015-01-01"/>
		</div>
			
		<div class='form-field'>
			<label for='addActivity-to'><spring:message code='event.activity.field.to'/></label>
			<form:input id='addEvent-to0 ' path='activities[0].to' value="2015-01-01"/>
		</div>;
	</div>
	
	<div class='form-field'>
			<label for='addActivity-locality'><spring:message code='event.activity.field.locality'/></label>
			<input id='addEvent-locality index '/>
			<form:input type='hidden' id='addEvent-locality-id0 ' path='activities[1].locality' value='1'/>
		</div>
		
		<div class='form-field'>
			<label for='addActivity-from'><spring:message code='event.activity.field.from'/></label>
			<form:input id='addEvent-from0 ' path='activities[1].from' value="2015-01-01"/>
		</div>
			
		<div class='form-field'>
			<label for='addActivity-to'><spring:message code='event.activity.field.to'/></label>
			<form:input id='addEvent-to0 ' path='activities[1].to' value="2015-01-01"/>
		</div>
	</div>
	
	
</form:form>

<%@ include file='_script-create.jsp'%>
<%@ include file='_script-create-activity.jsp'%>
