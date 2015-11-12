<%--
	Cette page permet à un utilisateur de modifier ses préférences.
--%>
<%@ page language='java' contentType='text/html; charset=ISO-8859-1' isELIgnored='false' pageEncoding='ISO-8859-1'%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<%-- Panel information --%>

<div class="col-sm-12">
	<div class="panel">
		<div class="tabs tabs-panel">
	
			<ul class="tabs-ul">
				<li class="tabs-li"><a href="#tab-profile"><spring:message code='user.view.settings.profile'/></a></li>
				<li class="tabs-li"><a href="#tab-hobby"><spring:message code='user.view.settings.hobbies'/></a></li>
			</ul>

			<div id="tab-profile">
				<div id="sb-photo">
					<img id="sb-photo-img"
						src="/daris/assets/img/users/${user.picture }"></img>
				</div>
				<div class="form-field">
					<span class="dd"><spring:message code='user.field.firstName'/></span>
					<span class="dt">${user.firstName}</span>
					<span class="dd"><spring:message code='user.field.lastName'/></span>
					<span class="dt">${user.lastName}</span>
				</div>
				
				<div class="form-field">
					<span class="dd"><spring:message code='field.address'/></span>
					<span class="dt">${user.address}</span>
					<span class="dd"><spring:message code='field.city'/></span>
					<span class="dt">${user.city}</span>
				</div>
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
