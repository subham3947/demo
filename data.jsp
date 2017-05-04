<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-color:#BFAFB2">
	<h1 align = "center">Enter The Details</h1>
	<form name = "frm" action = "AddData" method = "post" enctype = "multipart/form-data">
	<table border = "1px solid black" width = "600px" align = "center">
		<tr><td>Full Name : </td><td><input type = "text" name = "name" size = "40"></td></tr>
		<tr><td>Designation : </td><td><input type = "text" name = "designation" size = "40"></td></tr>
		<tr><td>Organization : </td><td><input type = "text" name = "organization" size = "40"></td></tr>
		<tr><td>Address : </td><td><textarea rows = "5" cols = "35" name = "address"></textarea></td></tr>
		<tr><td>Contact : </td><td><input type = "text" name = "phone" size = "40"></td></tr>
		<tr><td>E-Mail : </td><td><input type = "text" name = "email" size = "40"></td></tr>
		<tr><td>Birth Date : </td><td><input type = "text" name = "birthdate" size = "40">&nbsp;&nbsp;(DD-MM-YYYY)</td></tr>
		<tr><td>Bio : </td><td><textarea rows = "5" cols = "35" name = "bio"></textarea></td></tr>
		<tr><td>Upload Photo : </td><td><input type = "file" name = "file" size = "40"></td></tr>
	</table>
		<p align = "center"><input type = "submit" value = "Submit">&nbsp;&nbsp;&nbsp;<input type = "reset" value = "Reset"></p>
	</form>
</body>
</html>