<%@page import="DB.DBModel"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="org.apache.tomcat.util.json.JSONParser"%>
<%
	String book_name = request.getParameter("book_name");
	if(!(book_name == null || book_name == ""))
	{
		out.println(DBModel.getInstance().getBooksInJSON(book_name));
	}
%>