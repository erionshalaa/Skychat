package CRUD_Users;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login_Servlet
 */
@WebServlet("/Login_Servlet")
public class Login_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String loginemail = request.getParameter("loginemail");
		String loginpassword = request.getParameter("loginpassword");
		
		User user = new User();
		user.setEmail(loginemail);
		user.setPword(loginpassword);
		
		registerdb rgdb = new registerdb();
		
		
		
			if(rgdb.validate(user)){
					HttpSession loginsession = request.getSession();
				    loginsession.setAttribute("userLogin", true);
				    response.sendRedirect("login.jsp");
				
		    } else {
		        // Forward request to the login page with an error message
		        request.setAttribute("error", "Incorrect email or password");
		        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		        dispatcher.forward(request, response);
		    }
		
		
	
		
		
	}



}
