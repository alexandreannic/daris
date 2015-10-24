<%--
	Cette page affiche les informations concernant un point d'intérêt.
	Elle vise a être récupérée via une requête AJAX.
--%>
<%@ page language='java' contentType='text/html; charset=ISO-8859-1'
	isELIgnored='false' pageEncoding='ISO-8859-1'%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div id="locality-head">
	<div id="locality-picture">
		<img src="<c:url value="/assets/img/localities/${locality.picture}"/>" width="250"/>
	</div>
	
	<div id="locality-aside">
		<div class="form-field">
			<span class="dd"><spring:message code="field.name" /></span>
			<span class="dt">${locality.name}</span>
		</div>
		
		<div class="form-field">
			<span class="dd"><spring:message code="field.address" /></span>
			<span class="dt">${locality.address}</span>
		</div>
		
		<div class="form-field">
			<span class="dd"><spring:message code="field.ZIP" /></span>
			<span class="dt">${locality.ZIPCode}</span>
		</div>
		
		<div class="form-field">
			<span class="dd"><spring:message code="field.type" /></span>
			<span class="dt">${locality.type}</span>
		</div>
		
		<div class="form-field">
			<span class="dd"><spring:message code="field.note" /></span>
			<span class="dt">
				<c:forEach var="i" begin="1" end="${locality.note}">
					<i class="fa-star"></i>
				</c:forEach>
				<c:forEach var="i" begin="${locality.note}" end="4">
					<i class="fa-star-o"></i>
				</c:forEach>
			</span>
		</div>
	</div>
</div>

<div id="locality-desc">
	${locality.description}
</div>

