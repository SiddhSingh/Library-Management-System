<%@page import="Book.Book"%>
<%
	if(session.getAttribute("user") == null)
		response.sendRedirect("login.goto");

	Book b = new Book();
	
	b.setName(request.getParameter("name"));
	b.setAuthor(request.getParameter("author"));
	
	b.setFloor(Integer.parseInt(request.getParameter("floor")));
	b.setRoom(Integer.parseInt(request.getParameter("room")));
	b.setSection(request.getParameter("section"));
	b.setShelf(Integer.parseInt(request.getParameter("shelf")));
	
	b.setTags(request.getParameter("tags"));
	
	session.setAttribute("Book", b);
	
%>
<form action="add_book_to_db.goto" method="post" name="cover" enctype="multipart/form-data">
	Book Cover : <input type="file" name="photoLoc" id="photoLoc"/>
	<button>Submit</button>
</form>