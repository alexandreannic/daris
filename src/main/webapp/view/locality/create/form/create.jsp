<%-- Formulaire de saisie d'une localit� --%>

<%@ page language='java' contentType='text/html; charset=ISO-8859-1' isELIgnored='false' pageEncoding='ISO-8859-1'%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<form:form id='locality-form' method='POST' action='locality/add' commandName='locality'>

	<div class='form-field'>
		<label for='addLocality-name'><spring:message code='locality.field.name' /></label>
		<form:input id='addLocality-name' path='name'/>
	</div>
	
	<div class='form-field'>
		<label for='addLocality-address'><spring:message code='locality.field.address' /></label>
		<form:input id='addLocality-address' path='address'/>
	</div>
	
	<div class='form-field'>
		<label for='addLocality-ZIPCode'><spring:message code='locality.field.ZIPCode' /></label>
		<form:input id='addLocality-ZIPDCode' path='ZIPCode'/>
	</div>
	
	<div class='form-field'>
		<label for='addLocality-picture'><spring:message code='locality.field.picture' /></label>
		<form:input id='addLocality-pricture' path='picture'/>
	</div>
	
	<div class='form-field'>
		<label for='addLocality-type'><spring:message code='locality.field.type' /></label>
		<form:input id='addLocality-type' path='type'/>
	</div>
	
	<div class='form-field'>
		<label for='addLocality-description'><spring:message code='locality.field.description' /></label>
		<form:input id='addLocality-description' path='description'/>
	</div>
	
	<div class='form-field'>
		<label for='addLocality-note'><spring:message code='locality.field.note' /></label>
		<form:input id='addLocality-note' path='note'/>
	</div>
	
	<div class='form-field'>
		<label for='addLocality-price'><spring:message code='locality.field.price' /></label>
		<form:input id='addLocality-price' path='price'/>
	</div>
	
	<div class='form-field'>
		<label for='addLocality-latitude'><spring:message code='locality.field.latitude' /></label>
		<form:input id='addLocality-latitude' path='latitude'/>
	</div>
	
	<div class='form-field'>
		<label for='addLocality-longetude'><spring:message code='locality.field.longetude' /></label>
		<form:input id='addLocality-longetude' path='longetude'/>
	</div>
	
	<div class="form-field">
		<div id='locality-submit' class='input-btn'>
			<i id='submit-i' class='fa-sign-in'></i>
			<spring:message code='locality.create.submit' />
		</div>
	</div>
	
	<br/>

</form:form>