<%@ page language='java' contentType='text/html; charset=ISO-8859-1' isELIgnored='false' pageEncoding='ISO-8859-1'%>
<%@taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@taglib uri='http://www.springframework.org/tags' prefix='spring'%>
<%@taglib uri='http://www.springframework.org/tags/form' prefix='form'%>

<div class='col-xs-12'>

	<div id='panel-login' class='panel'>
		<h1 id="panel-login-h1"><spring:message code='index.view.welcome'/></h1>
	    <%@ include file='form/signin.jsp'%>
	</div>
	
</div>


<div id='signup-dialog' title='<spring:message code="index.view.signup"/>' style='display:none'>
	<%@ include file='form/signup.jsp'%>
</div>


<%@ include file='script/main.js.jsp'%>
<%@ include file='script/signin.js.jsp'%>
<%@ include file='script/signup.js.jsp'%>
