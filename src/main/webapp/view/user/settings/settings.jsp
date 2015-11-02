<%--
	Cette page permet à un utilisateur de modifier ses préférences.
--%>
<%@ page language='java' contentType='text/html; charset=ISO-8859-1'
	isELIgnored='false' pageEncoding='ISO-8859-1'%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/assets/style/view/userSetting.less"/>" />
<script src="<c:url value="/assets/style/jquery/jquery-user.js"/>"></script>
<script src="<c:url value="/daris/assets/script/validate.js"/>"></script>
<script src="<c:url value="/daris/assets/script/sha1.js"/>"></script>
<!-- panel resume -->
<div class="col-sm-3" id="leftpanel">
	sdfsdl
</div>
	<!-- panel information -->
<div class="col-sm-9" id="rightpanel">
	<ul class="tabs">
		<li class="active" rel="tab1">Profile</li>
		<li rel="tab2">Photo</li>
		<li rel="tab3">Hobbie</li>
	</ul>
	<div class="tab_container">
		<div class="tab_content" id="tab1">
			<h3 style="margin-left: 15px; font-size:24px">
				<i class="fa-3x fa-user"></i> About
			</h3>
			<div class="col-sm-6">
				<label class="col-xs-3 dd">Nom</label>
				<div class="col-xs-9 dt">${user.firstName }</div>
			</div>
			<div class="col-sm-6">
				<label class="col-xs-3 dd">Prenom</label>
				<div class="col-xs-9 dt">${user.lastName }</div>
			</div>
			<div class="col-sm-6">
				<label class="col-xs-3 dd">Address</label>
				<div class="col-xs-9 dt">${user.address }</div>
			</div>
			<div class="col-sm-6">
				<label class="col-xs-3 dd">City</label>
				<div class="col-xs-9 dt">${user.city }</div>
			</div>
			<div id="dialog-form" title="Modifie information">
				<form:form id='edit-form' action='edit' commandName='user' methode='POST'>
					<fieldset>
						<label for="firstName">Nom</label> 
							<input type="text" name="firstName" id="firstName" value="${user.firstName }"
							class="text ui-widget-content ui-corner-all"> 
						<label for="lastName">Prenom</label> 
							<input type="text" name="lastName" id="lastName" value="${user.lastName }"
							class="text ui-widget-content ui-corner-all"> 
						<label for="address">Address</label> 
							<input type="text" name="address" id="address" value="${user.address }"
							class="text ui-widget-content ui-corner-all">
						<label for="city">City</label> 
							<input type="text" name="city" id="city" value="${user.city }"
							class="text ui-widget-content ui-corner-all">
					</fieldset>
				</form:form>
			</div>
			<button id="edit-info">Modifie</button>
		</div>

		<!-- Profile -->
		<div class="tab_content" id="tab2">test2</div>
		<!-- #tab2 -->
		<div class="tab_content" id="tab3">test3</div>
		<!-- #tab3 -->
	</div>
</div>