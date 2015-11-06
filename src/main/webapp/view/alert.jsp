<%--
	Les elements alert permettent d'informer l'utilisateur. 
	Ils affichement nottament les attributs flash envoyés 
	par le controlleur. 
--%>
 
<div id='alert-container'>
	<div id='alert-hold'></div>
</div>

	
<script>

$(function() {
	<c:if test='${not empty ALERT_ERROR}'>
		alert_new_error('${ALERT_ERROR}');
	</c:if>
	
	<c:if test='${not empty ALERT_SUCCESS}'>
		alert_new_success('${ALERT_SUCCESS}');
	</c:if>
});



var alert_container = $('#alert-container');


function alert_new(type, message)
{
	<%-- Création --%>
	var alert = 
		$('<div>')
			.addClass('alert')
			.addClass(type);
			
	var alert_content = 
		$('<div>')
			.addClass('alert-content')
			.text(message);
			
	var alert_close = 
		$('<i>')
			.addClass('alert-close');
			
	<%-- Assemblage --%>
	alert.append(alert_content);
	alert.append(alert_close);
	alert_container.append(alert);
	
	<%-- Listeners --%>
	alert.delay(3500).fadeOut(7000);
	
	alert_close.click(function() {
		$(this).closest('.alert').remove();
	});
	
	alert.hover(function() {
		alert.stop();
		alert.fadeIn(200);
	});
	
	alert.mouseleave(function() {
		alert.delay(1000).fadeOut(6000);
	});
}


function alert_new_error(message)
{
	alert_new('error', message);
}


function alert_new_success(message)
{
	alert_new('success', message);
}


function alert_new_info(message)
{
	alert_new('info', message);
}


function alert_new_loading(message)
{
	alert_new('loading', message);
}
	
// alert_new_loading('coucou');
// alert_new_loading('coucou');
// alert_new_success("suc");

</script>

