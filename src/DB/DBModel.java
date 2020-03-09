package DB;

import java.sql.*;

import Book.Book;

public class DBModel implements DBOperations{

	private static DBModel model = null;
	private static Connection conn = null;
	
	static {
		try {
			Class.forName(Params.DRIVER);
		}
		
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
		
	
	private DBModel()
	{
		
	}
	
	public static DBModel getInstance()
	{
		if(model == null)
			model = new DBModel();
		
		return model;
	}
	
	private static Connection getConnection()
	{
		if(conn == null)
			try{
					conn = DriverManager.getConnection(Params.URL, Params.USER, Params.PASS);
				}	
			catch(Exception e) { 
				System.out.println(e);
			}
			
		
		return conn;
	}
	
	@Override
	public boolean addToDatabase(Book b) {
		// TODO Auto-generated method stub
		Connection c = getConnection();
		String query = "call New_Book('" + b.getName()       + "','" 
										 + b.getAuthor()  	 + "','" 
										 + b.getPhoto_loc()  + "'," 
										 + b.getFloor()      + "," 
										 + b.getRoom()  	 + ",'" 
										 + b.getSection()	 + "'," 
										 + b.getShelf()  	 + ",'" 
										 + b.getTags()	 	 + "')";
		System.out.println(query);
		try {
			Statement stmt = c.createStatement();
			stmt.execute(query);
			return true;
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		return false;
	}

	@Override
	public String getBooksInJSON(String bookName) {
		// TODO Auto-generated method stub
		Connection c = getConnection();
		String query = "select * from `Book_Description` where `Book_Name` like '%" + bookName + "%' or `Tags` like '%" + bookName + "%'";
		String JSONString = "{\"stuff\":[";

		try {
	    Statement stmt = c.createStatement();
	    ResultSet rs = stmt.executeQuery(query);   
		
	    while(rs.next())
	        {
	            
				JSONString += "{";

	            JSONString += "\"photo_loc\" : \"" + rs.getString("Photo_Location") + "\",";
	            
	            JSONString +=  "\"book_name\":\"" + rs.getString("Book_Name") + "\",";
	            JSONString +=  "\"author\":\"" + rs.getString("Author") + "\",";
        
	            JSONString +=  "\"location\":\"" + "Section : " + rs.getString("Section") + ", Shelf : " + rs.getInt("Shelf") + "\",";
	            
	            JSONString +=  "\"tags\" : \"" + rs.getString("Tags") + "\"";
	            
	            JSONString += "}";
	            
	            if(!rs.isLast())
	            	JSONString += ",";
	            
	        }

	    	JSONString += "]}";
		}
		
		catch(Exception e)
		{
			System.out.println(e);
		}
	    
		return JSONString;
	}
	
}
