<%@page import="DB.DBModel"%>
<%
	if(session.getAttribute("user") == null)
		response.sendRedirect("login.goto");

	String bookID = request.getParameter("bookID");
	String studentID = request.getParameter("studentID");
	
	if(bookID != null && studentID != null)
	{
		int result = DBModel.getInstance().issueReturnBook(bookID, studentID, true);
		
		if(result == 0)
			out.println("Issued Successful");
		
		else if(result == 1)
			out.println("Book already been issued");
		
		else if(result == 2)
			out.println("An Error Occured check Student ID and Book ID");
	}
	
	else
	{
		out.println("Provide Book ID and Student ID");
	}
%>