<%@ page language='java' contentType='text/html; charset=ISO-8859-1' isELIgnored='false' pageEncoding='ISO-8859-1'%>
<%@taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@taglib uri='http://www.springframework.org/tags' prefix='spring'%>
<%@taglib uri='http://www.springframework.org/tags/form' prefix='form'%>

<div class="col-xs-12 col-md-8">

	<div id='panel' class='panel'>
		<h1 id="panel-title"><spring:message code='locality.view.create.title' /></h1>
	    <%@ include file='form/create.jsp'%>
	</div>
	
</div>

<%@ include file='script/create.js.jsp'%>
