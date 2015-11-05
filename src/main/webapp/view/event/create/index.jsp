<%--
	Cette page permet la cr�ation d'un nouvel �v�nement
--%>

<%@ page language='java' contentType='text/html; charset=ISO-8859-1' isELIgnored='false' pageEncoding='ISO-8859-1'%>
<%@taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@taglib uri='http://www.springframework.org/tags' prefix='spring'%>
<%@taglib uri='http://www.springframework.org/tags/form' prefix='form'%>

<%-- Block de cr�ation d'un nouvel �v�nement --%>
<div class='col-xs-12'>

	<div id='panel-login' class='panel'>
		<h1 id="panel-login-h1">Cr�ation d'un nouvel �v�nement</h1>
	    <%@ include file='form/create.jsp'%>
	</div>
	
	<%@ include file='script/localityAutoComp.js.jsp'%>
	<%@ include file='script/create.js.jsp'%>
	
</div>