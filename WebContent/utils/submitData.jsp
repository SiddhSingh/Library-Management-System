<%@page import="Book.Book"%>
<%
	Book b = new Book();
	
	b.setName(request.getParameter("name"));
	b.setAuthor(request.getParameter("author"));
	
	b.setFloor(Integer.parseInt(request.getParameter("floor")));
	b.setRoom(Integer.parseInt(request.getParameter("room")));
	b.setSection(request.getParameter("section"));
	b.setShelf(Integer.parseInt(request.getParameter("shelf")));
	
	b.setTags(request.getParameter("tags"));
	
	session.setAttribute("Book", b);
	
	System.out.println(session.getAttribute("Book"));
	
%>