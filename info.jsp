<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import ="java.sql.*,java.util.*" %>
<%	
	Class.forName("com.ibm.db2.jcc.DB2Driver");
    Connection conn = DriverManager.getConnection("jdbc:db2://localhost:50000/CRM","WEBTEKLABS","webtek");
    String name = request.getParameter("name");
    PreparedStatement ps = conn.prepareStatement("select * from DETAILS where NAME = ?");
    PreparedStatement ps1 = conn.prepareStatement("select * from COMMENT_T where NAME = ?");
    ps1.setString(1, name);
    ps.setString(1,name);
    ResultSet s = ps.executeQuery();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type = "text/css" href="style.css">
<title>Insert title here</title>
</head>
<body>
	<div id = "big_wrapper">
	<%while(s.next()){%>
	<div id = "name_pic">
		<div id = "pic"><img src = "<%= s.getString(9)%>" width = "100px" height = "100px" alt = "my_image"></div>
		<div id = "name_desc"><p><%= s.getString(1) %></p>
		<p><%= s.getString(2) %></p></div>
		<div id = "phn_mail">
			<p>Phone Number : <%= s.getString(5) %></p>
			<p>EMail : <%= s.getString(6) %></p>
		</div>
		<div id = "address">
			<p><%= s.getString(4) %></p>
			<p>&nbsp;</p>
		</div>
	</div>
	<div id  = "sidenote">
		<div id = "dates">
			<p>Date To Remember:</p>
			<p>Birthday :- <%= s.getString(7) %></p>
		</div>
		<div id = "bio">
			<p>Bio :</p>
			<%= s.getString(8) %>
		</div>
	</div>	
		<%}%>
	<div id = "box">
		<form action="Comments" method = "post">
			<p>Comment Here:</p>
			<textarea rows = "7" cols = "80" name = "comment"></textarea>
			<p style = "text-align:right;"><input type = "submit" value = "Comment"></p>
			<% session.setAttribute("name",name); %>
		</form>
	</div>
	<div id = "comments_box">
		<textarea rows = "10" cols = "80"><% ResultSet rs = ps1.executeQuery(); %><% while(rs.next()){ %><%= rs.getString(2) %><%} %></textarea>
	</div>
</div>
<div id = "footer">
	<div id = "homepage"><form action="homepage.jsp" method="post"><p><input type="submit" value="Homepage"></p></form></div>
	<div id = "login"><form action="Logout" method="post"><p><input type="submit" value="Logout"></p></form></div>
</div>
</body>
</html>