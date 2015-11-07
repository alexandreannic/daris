<%--
	Cette page affiche le tableau de bord d'un utilsateur.
--%>
<%@ page language='java' contentType='text/html; charset=ISO-8859-1' isELIgnored='false' pageEncoding='ISO-8859-1'%>
<%@ taglib uri='http://tiles.apache.org/tags-tiles' prefix='tiles'%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@ taglib uri='http://www.springframework.org/tags' prefix='spring'%>
<%@ taglib uri='http://www.springframework.org/tags/form' prefix='form'%>

<div class='col-xs-12 col-md-8'>

	<div class='panel'>
		<h1 class='panel-title'>
			<span class='panel-actions'>
				<i class='fa-map-marker i-btn' id="new-msg-add-event"></i>
				<i class='fa-user i-btn' id='new-msg-add-user'></i>
				<i class='fa-paper-plane green i-btn' id='msg-new-send' title='<spring:message code='view.send'/>'></i>
			</span>
		</h1>
		
		<input id='list-to' type='hidden'/>
		<input id='list-event' type='hidden'/>
		
	 	<div id="msg-new-text" contenteditable="true" data-placeholder-default="Quoi de neuf ?">
 		</div>
	 		
	</div>
	
	<c:forEach items="${messages}" var="message">
		<div class='msg'>
			<div class="msg-photo">
				<c:choose>
					<c:when test='${not empty message.from.picture}'>
						<img class="msg-photo-img" src="/daris/assets/img/users/${message.from.picture}"/>
					</c:when>
					<c:otherwise>
						<i class="msg-photo-default"></i>
					</c:otherwise>
				</c:choose>
			</div>
			
			<div class='msg-content'>
				<div class='msg-head'>
					<strong class='msg-from'>${message.from.firstName} ${message.from.lastName}</strong>
					<em class='msg-date'>${message.dateSent}</em>
				</div>
				<div class='msg-txt'>
					${message.text}
				</div>
			</div>
		</div>
	</c:forEach>
	
	
</div>

<div class='col-xs-12 col-md-4'>
	<div class='panel'>
	</div>
</div>

<script>


var new_msg_to = $("#new-msg-to");
var new_msg_search = $("#new-msg-search");
var msg_new_add_user = $("#new-msg-add-user");
var msg_new_add_event = $("#new-msg-add-event");
var msg_new_text = $("#msg-new-text");
var msg_new_form = $("#msg-new-form");
var msg_new_send = $("#msg-new-send");
var msg_new_input_to = $("#list-to");
var msg_new_input_event = $("#list-event");


<%-- Envoie le message --%>

msg_new_send.click(function() {
	if(msg_new_text.html().match(/^\s*$/)) {
		msg_new_text.addClass('error').delay(1000).queue(function(next) {
		    $(this).removeClass("error");
		    next();
		});
		return;
	}

	var alert = alert_new_loading("Envoie...");
	
	$.ajax({
		url: '/daris/message/send/',
		type: 'POST',
		data: {
			text: msg_new_text.html(),
			to: msg_new_input_to.val(),
			events: msg_new_input_event.val()
		},
		dataType: 'html',
		success: function(data) {
			alert.remove();
			alert_new_success("Message envoyé !");
		},
		error: function() {
			alert.remove();
			alert_new_error("Impossible d'envoyer le message.");
		}
	});
	
});


<%-- Ajouter ref event --%>

msg_new_add_event.click(function () {
	input = $("<input class='tokens-input'>").val('#');
	msg_new_text.append(input);
	
	input.focus();
	
	<%-- Supprimer l'input si vide --%>
	input.change(function () {
		if(input.val() == "") {
			$(this).remove();
		}
	});
	
	input.autocomplete({
		source: function(request, response) {
			$.ajax({
				url: '<c:url value='/event/getEvents'/>',
				dataType: 'json',
				data: {info: request.term.substring(1)},
				success: function(data) {
					response($.map(data, function(item) {
						return {
							id: item.id,
							label: item.name,
							value: item.name
						  }
					}));
				}
			});
		},
		minLength: 1,
		select: function(event, ui) {
			msg_new_text.append(
				$("<a contenteditable='false'>")
					.addClass('tag')
					.text('#' + ui.item.value)
					.prop('href', '/daris/event/view/' + ui.item.id)
			);
			msg_new_text.append($("<span>").html("&nbsp"));
			$(this).remove();
			elem = document.getElementById('msg-new-text')
			placeCaretAtEnd(elem);		
			
			<%-- Ajouter input hidden --%>
			msg_new_input_event.val(msg_new_input_event.val() + ui.item.id + ' ');
		}
	});
});


<%-- Ajouter ref user --%>

msg_new_add_user.click( function () {
	input = $("<input class='tokens-input'>").val('@');
	msg_new_text.append(input);
	
	input.focus();
	
	<%-- Supprimer l'input si vide --%>
	input.change(function () {
		if(input.val() == "") {
			$(this).remove();
		}
	});
	
	input.autocomplete({
		source: function(request, response) {
			$.ajax({
				url: '<c:url value='/user/getUsers'/>',
				dataType: 'json',
				data: {info: request.term.substring(1)},
				success: function(data) {
					response($.map(data, function(item) {
						return {
							id: item.id,
							label: item.fullName,
							value: item.fullName
						  }
					}));
				}
			});
		},
		minLength: 1,
		select: function(event, ui) {
			msg_new_text.append(
				$("<a contenteditable='false'>")
					.addClass('tag')
					.text('@' + ui.item.value)
					.prop('href', '/daris/user/view/' + ui.item.id)
			);
			msg_new_text.append($("<span>").html("&nbsp"));
			$(this).remove();
			elem = document.getElementById('msg-new-text')
			placeCaretAtEnd(elem);		
			
			<%-- Ajouter input hidden --%>
			msg_new_input_to.val(msg_new_input_to.val() + ui.item.id + ' ');
		}
	});
});


function placeCaretAtEnd(el)
{
    el.focus();
    if (typeof window.getSelection != "undefined"
            && typeof document.createRange != "undefined") {
        var range = document.createRange();
        range.selectNodeContents(el);
        range.collapse(false);
        var sel = window.getSelection();
        sel.removeAllRanges();
        sel.addRange(range);
    } 
    else if (typeof document.body.createTextRange != "undefined") {
        var textRange = document.body.createTextRange();
        textRange.moveToElementText(el);
        textRange.collapse(false);
        textRange.select();
    }
}
	
// 	msg_new_text.on("keyup", function() {
// 		var txt = msg_new_text.html();
// 		var regex = /^(.*?[\s>])(@\w+)(<\/span>)?$/;
// 		var match = txt.match(regex);
		
// 		if(match != null) {
// 			console.log("-&- " +match[0]);
// 			console.log("-2- " +match[1]);
// 			console.log("-3- " +match[2]);
// 			msg_new_text.html(match[1]);
			
// 			var tag = $("<a class='tag'>").text(match[2]);
// 			msg_new_text.append(tag);
			
// 			elem = document.getElementById('msg-new-text')
// 			setEndOfContenteditable(elem);			
// // 			var text = ";;";
// // 			var sel, range, html; 
// // 		    sel = window.getSelection();
// // 		    range = sel.getRangeAt(0); 
// // 		    range.deleteContents(); 
// // 		    var textNode = document.createTextNode(text);
// // 		    range.insertNode(textNode);
// // 		    range.setStartAfter(textNode);
// // 		    sel.removeAllRanges();
// // 		    sel.addRange(range);     
			
// 		}
		
// 		var autocomplete = txt.replace(regex, "$1");
		
// 		txt = txt.substr(txt.length - 2);
		
// 		msg_new_text.append
		
// 	});
	















	// new_msg_to.click(function() {
//	 	new_msg_search.focus();
	// })


	// new_msg_search.autocomplete({
//	 	source: function(request, response) {
//	 		$.ajax({
//	 			url: '<c:url value='/locality/getLocalities'/>',
//	 			dataType: 'json',
//	 			data: {info: request.term},
//	 			success: function(data) {
//	 				response($.map(data, function(item) {
//	 					return {
//	 						id: item.id,
//	 						label: item.name,
//	 						value: item.name
//	 					  }
//	 				}));
//	 			}
//	 		});
//	 	},
//	 	minLength: 1,
//	 	select: function(event, ui) {
//	 		if (ui.item && !$("#token-" + ui.item.id).length) {
//	 			$(
//	 				'<div id="token-' + ui.item.id + '" class="token">' +
//	 					'<input type="hidden" value="' + ui.item.id + '" name="employeesIds[' + index + ']" />' +
//	 					ui.item.value +
//	 					'<i class="token-i rm" onclick="removeToken(' + ui.item.id + ')"></i>' +
//	 				'</div>'
//	 			).insertBefore(new_msg_search);

//	 			refreshPlaceHolder();

//	 			index++;
//	 		}
//	 		new_msg_search.val("");
//	 		return false;
//	 	}
	// });


	// function refreshPlaceHolder()
	// {
//	 	if(new_msg_to.find(".token").length > 0) {
//	 		new_msg_search.prop("placeholder", "");
//	 	}
//	 	else {
//	 		new_msg_search.prop("placeholder", "&{'loc.views.sendMessageTo'}");
//	 	}
	// }

	// function removeToken(id)
	// {
//	 	$("#token-" + id).remove();
//	 	refreshPlaceHolder();
	// }
</script>

<%@ include file='../locality/view/_asyny-get_view.jsp'%>