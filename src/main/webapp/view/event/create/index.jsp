<%--
	Cette page permet la création d'un nouvel évènement
--%>

<%@ page language='java' contentType='text/html; charset=ISO-8859-1' isELIgnored='false' pageEncoding='ISO-8859-1'%>
<%@taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@taglib uri='http://www.springframework.org/tags' prefix='spring'%>
<%@taglib uri='http://www.springframework.org/tags/form' prefix='form'%>

<%-- Block de création d'un nouvel évènement --%>
<div class='col-xs-12'>

	<div id='panel-login' class='panel'>
		<h1 id="panel-login-h1">Création d'un nouvel évènement</h1>
	    <%@ include file='form/create.jsp'%>
	</div>
	
	<%@ include file='script/localityAutoComp.js.jsp'%>
	<%@ include file='script/create.js.jsp'%>
	
</div>