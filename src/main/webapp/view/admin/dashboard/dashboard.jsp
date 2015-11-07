<%--
	Cette page affiche le tableau de bord d'un administrateur.
--%>
<%@ page language='java' contentType='text/html; charset=ISO-8859-1' isELIgnored='false' pageEncoding='ISO-8859-1'%>
<%@ taglib uri='http://tiles.apache.org/tags-tiles' prefix='tiles'%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri='http://www.springframework.org/tags' prefix='spring'%>
<%@ taglib uri='http://www.springframework.org/tags/form' prefix='form'%>

<div class='col-xs-12 col-lg-8'>
	<div class='panel'>
		<h1 class='panel-title'>
			<spring:message code='admin.view.stats.title'/>
			<span class='panel-actions'>
				<i onclick='displayStats("#stats")' class='fa-refresh i-btn'/></i>
			</span>
		</h1>
		
		<a href='<c:url value='/createLocality'/>'><spring:message code='admin.dashboard.locality.create' /></a>
		
		<div id='stats'>
		</div>
	</div>
</div>


<div class='col-xs-12 col-lg-4'>
	<div class='panel'>
		<h1 class='panel-title'>
			<span class='panel-actions'>
				<i id='locality-new-btn' class='fa-plus-circle i-btn'/></i>
			</span>
		</h1>
		
		<c:forEach var="locality" items="${localities}">
			<div class="box">
				<div class="box-content">
					${locality.name}
				</div>
				<div class="box-actions">
					<i class="fa-external-link-square i-btn" onclick="locality_openPopup(${locality.id})"></i>
					<i class="fa-pencil i-btn"></i>
					<i class="fa-times i-btn" onclick="document.location='/daris/locality/remove/${locality.id}'"></i>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
	
	
	
<div id='locality-new-dialog' style='display:none'>
	<%@ include file='_form-create.jsp'%>
</div>

<%@ include file='_script-stats.jsp'%>
<%@ include file='_script-create.jsp'%>
<%@ include file='../../locality/view/_asyny-get_view.jsp'%>