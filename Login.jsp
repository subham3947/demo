<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-color:cyan;">
	<marquee style = "background-color:yellow;"><h2>Please Login</h2></marquee>
	<div style = "border:1px solid black;padding:20px;width:50%;margin-left:20%;margin-top:50px;">
	<form action = "login" method = "post">
		<table border = "1px solid black" align = "center">
			<tr><td>UserName : </td><td><input type = "text" name = "username"></td></tr>
			<tr><td>Password : </td><td><input type = "password" name = "password"></td></tr>
		</table>
		<p align = "center"><input type = "submit" value = "Submit"></p>
	</form>
	</div>
</body>
</html>