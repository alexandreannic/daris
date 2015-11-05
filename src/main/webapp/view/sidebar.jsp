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
		
		<a id="sb-user" class="sb-ul-a" href="<c:url value="/user/settings"/>">
			<i id="sb-photo-default"></i>

			<span id="sb-user-name">
				${sessionScope.user.firstName}<br/>
				${sessionScope.user.lastName}
			</span>
        </a>
        
        
        <ul class="sb-ul">
        
            <li class="sb-li">
                <a class="sb-ul-a" href="<c:url value="/user/logout"/>" id="menu-disconnect">
                    <i class="fa-power-off sb-icon"></i>
                    <spring:message code="menu.logout"/>
                </a>
            </li>
            
            
            <li class="sb-li">
                <a class="sb-ul-a">
                    <i class="fa-bell sb-icon"></i>
                    <spring:message code="menu.notification"/>
                </a>
            </li>
            
		</ul>
		
	</div>
	
	
	
	<ul id="sb-nav">
	
		<li class="sb-li">
			<a class="sb-ul-a" href="<c:url value="/dashboard"/>">
				<i class="fa-home sb-icon"></i>
				<spring:message code="menu.dashboard"/>
			</a>
		</li>
		
		
		<li class="sb-li">
			<a class="sb-ul-a" href="<c:url value="event/index"/>">
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
		
	</ul>
	
</nav>
	