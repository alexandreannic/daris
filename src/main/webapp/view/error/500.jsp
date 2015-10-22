<%@ page language='java' contentType='text/html; charset=ISO-8859-1' isELIgnored='false' pageEncoding='ISO-8859-1'%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<c:set var="pageTitle"><tiles:getAsString name="title"/></c:set>

<div id="wrapper">
	<div id="wrapper-title"><spring:message code="${pageTitle}"/></div>
</div>

<spring:message code="page.500.content"/>
