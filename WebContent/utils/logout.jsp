<%
	session.invalidate();
	response.setHeader("Refresh", "3;url=../login.jsp");
	
	out.println("You've been logged out.<br/> Redirecting you.....");
%>	