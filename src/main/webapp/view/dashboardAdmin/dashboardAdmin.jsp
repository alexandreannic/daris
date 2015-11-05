<%--
	Cette page affiche le tableau de bord d'un administrateur.
--%>
<%@ page language='java' contentType='text/html; charset=ISO-8859-1' isELIgnored='false' pageEncoding='ISO-8859-1'%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="col-xs-12 col-md-8">
	<div class="panel">
		<h1 class="panel-title"><spring:message code='admin.dashboard.locality.title' /></h1>
		<br />
		
		<%-- Lien pour la création d'un nouveau point d'interêts. --%>
		<a href="<c:url value="/createLocality"/>"><spring:message code='admin.dashboard.locality.create' /></a>
		<br />
		<br />

		<%-- Partie d'administration des points d'interêts. --%>
		<%@ include file='../locality/index/index.jsp'%>
	</div>
</div>
