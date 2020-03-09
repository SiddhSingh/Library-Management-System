package DB;

import Book.Book;

interface DBOperations {
	
	public boolean addToDatabase(Book b);
	public String getBooksInJSON(String bookName);
	public String loginValidation(String username, String password);
}
