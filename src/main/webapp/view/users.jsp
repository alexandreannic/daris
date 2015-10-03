<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<c:url value="/bonjour" var="url" />
<a href="${url}">BONJOUR</a>
<table border="1">

<h1>${use.email}</h1>
	<thead>
		<tr>
			<th>
				<spring:message code="colonne.identifiant" />
			</th>
			<th>
				<spring:message code="colonne.libelle" />
			</th>
			<th>
				<spring:message code="colonne.quantite" />
			</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${users}" var="user">
			<tr>
				<td>
					<c:out value="${user.id}" />
				</td>
				<td>
					<c:out value="${user.email}" />
				</td>
				<td>
					<c:out value="${user.password}" />
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>