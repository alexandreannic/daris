<form:form id='edit-form' action='edit' commandName='user' methode='POST'>
	<div class="form-field">
		<label for="firstName"><spring:message code='user.field.firstName'/></label> 
		<input type="text" name="firstName" id="firstName" value="${user.firstName}">
	</div>
	
	<div class="form-field">	
		<label for="lastName"><spring:message code='user.field.lastName'/></label> 
		<input type="text" name="lastName" id="lastName" value="${user.lastName}">
	</div>
	
	<div class="form-field">	
		<label for="address"><spring:message code='field.address'/></label> 
		<input type="text" name="address" id="address" value="${user.address}" >
	</div>
	
	<div class="form-field">	
		<label for="city"><spring:message code='field.city'/></label> 
		<input type="text" name="city" id="city" value="${user.city}">
	</div>
</form:form>