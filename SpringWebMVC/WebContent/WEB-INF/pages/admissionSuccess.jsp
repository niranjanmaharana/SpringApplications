<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admission Success</title>
</head>
<body>
<h2>${headerText}</h2>
<table border="1">
	<caption>${message }</caption>
	<tr>
		<td>Roll Number : </td>
		<td>${student.rollNo}</td>
	</tr>
	<tr>
		<td>Student Name : </td>
		<td>${student.studentName}</td>
	</tr>
	<tr>
		<td>Mobile Number : </td>
		<td>${student.mobileNumber}</td>
	</tr>
	<tr>
		<td>Date of Birth : </td>
		<td>${student.studentDob}</td>
	</tr>
	<tr>
		<td>Skills : </td>
		<td>${student.skills}</td>
	</tr>
	<tr>
		<td>Address : </td>
		<td>${student.address.city}, ${student.address.state}, ${student.address.pinCode}</td>
	</tr>
</table>
</body>
</html>