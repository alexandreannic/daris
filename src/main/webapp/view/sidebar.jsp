<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<nav id="sb">

	<div id="sb-head">
		
		<div id="sb-user" class="sb-ul-a" onclick="$('#changePassword').dialog('open')">
			<i id="sb-photo-default">
			</i>

			<span id="sb-user-name">
				<c:out value="${sessionScope['scopedTarget.user'].firstName}" /><br/>
				TODO Récupérer nom et prénom depuis session !
			</span>
        </div>
        
        
        <ul class="sb-ul">
        
            <li class="sb-li">
                <a class="sb-ul-a" href="<c:url value="logout"/>" id="menu-disconnect">
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
			<a class="sb-ul-a" href="<c:url value="dashboard"/>">
				<i class="fa-home sb-icon"></i>
				<spring:message code="menu.home"/>
			</a>
		</li>
		
		
		<li class="sb-li">
			<a class="sb-ul-a" href="<c:url value="event"/>">
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
	