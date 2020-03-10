package DB;

interface Params {
	
	String DRIVER = "com.mysql.jdbc.Driver";
	
	String HOST = "localhost";
	String PORT = "3306";

	String USER = "root";
	String PASS = "aarya";
	
	String DATABASE = "Library";

	String URL = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DATABASE;
}
