<%@page session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>Spring Security</title>
</head>
<body>
	<h1>Message : ${message}</h1>
	<h1>Username: ${userName}</h1>
	<a href="<c:url value="/j_spring_security_logout/"/>">Logout</a>
</body>
</html>