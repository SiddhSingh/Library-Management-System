

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Controller
 */
@WebServlet(
		description = "MVC - Controller", 
		urlPatterns = { 
				"/Controller", 
				"*.goto"
		})
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String URI = request.getRequestURI();
//		System.out.println(URI);
		URI = URI.substring(URI.lastIndexOf('/') == -1 ? 0 : URI.lastIndexOf('/') + 1);
		URI = URI.substring(0, URI.indexOf('.') == -1 ? URI.length() : URI.indexOf('.'));
		
		switch(URI)
		{
			case "login":	response.sendRedirect(request.getContextPath() + "/login");
//							request.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
							break;
				
			case "Controller":
			case "search": 	
							response.sendRedirect(request.getContextPath() + "/search");
//							request.getServletContext().getRequestDispatcher("/search.jsp").forward(request, response);
							break;
							
			case "search_books":
							request.getServletContext().getRequestDispatcher("/utils/searchBooks.jsp").forward(request, response);
//							response.sendRedirect("/books");
							break;
							
			case "dashboard":
//							request.getServletContext().getRequestDispatcher("/libDashboard.jsp").forward(request, response);
							response.sendRedirect(request.getContextPath() + "/dashboard");
							break;
							
			case "add_book":
//							request.getServletContext().getRequestDispatcher("/utils/addBook.jsp").forward(request, response);
							response.sendRedirect(request.getContextPath() + "/addNewBook");
							break;
				
			case "add_photo_of_book":
							request.getServletContext().getRequestDispatcher("/newBookPhoto").forward(request, response);
							break;
							
			case "add_book_to_db":
							request.getServletContext().getRequestDispatcher("/bookResult").forward(request, response);
							break;
							
			case "issue":
							response.sendRedirect(request.getContextPath() + "/issue");
							break;
							
			case "issue_book_result":
							request.getServletContext().getRequestDispatcher("/utils/issueBook.jsp").forward(request, response);
							break;
							
			case "return":
//							request.getServletContext().getRequestDispatcher("/utils/return.jsp").forward(request, response);
							response.sendRedirect(request.getContextPath() + "/return");
							break;
							
			case "return_book_result":
							request.getServletContext().getRequestDispatcher("/utils/returnBook.jsp").forward(request, response);
							break;
							
			case "view_student_transaction":
//							request.getServletContext().getRequestDispatcher("/utils/studentTransactions.jsp").forward(request, response);
							response.sendRedirect(request.getContextPath() + "/transactionDetails");
							break;
							
			case "get_student_transaction":
							request.getServletContext().getRequestDispatcher("/utils/getStudentTransaction.jsp").forward(request, response);
//							response.sendRedirect("/studentTransactions");
							break;
							
			case "validate" :
							request.getServletContext().getRequestDispatcher("/utils/validate.jsp").forward(request, response);
//							response.sendRedirect("/validate");
							break;			
							
			case "logout": 
							request.getServletContext().getRequestDispatcher("/utils/logout.jsp").forward(request, response);
//							response.sendRedirect("/logout");
							break;
								
			default:
//					request.getServletContext().getRequestDispatcher("/pageNotFound").forward(request, response);
					response.sendRedirect(request.getContextPath() + "/pageNotFound");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
