<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	if(session.getAttribute("user") == null)
		response.sendRedirect("../login.jsp");
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Issue Book</title>
</head>
<body>
	<div>
		<form action="issueBook.jsp" method="post">
			<table>
				<tr><td>Book No:</td><td><input name="bookID" /></tr>
				<tr><td>Student ID:</td><td><input name="studentID" /></tr>
				<tr><td colspan="2"><button> Submit </button></td></tr>
			</table>	
		</form>
	</div>
</body>
</html>