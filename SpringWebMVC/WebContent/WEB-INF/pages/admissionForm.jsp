<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admission</title>
</head>
<body>
<h2><b>${headerText}</b></h2>
<form:errors path="student.*"/>
<form action="submitAdmissionForm" name="addmissionForm" method="post">
	<table border="0">
		<caption><b>${message }</b></caption>
		<tr>
			<td>Student Roll No : </td>
			<td><input type="text" name="rollNo"></td>
		</tr>
		<tr>
			<td>Student name : </td>
			<td><input type="text" name="studentName"></td>
		</tr>
		<tr>
			<td>Mobile Number : </td>
			<td><input type="text" name="mobileNumber"></td>
		</tr>
		<tr>
			<td>Date of Birth : </td>
			<td><input type="text" name="studentDob"></td>
		</tr>
		<tr>
			<td>Skills : </td>
			<td>
				<select name="skills" multiple="multiple">
					<option value="Java">Java</option>
					<option value="Oracle">Oracle</option>
					<option value=".net">.net</option>
					<option value="php">php</option>
				</select>
			</td>
		</tr>
		<tr>
			<th colspan="2">Address</th>
		</tr>
		<tr>
			<td>City : </td>
			<td><input type="text" name="address.city"></td>
		</tr>
		<tr>
			<td>State : </td>
			<td><input type="text" name="address.state"></td>
		</tr>
		<tr>
			<td>PIN Code : </td>
			<td><input type="text" name="address.pinCode"></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" name="submit" value="Submit"></td>
		</tr>
	</table>
</form>
</body>
</html>