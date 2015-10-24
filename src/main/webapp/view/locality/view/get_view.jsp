<%--
	Affiche une popup décrivant un point d'intérêt récupéré en AJAX.
	Appelé la fonction locality_openPopup avec comme paramètre
	l'identifiant du point d'intérêt à afficher.
--%>
<%@ page language='java' contentType='text/html; charset=ISO-8859-1'
	isELIgnored='false' pageEncoding='ISO-8859-1'%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<div id="locality-popup" style="display: none"></div>

<script>

var locality_popup = $("#locality-popup");


locality_popup.dialog({
	width: 700,
});


<%-- Ajoute un bouton close au dialog --%>
var btn_close = $("<i>").addClass("ui-dialog-btn-close ui-button");
locality_popup.siblings(".ui-dialog-titlebar").append(btn_close);

btn_close.click(function() {
	locality_popup.dialog("close");
});


function locality_openPopup(id)
{
	locality_popup.empty();
	
	var loading_icon = $("<div>").addClass("loading-logo");
	
	locality_popup.append(loading_icon);
	locality_popup.dialog("open");
	
	$.ajax({
	    type : 'GET',
	    url : "locality/view/" + id,

	    error : function() {
	    	loading_icon.remove();
	    	locality_popup.append(
    			$("<div>")
    				.addClass("notice error")
    				.append(
   						$("<span>").
   							addClass("notice-content")
   							.text("<spring:message code="view.ressourceNotExists"/>")
 				)
 			);
	    },
	    success : function(result) {
	    	loading_icon.remove();
	    	locality_popup.append(result);
	    }
	});
}

</script>