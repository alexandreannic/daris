<%@ page language='java' contentType='text/html; charset=ISO-8859-1' isELIgnored='false' pageEncoding='ISO-8859-1'%>
<%@taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@taglib uri='http://www.springframework.org/tags' prefix='spring'%>
<%@taglib uri='http://www.springframework.org/tags/form' prefix='form'%>

<!doctype html>

<html lang='fr'>

	<head>
		<title></title>
		<meta charset='utf-8'>
		<link rel='stylesheet' type='text/css' href='<c:url value='/assets/style/.css/home.css'/>'/>
		<script src='<c:url value='/assets/script/jquery-2.1.4.js'/>'></script>
		<script src='<c:url value='/assets/script/jquery-ui.js'/>'></script>
		<script src='<c:url value='/assets/script/sha1.js'/>'></script>
		<script src='<c:url value='/assets/script/validate.js'/>'></script>
	    <script>
	        <%-- Factorise quelques options pour JQuery dialog --%>
	        $.extend($.ui.dialog.prototype.options, {
	            autoOpen: false,
	            modal: true,
	            resizable: false,
	            width: 500,
	            show: {effect: 'fade', duration: 200},
	        });
	    </script>
	</head>
	
	
	<body>

<%-- 				  <c:out value='${message}'/>- --%>
<%-- 		<div id='status_message'>${message}</div>- --%>
<%-- 		<c:if test='${message != null}'> --%>
<%-- 		  <div id='status_message'>${message}</div> --%>
<%-- 		</c:if>  --%>
		
		
		<div id='content'>
			<div id='home-wrap'>
	            <div id='home-wrap-i'>
	                <i id='btn-signup' title='<spring:message code='home.view.signup.tooltip'/>'></i>
	            </div>
	        </div>
		</div>
		
		
		<div class='col-xs-12'>
		
			<div id='panel-login' class='panel'>
				
				<h1><spring:message code='home.view.signin.btn'/></h1>
				
				<form id='signin-form' method='POST' action='signin'> 
					<p class='field'>
						<i class='field-i fa-user' title='<spring:message code='home.view.icon.email'/>'></i>
						<input id='signin-email' class='field-input' name='email' value=''/>
					</p>
	
					<p class='field'>
						<i class='field-i fa-lock' title='<spring:message code='home.view.icon.pwd'/>'></i>
						<input id='signin-pwd' type='password' class='field-input'/>
						<input id='signin-pwd-salted' type='hidden' name='password'/>
					</p>
	
					<div id='signin-submit' class='input-btn'>
						<i id='submit-i' class='fa-sign-in'></i>
						<spring:message code='home.view.signin.btn'/>
					</div>
				</form>
				
			</div>
			
		</div>
		
		
		<div id='signup-dialog' style='display:none'>
	    	<%@ include file='form/signup.jsp'%>
	    </div>
	    
	    <%@ include file='../notification.jsp'%>
	    <%@ include file='script/main.js.jsp'%>
	    <%@ include file='script/signin.js.jsp'%>
	    <%@ include file='script/signup.js.jsp'%>
	</body>

</html>