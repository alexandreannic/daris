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
		
		<a id="sb-user" class="sb-ul-a">
			<div id="sb-photo">
				<i id="sb-admin-default"></i>
			</div>
			<span id="sb-user-name">
				<spring:message code="admin.view.name"/>
			</span>
        </a>
        
        
        <ul class="sb-ul">
        
            <li class="sb-li">
                <a class="sb-ul-a" href="<c:url value="/user/logout"/>" id="menu-disconnect">
                    <i class="fa-power-off sb-icon"></i>
                    <spring:message code="menu.logout"/>
                </a>
            </li>
            
		</ul>
		
	</div>
	
</nav>
	