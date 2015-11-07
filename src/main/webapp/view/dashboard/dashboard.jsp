<%--
	Cette page affiche le tableau de bord d'un utilsateur.
--%>
<%@ page language='java' contentType='text/html; charset=ISO-8859-1' isELIgnored='false' pageEncoding='ISO-8859-1'%>
<%@ taglib uri='http://tiles.apache.org/tags-tiles' prefix='tiles'%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@ taglib uri='http://www.springframework.org/tags' prefix='spring'%>
<%@ taglib uri='http://www.springframework.org/tags/form' prefix='form'%>

<div class='col-xs-12 col-md-8'>
	<div class='panel'>
<!-- 		<textarea id="msg-add"></textarea> -->
<div class="token"></div>
		 <div contenteditable="true" style="min-height:50px; width:300px;" id="txtDiv">
 </div>
		<div class="input-btn"><spring:message code='view.send'/></div>
	</div>
</div>

<div class='col-xs-12 col-md-4'>
	<div class='panel'>
	</div>
</div>

<%@ include file='../locality/view/_asyny-get_view.jsp'%>