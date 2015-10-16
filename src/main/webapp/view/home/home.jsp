<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!doctype html>

<html lang="fr">

	<head>
		<title></title>
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" href="<c:url value="/assets/style/.css/home.css"/>"/>
		<script src="<c:url value="/assets/script/jquery-2.1.4.js"/>"></script>
		<script src="<c:url value="/assets/script/jquery-ui.js"/>"></script>
		<script src="<c:url value="/assets/script/sha1.js"/>"></script>
		<script src="<c:url value="/assets/script/validate.js"/>"></script>
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
	
		<div id="content">
			<div id="home-wrap">
	            <div id="home-wrap-i">
	                <i id="btn-signup" title="<spring:message code="home.view.signup.tooltip"/>"></i>
	            </div>
	        </div>
		</div>
		
		
		<div class="col-xs-12">
		
			<div id="panel-login" class="panel">
				<h1><spring:message code="home.view.signin.btn"/></h1>
				<p class="field">
					<i class="field-i fa-user" title="&{'secure.username'}"></i>
					<input class="field-input" name="username" id="username" value=""/>
				</p>

				<p class="field">
					<i class="field-i fa-lock" title="&{'secure.password'}"></i>
					<input class="field-input" type="password" name="password" id="password"/>
					<input type="hidden" id="saltedPassword" name="saltedPassword"/>
				</p>

				<div id="btn-submit" class="input-btn">
					<i id="submit-i" class="fa-sign-in"></i>
					<spring:message code="home.view.signin.btn"/>
				</div>
				
			</div>
			
		</div>
		
		
		<div id="signup-dialog" style="display:none">
	    	<%@ include file="../forms/user-signup.jsp"%>
	    </div>
	    
	    <%@ include file="home.js.jsp"%>
	</body>

</html>