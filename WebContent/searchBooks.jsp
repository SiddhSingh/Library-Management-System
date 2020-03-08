<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="org.apache.tomcat.util.json.JSONParser"%>
<%
	try{
		Class.forName("com.mysql.jdbc.Driver");
	}
	catch(Exception e)
	{
		System.out.println(e);
	}

	String book_name = request.getParameter("book_name");
	if(!(book_name == null || book_name == ""))
	{
		
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/library", "aarya", "aarya");
	String query = "select * from book where book_name like '" + book_name + "%'";

    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(query);
    
	String putHTML = "{\"stuff\":[";
	
    while(rs.next())
        {
            
			putHTML += "{";

            putHTML += "\"photo_loc\" : \"" + rs.getString("photo_loc") + "\",";
            
            putHTML +=  "\"book_name\":\"" + rs.getString("book_name") + "\",";
            putHTML +=  "\"author\":\"" + rs.getString("author") + "\",";

            String location_query = "select book.book_id, concat(location.shelf, concat(' Shelf', concat(', ', concat(location.section , ' Section')))) as 'Location' from book, location where book.book_id = location.book_id" +
                        " and book.book_id = " + rs.getString("book_id");
   
            Statement location_statement = conn.createStatement();
            ResultSet location_result = location_statement.executeQuery(location_query);
			location_result.next();
            
            putHTML +=  "\"location\":\"" + location_result.getString("Location") + "\",";

            String tags_query = "select tag_name from tags where book_id = " + rs.getInt("book_id") + " limit 4";
            Statement tag_statement = conn.createStatement();
            ResultSet tags_result = tag_statement.executeQuery(tags_query);
            
            putHTML +=  "\"tags\" : " ;

            String listOfTags = "[";
            while(tags_result.next())
            	listOfTags += "\"" + tags_result.getString("tag_name") + "\",";

            putHTML += listOfTags.length() != 0 ? listOfTags.substring(0, listOfTags.length() - 1) + "]" : "[]";
            
            putHTML +=  "}";
            
            if(!rs.isLast())
            	putHTML += ",";
            
        }

    	putHTML += "]}";
    
        out.println(putHTML);
	}
%>