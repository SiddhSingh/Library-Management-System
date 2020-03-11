<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	if(session.getAttribute("user") == null)
		response.sendRedirect("../login.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
	<div style="display: flex; justify-content: center">
		<form action="getStudentTransaction.jsp" method="get">
			Student ID : <input name="studentID" />
			<button> Get Transaction Log </button>
		</form>
	</div>
</body>
</html>