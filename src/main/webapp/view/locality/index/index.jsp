<%--
	Cette page affiche les points d'interêts existants dans le système.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored='false' pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="panel">
	<c:forEach items="${localityList}" var="locality">

		<%-- Bouton de visualisation d'un point d'interêt--%>
		<c:url value="/locality/view" var="urlView">
			<c:param name="localityId" value="${locality.localityId}" />
		</c:url>

		<a href="${urlView}"><c:out value="${locality.name}" /></a>

		<%-- Bouton de modification d'un point d'interêt--%>
		<c:url value="/locality/edit" var="urlEdit">
			<c:param name="localityId" value="${loaclity.localityId}" />
		</c:url>

		<a href="${urlEdit}"><spring:message code='locality.view.index.edit' /></a>

		<%-- Bouton de suppression d'un point d'interêt--%>
		<c:url value="/locality/remove" var="urlRemove">
			<c:param name="localityId" value="${locality.localityId}" />
		</c:url>

		<a href="${urlRemove}"><spring:message code='locality.view.index.remove' /></a>
		<br />

	</c:forEach>
</div>
