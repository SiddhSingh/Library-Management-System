<%@page import="DB.DBModel"%>
<%@page import="java.sql.ResultSet"%><%@page import="java.sql.Statement"%><%@page import="java.sql.Connection"%><%@page import="java.sql.DriverManager"%><%
	String username = request.getParameter("username");
	String password = request.getParameter("password");

	if(username != null && password != null)
	{
		String name = DBModel.getInstance().loginValidation(username, password);
		if(name != null)
		{
			session.setAttribute("user", name);
			out.println("1");
		}
		
		else
			out.println("0");
	}
	
	else
		out.println("0");
%>