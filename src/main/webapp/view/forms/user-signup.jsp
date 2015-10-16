<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<form:form id="form-signup" commandName="user" method="POST" action="signup">
	<div class="form-field">
		<label for="signup-firstName"><spring:message code="user.field.firstName"/></label>
		<form:input id="signup-firstName" path="firstName"/>
	</div>
	
	<div class="form-field">
		<label for="signup-lastName"><spring:message code="user.field.lastName"/></label>
		<form:input id="signup-lastName" path="lastName"/>
	</div>
	
	<div class="form-field">
		<label for="signup-email"><spring:message code="user.field.email"/></label>
		<form:input id="signup-email" path="email" type="email"/>
	</div>
	
	<br/>
	
	<div class="form-field">
		<label for="signup-password" for="password"><spring:message code="user.field.password"/></label>
		<input id="signup-password" type="password"/>
		<form:input id="signup-saltedPwd" type="hidden" path="password" />
	</div>
	
	<div class="form-field">
		<label for="signup-confirm" for="password"><spring:message code="user.field.password.confirm"/></label>
		<form:input id="signup-confirm" path="password" type="password"/>
	</div>
</form:form>



<script>

	$("#signup-firstName").validate({
		required: true,
		length: {
			enabled: true,
			minLength: 2,
			maxLength: 5
		}
	});
	
	$("#signup-lastName").validate({
		required: true,
		length: {
			enabled: true,
			minLength: 2,
			maxLength: 5
		}
	});
	
	$("#signup-email").validate({
		required: true,
		email: {
			enabled: true
		}
	});	
	
	$("#signup-password").validate({
		required: true,
		length: {
			enabled: true,
			minLength: 2,
			maxLength: 5
		},
		password: {
			enabled: true,
			equalsTo: "#signup-confirm"
		}
	});
</script>