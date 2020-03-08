<%@page import="java.sql.ResultSet"%><%@page import="java.sql.Statement"%><%@page import="java.sql.Connection"%><%@page import="java.sql.DriverManager"%><%
	String username = request.getParameter("username");
	String password = request.getParameter("password");

	if(username != null && password != null)
	{
		try{
			Class.forName("com.mysql.jdbc.Driver");
		
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/library", "aarya", "aarya");
		Statement stmt = conn.createStatement();
		
		String query = "select * from librarian where librarian_id='" + username + "' and librarian_password = '" + password + "'";
		ResultSet rs = stmt.executeQuery(query);
		
		rs.next();
		
		if(rs.getString("librarian_password").compareTo(password) == 0)
			{
				out.println("1");
				session.setAttribute("username", rs.getString("librarian_name"));
			}
		else
			out.println("0");
		}
		catch(Exception e)
		{
			out.println("0");
		}
	}
	
	else
		out.println("0");
%>