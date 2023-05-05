package CRUD_Users;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class register
 */
@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public register() {
    	super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		    
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String pword = request.getParameter("pword");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		
		User user = new User(email,pword,fname,lname);
		registerdb rdb = new registerdb();
		String result = rdb.insert(user);
		response.getWriter().print(result);
		
		HttpSession session = request.getSession();
	    session.setAttribute("userInserted", true);
	    response.sendRedirect("register.jsp");

	}
}