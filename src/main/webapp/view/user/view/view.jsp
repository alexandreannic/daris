
<%@ page language='java' contentType='text/html; charset=ISO-8859-1' isELIgnored='false' pageEncoding='ISO-8859-1'%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="col-sm-8"  >
	<div class="panel" id="container">
		<div id="panel-photo">
			<div id="sb-photo">
				<img id="sb-photo-img"
					src="/daris/assets/img/users/${follow.picture }"></img>
			</div>
			<div id="info">
				<div class="form-field">
					<span class="dd"><spring:message code='user.field.firstName' /></span>
					<span class="dt">${follow.firstName}</span> <span class="dd"><spring:message
							code='user.field.lastName' /></span> <span class="dt">${follow.lastName}</span>
				</div>

				<div class="form-field">
					<span class="dd"><spring:message code='field.address' /></span> <span
						class="dt">${follow.address}</span> <span class="dd"><spring:message
							code='field.city' /></span> <span class="dt">${follow.city}</span>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="col-sm-4">
	<div class="panel">
		blah blah
	</div>
</div>
