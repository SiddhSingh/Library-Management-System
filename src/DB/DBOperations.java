package DB;

import java.util.List;

import Book.Book;

interface DBOperations {
	
	public boolean addToDatabase(Book b);
	public String getBooksInJSON(String bookName);
	public String loginValidation(String username, String password);
	public int issueReturnBook(String bookID, String studentID, boolean issue);
	public List<String> studentTransaction(String studentID);
}
