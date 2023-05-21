package Dashboard_Messages;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import CRUD_Users.registerdb;
import CRUD_Users.User;

/**
 * Servlet implementation class dashboard_servlet
 */
@WebServlet("/dashboard_servlet")
public class dashboard_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dashboard_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String action = request.getParameter("action");
		User loggedInUser = (User) request.getSession().getAttribute("loggedInUser");
		
		
		int logged = Integer.parseInt(loggedInUser.getId());
		registerdb friendshipDAO = new registerdb();
		List<String> friendNames = null;
		try {
			friendNames = friendshipDAO.getFriends(logged);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("friendNames", friendNames);
		RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");
		dispatcher.forward(request, response);
		
		if (userId != null && action != null) {
	        int id = Integer.parseInt(userId);
	        int loggedid = Integer.parseInt(loggedInUser.getId());
	        registerdb userDAO = new registerdb();
	        if (action.equals("addfriend")) {
	            userDAO.addfriend(loggedid,id); 
	            response.sendRedirect("dashboard_servlet");
		        } 
		    }
		}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
