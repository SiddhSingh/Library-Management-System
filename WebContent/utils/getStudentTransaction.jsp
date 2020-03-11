<%@page import="DB.DBModel"%>
<%@page import="java.util.List"%>
<%
	if(session.getAttribute("user") == null)
		response.sendRedirect("../login.jsp");

	if(request.getParameter("studentID") == null)
		out.println("Provide Student ID");
	
	else
	{
		List<String> result = DBModel.getInstance().studentTransaction(request.getParameter("studentID"));
		String outHTML = "<table>";
		for(String log : result)
			outHTML += "<tr><td>" + log + "</tr></td>";
		outHTML += "</table>";
		
		out.println(outHTML);
	}
%>