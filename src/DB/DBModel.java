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
	public String getBooksInJSON(String word) {
		// TODO Auto-generated method stub
		Connection c = getConnection();
		String query = "select * from `Book_Description` where "
				+ " `Book_Name` like '%" + word + "%'"
				+ " or `Book_Name` like '" + word + "'"
				+ " or `Tags` like '%" + word + "%'" 
				+ " or `Author` like '%" + word + "%'";
		
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

	@Override
	public String loginValidation(String username, String password) {
		// TODO Auto-generated method stub
		Connection c = getConnection();
		String query = "select id as `username`, name ,pass as `password` from libuser where id='" + username + "' and pass='" + password + "'";
		
		try {
			Statement stmt = c.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next())
			{
				if(rs.getString("username").equals(username) && rs.getString("password").equals(password))
					return rs.getString("name");
				else
					return null;
			}
		}
		
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		return null;
	}

	@Override
	public int issueReturnBook(String bookID, String studentID, boolean issue) {
		// TODO Auto-generated method stub
		/*
		 *  0 -> Book Transaction Successful
		 *  1 -> Book Transaction Failed
		 *  2 -> Book Transaction Error
		 * 
		 */
		Connection c = getConnection();		
		String query = "";
		
		if(issue)
			query = "select `Issue`('" + bookID + "', '" + studentID + "') as `Issued`";
		
		else
			query = "select `Return`('" + bookID + "', '" + studentID + "') as `Returned`";
		
		try {
			
			Statement stmt = c.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next())
			{
				if(rs.getBoolean(issue ? "Issued" : "Returned"))
					return 0;
				
				else
					return 1;
			}
			
		}
		
		catch(Exception e)
		{
			System.out.println(e);
			return 2;
		}
		
		return 0;
	}

	
}
