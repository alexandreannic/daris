<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<nav id="sb">
	<div id="sb-head">
	
	</div>
	
	<ul id="sb-nav">
		<li class="sb-li">
			<a class="sb-li-a">
				<i class="fa-calendar-o"></i>
				<spring:message code="menu.home"/>
			</a>
		</li>
		
		<li class="sb-li">
			<a class="sb-li-a">
				<i class="fa-home"></i>
				<spring:message code="menu.events"/>
			</a>
		</li>
	</ul>
</nav>
	