<%--
	Cette page permet à un utilisateur de modifier ses préférences.
--%>
<%@ page language='java' contentType='text/html; charset=ISO-8859-1'
	isELIgnored='false' pageEncoding='ISO-8859-1'%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<%-- Panel resume --%>

<div class="col-sm-3">
	<div id="leftpanel" class="panel">
		<div class="panel-title">
			fpoeaga
		</div>
		sdfsdl
	</div>
</div>



<%-- Panel information --%>

<div class="col-sm-9">
	<div class="panel">
		<div class="tabs tabs-panel">
	
			<ul class="tabs-ul">
				<li class="tabs-li"><a href="#tab-profile"><spring:message code='user.view.settings.profile'/></a></li>
				<li class="tabs-li"><a href="#tab-photo"><spring:message code='user.view.settings.photos'/></a></li>
				<li class="tabs-li"><a href="#tab-hobby"><spring:message code='user.view.settings.hobbies'/></a></li>
			</ul>
			
	
			<div id="tab-profile">
				<h3 style="margin-left: 15px; font-size:24px">
					<i class="fa-3x fa-user"></i> About
				</h3>
				<div class="form-field">
					<span class="dd"><spring:message code='user.field.firstName'/></span>
					<span class="dt">${user.firstName}</span>
				</div>
				<div class="form-field">
					<span class="dd"><spring:message code='user.field.lastName'/></span>
					<span class="dt">${user.lastName}</span>
				</div>
				<div class="form-field">
					<span class="dd"><spring:message code='field.address'/></span>
					<span class="dt">${user.address}</span>
				</div>
				<div class="form-field">
					<span class="dd"><spring:message code='field.city'/></span>
					<span class="dt">${user.city}</span>
				</div>
			</div>
			
	
			<div id="tab-photo">
				test2
			</div>
			
			
			<div id="tab-hobby">
				test3
			</div>
				
		</div>
	</div>
</div>


<div id="dialog-form" title="<spring:message code='view.edit'/>">
	<%@ include file='_form-edit.jsp'%>
</div>


<%@ include file='_script.jsp'%>
