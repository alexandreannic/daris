<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored='false' pageEncoding="ISO-8859-1"%>

<script>

<%-- Retenir les elements dans des variables pour ne pas avoir � reparcourir le DOM --%>
var signin_form= $('#signin-form');
var signin_uname = $('#signin-uname');
var signin_pwd = $('#signin-pwd');
var signin_pwd_salted = $('#signin-pwd-salted');
var signin_submit = $('#signin-submit');


signin_submit.click(function() {
	signin_pwd_salted.val(CryptoJS.SHA1(signin_pwd.val()));
	signin_pwd.val('');
	signin_form.submit();
});

</script>