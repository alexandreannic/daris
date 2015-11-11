<%--
	Menu de l'interface des utilisateurs
 --%>
<%@ page language='java' contentType='text/html; charset=ISO-8859-1' isELIgnored='false' pageEncoding='ISO-8859-1'%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<nav id="sb">

	<div id="sb-head">
		
		<a id="sb-user" class="sb-ul-a" href="<c:url value="/dashboard"/>">
			<div id="sb-photo">
				<c:choose>
					<c:when test='${not empty sessionScope.user.picture}'>
						<img id="sb-photo-img" src="/daris/assets/img/users/${sessionScope.user.picture}"/>
					</c:when>
					<c:otherwise>
						<i id="sb-photo-default"></i>
					</c:otherwise>
				</c:choose>
			</div>
			
			<span id="sb-user-name">
				${sessionScope.user.firstName}<br/>
				${sessionScope.user.lastName}
			</span>
        </a>
        
        
        <ul class="sb-ul">
        
            <li class="sb-li">
                <a class="sb-ul-a">
                    <i class="fa-bell sb-icon"></i>
                    <spring:message code="menu.notification"/>
                </a>
            </li>
            
            <li class="sb-li">
                <a class="sb-ul-a" href='<c:url value="/user/settings"/>'>
                    <i class="fa-cog sb-icon"></i>
                    <spring:message code="menu.settings"/>
                </a>
            </li>
            
            <li class="sb-li">
                <a class="sb-ul-a" href="<c:url value="/user/logout"/>" id="menu-disconnect">
                    <i class="fa-power-off sb-icon"></i>
                    <spring:message code="menu.logout"/>
                </a>
            </li>
            
		</ul>
		
	</div>
	
	
	
	<ul id="sb-head">
		
		<li class="sb-li">
			<a class="sb-ul-a" href="<c:url value="/event/index"/>">
				<i class="fa-calendar-o sb-icon"></i>
				<spring:message code="menu.event"/>
			</a>
		</li>
		
		
		<li class="sb-li">
			<a class="sb-ul-a" href="#">
				<i class="fa-envelope sb-icon"></i>
				<spring:message code="menu.message"/>
			</a>
		</li>
		
		<li class="sb-li">
			<a class="sb-ul-a"href="<c:url value="/event/view/1"/>">
				<i class="fa-envelope sb-icon"></i>
				<spring:message code="menu.message"/>
			</a>
		</li>
		
		<li class="sb-li">
			<a class="sb-ul-a" href="<c:url value="/event/create"/>">
				<i class="fa-plus sb-icon"></i>
				<spring:message code="menu.addEvent"/>
			</a>
		</li>
		
	</ul>
	
</nav>
	