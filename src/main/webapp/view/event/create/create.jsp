<%--
	Cette page permet la création d'un nouvel évènement
--%>

<%@ page language='java' contentType='text/html; charset=ISO-8859-1' isELIgnored='false' pageEncoding='ISO-8859-1'%>
<%@taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@taglib uri='http://www.springframework.org/tags' prefix='spring'%>
<%@taglib uri='http://www.springframework.org/tags/form' prefix='form'%>

<%-- Block de création d'un nouvel évènement --%>
<div class='col-xs-12'>

	<div  class='panel'>
		<h1 class='panel-title'>
			Création d'un nouvel évènement
			<span class='panel-actions'>
				<i id="activiy-add-btn" class="fa-plus-circle i-btn" title='Ajouter une activité'></i>
				<i class='panel-btn-save i-btn' title='Valider' onclick='$("#event-form").submit()'></i>
			</span>
		</h1>
	    <%@ include file='_form-create.jsp'%>
	</div>
	
	
</div>