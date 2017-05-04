<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.*,java.util.*"  %>
<%
	HttpSession sess = request.getSession(false);
	String name = null;
	if(sess!=null){
		 name = (String)sess.getAttribute("UN");
	}
	sess.setAttribute("Name",sess.getAttribute("UN"));
	Class.forName("com.ibm.db2.jcc.DB2Driver");
	Connection conn = DriverManager.getConnection("jdbc:db2://localhost:50000/CRM","WEBTEKLABS","webtek");
	PreparedStatement ps = conn.prepareStatement("select Name from DETAILS");
	ResultSet s = ps.executeQuery();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-color:#A1CAF1">
	<marquee style = "background-color:#E0218A"><h1>Hello <%= name %> Welcome To CRM</h1></marquee>
	<div style = "border:1px solid black;width:500px;height:300px;padding:20px;float:left;margin:30px;">
	<h2 style = "text-align:center;">Your Friend List is as follows : </h2>
		<ol>
		<%while(s.next()){
		%>
		<li><a style = "text-decoration:none;font-weight:bolder;font-size:20px;" href = "info.jsp?name=<%= s.getString(1)%>"><%= s.getString(1) %></a></li>
		<%} %>
		</ol>
	</div>
	<div style="border:1px solid black;float:left;margin-left:20px;margin-top:70px;width:400px;height:100px;">
		<h3 style="text-align:center;">Add New Friends </h3>
		<form action="data.jsp" method = "post"><center><input type="submit" value="Add New"></center>
		</form>
	</div>
</body>
</html>