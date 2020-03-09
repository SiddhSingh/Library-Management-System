<%@page import="Book.Book"%>
<%@page import="DB.DBModel"%>
<%@page import="java.util.UUID"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext"%>
<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%
	final String FileLocation = pageContext.getServletContext().getInitParameter("file-upload");
	boolean uploadSuccessful = false;
	String name = "";
	
	if(ServletFileUpload.isMultipartContent(request))
	{
		try{
			List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(new ServletRequestContext(request));
			for(FileItem item : multiparts)
			{
				if(!item.isFormField())
				{
					name = UUID.randomUUID().toString().substring(0, 30) + item.getName().substring(item.getName().lastIndexOf('.'));
					item.write(new File(FileLocation  + File.separator + name));
				}
			}
			
			uploadSuccessful = true;
		}
		
		catch(Exception e)
		{
			System.out.println(e);			
		}
	}
	
	if(uploadSuccessful)
	{
		Book b = (Book)session.getAttribute("Book");
		b.setPhoto_loc(name);
		
		if(DBModel.getInstance().addToDatabase(b))
			out.println("Added to Database");
		else
			out.println("Couldn't add to Database");
	}
	
%>