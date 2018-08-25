<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Spring Security</title>
<style>
.errorBlock{color: #ff0000;
background-color: #ffeeee;
border: 3px solid #ff0000;
padding: 8px;
margin: 16px;
}
</style>
</head>
<body onload="document.f.j_username.focus()">
	<h1>Login with custom login page</h1>
	<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
		<div class='errorBlock'>
			Your login attempt was not successfull ! Please try again.<br>
			Reason : ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
		</div>
	</c:if>
	
	<form name="f" action="<c:url value='j_spring_security_check'/>" method="post">
		<table>
			<tr>
				<th>Username</th>
				<td><input type='text' name='j_username'></td>
			</tr>
			<tr>
				<th>Password</th>
				<td><input type='password' name='j_password'></td>
			</tr>
			<tr>
				<th></th>
				<td><input type="submit" value="Login"></td>
			</tr>
		</table>
	</form>
</body>
</html>