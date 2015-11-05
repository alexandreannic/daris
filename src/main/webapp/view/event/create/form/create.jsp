<%-- Forluaire de saisie d'un évènement (informations de base) --%>

<%@ page language='java' contentType='text/html; charset=ISO-8859-1' isELIgnored='false' pageEncoding='ISO-8859-1'%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<form:form id='event-form' method='POST' action='/event/add' commandName='event'>

	<div class='form-field'>
		<label for='addEvent-name'><spring:message code='event.field.name'/></label>
		<form:input id='addEvent-name' path='name'/>
	</div>
	
	<div class='form-field'>
		<label for='addEvent-description'><spring:message code='event.field.description'/></label>
		<form:input id='addEvent-description' path='description'/>
	</div>
	
	<div class='form-field'>
		<label for='addEvent-picture'><spring:message code='event.field.picture'/></label>
		<form:input id='addEvent-picture' path='picture'/>
	</div>
	
	<div class="form-field">
		<div id='event-submit' class='input-btn'>
			<i id='submit-i' class='fa-sign-in'></i>
			<spring:message code='index.view.signin' />
		</div>
	</div>
	<br/>

</form:form>

<%-- Forluaire de saisie des activités (avec possibilité d'ajout en AJAX) --%>
<form:form id='activity-form' method='POST' action='activity/add' commandName='activity'>

	<%-- Champs d'une localité : avec propositions en autocompletion + ajout en AJAX --%>
	<div class='form-field'>
		<label for='addActivity-locality'><spring:message code='event.activity.field.locality'/></label>
		<form:input id='addEvent-locality' path='locality'/>
	</div>
	
	<%-- Champs d'une activité --%>
	<div class='form-field'>
		<label for='addActivity-from'><spring:message code='event.activity.field.from'/></label>
		<form:input id='addEvent-from' path='from'/>
	</div>
		
	<div class='form-field'>
		<label for='addActivity-to'><spring:message code='event.activity.field.to'/></label>
		<form:input id='addEvent-to' path='to'/>
	</div>
	
	<div class='form-field'>
		<label for='addActivity-comment'><spring:message code='event.activity.field.comment'/></label>
		<form:input id='addEvent-comment' path='comment'/>
	</div>
	
	<div class="form-field">
		<div id='activity-submit' class='input-btn'>
			<i id='submit-i' class='fa-sign-in'></i>
			<spring:message code='event.create.submit' />
		</div>
	</div>
	
</form:form>