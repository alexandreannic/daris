<%--
	Cette page affiche le tableau de bord d'un utilsateur.
--%>
<%@ page language='java' contentType='text/html; charset=ISO-8859-1' isELIgnored='false' pageEncoding='ISO-8859-1'%>
<%@ taglib uri='http://tiles.apache.org/tags-tiles' prefix='tiles'%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@ taglib uri='http://www.springframework.org/tags' prefix='spring'%>
<%@ taglib uri='http://www.springframework.org/tags/form' prefix='form'%>

<div class='col-xs-12 col-md-7'>

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
	<br/>
</div>

<div class='col-xs-12 col-md-5'>
	<div class='panel'>
		<h1 class='panel-title'>
			Abonnements
		</h1>
		<c:forEach items="${sessionScope.user.followed}" var="follow">
			<div onclick='document.location="/daris/user/view/${follow.id}"' class='followed col-xs-6 col-sm-4 col-md-12 col-lg-6'>
				<div class="follow-photo">
					<c:choose>
						<c:when test='${not empty follow.picture}'>
							<img class="follow-photo-img" src="/daris/assets/img/users/${follow.picture}"/>
						</c:when>
						<c:otherwise>
							<i class="follow-photo-default"></i>
						</c:otherwise>
					</c:choose>
				</div>
				
				<div class='follow-content'>
					<div class='follow-name'>${follow.firstName} ${follow.lastName}</div>
					<em><i class='fa-circle'></i> Hors-ligne</em>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<script>
	$.ajax({
		url: "http://maps.googleapis.com/maps/api/geocode/json",
		dataType: "json",
		data: {
			sensor: false,
			address: "4+Place+Jussieu+Paris"
		},
		success: function(data) {
			console.log(JSON.stringify(data));
			console.log(data.results[0].address_components[0].long_name);
		}
	});
</script>
<%@ include file='_script-message.jsp'%>
<%@ include file='_script-findUsers.jsp'%>
<%@ include file='../locality/view/_asyny-get_view.jsp'%>