$(document).ready(function() {

	$(".tab_content").hide();

	$(".tab_content:first").show(); 

	$("ul.tabs li").click(function() {
		$("ul.tabs li").removeClass("active");
		$(this).addClass("active");
		$(".tab_content").hide();
		var activeTab = $(this).attr("rel"); 
		$("#"+activeTab).fadeIn(); 
	});
});


$(function() {
	var dialog, form;
	var firstName = $('#firstName');
	var lastName = $('#lastName');
	var address = $('#address');
	var city = $('#city');

	firstName.validate({
		required: true,
		length: {
			enabled: true,
			minLength: 3,
			maxLength: 32
		}
	});

	lastName.validate({
		required: true,
		length: {
			enabled: true,
			minLength: 3,
			maxLength: 32
		}
	});

	address.validate({
		required: true,
		length: {
			enabled: true,
			minLength: 3,
			maxLength: 32
		}
	});	

	city.validate({
		required: true,
		length: {
			enabled: true,
			minLength: 3,
			maxLength: 32
		}
	});	

	
	dialog = $( "#dialog-form" ).dialog({
		autoOpen: false,
		heigth: 450,
		modal: true,
		buttons: {
			' ': function() {
		       $('#edit-form').submit();
			}, 		
			'': function() {
				load();
				$(this).dialog('close');
			}
		}
	});

	function load(){
		$('#firstName').val(firstName.val());
		$('#lastName').val(lastName.val());
		$('#address').val(address.val());
		$('#city').val(city.val());
	}
	
	$("#edit-info").button().on( "click", function() {
		dialog.dialog( "open" );
	});
});