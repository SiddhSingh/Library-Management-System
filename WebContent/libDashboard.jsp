<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
	if(session.getAttribute("user") == null)
		response.sendRedirect("login.jsp");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title> Library Dashboard </title>
    <link href="utils/css/dashboard.css" type="text/css" rel="stylesheet" />
    <script src="utils/js/dashboard.js"></script>
</head>

<body>
    <div id="container">
        <div id="header">
            <div>Welcome, <%=(String)session.getAttribute("user") %></div>
            <div id="logout">
                <a href="utils/logout.jsp">
                    Logout
                </a>
            </div>
        </div>
        <div id="nav">
            <div onclick="fetch_content(this.innerHTML)">
                Add Book
            </div>
            <div onclick="fetch_content(this.innerHTML)">                
                Issue
            </div>
            <div onclick="fetch_content(this.innerHTML)">
                Return
            </div>
            <div>
                 View Student Transaction
            </div>
        </div>
        <div id="content">
            <div>
                Click to perform an action
            </div>
        </div>
    </div>
</body>

</html>

</html>

</html>