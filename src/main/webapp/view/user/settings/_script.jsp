<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored='false' pageEncoding="ISO-8859-1"%>

<script>

addWrapperBtn('edit-info', 'fa-pencil-square-o', '<spring:message code="view.edit"/>');

$('.tabs').tabs();


var settings_dialog = $('#dialog-form');
var settings_dialog_btn = $('#edit-info');
var settings_form = $('#edit-form');
var settings_input_firstName = $('#firstName');
var settings_input_lastName = $('#lastName');
var settings_input_address = $('#address');
var settings_input_city = $('#city');

settings_input_firstName.validate({
	required: true,
	length: {
		enabled: true,
		minLength: 3,
		maxLength: 32
	}
});

settings_input_lastName.validate({
	required: false,
	length: {
		enabled: true,
		minLength: 3,
		maxLength: 32
	}
});

settings_input_address.validate({
	required: false,
	length: {
		enabled: true,
		minLength: 3,
		maxLength: 32
	}
});	

settings_input_city.validate({
	required: false,
	length: {
		enabled: true,
		minLength: 3,
		maxLength: 32
	}
});	


settings_dialog.dialog({
	buttons: {
		' ': function() {
			if(checkInputs($(this))) {
				settings_form.submit();
			}
			else {
				alert('<spring:message code="view.checkInputs"/>');
			}
		}, 		
		'': function() {
			$(this).dialog('close');
			settings_input_firstName.val('${user.firstName}');
			settings_input_lastName.val('${user.lastName}');
			settings_input_address.val('${user.address}');
			settings_input_city.val('${user.city}');
		}
	}
});


settings_dialog_btn.click(function() {
	settings_dialog.dialog('open');
});
	
</script>