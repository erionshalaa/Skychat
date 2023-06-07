package CRUD_Users;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import CRUD_Users.User;
import CRUD_Users.registerdb;
import Dashboard_Messages.Friends;


/**
 * Servlet implementation class editprofile
 */
@WebServlet("/editprofile")
public class editprofile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editprofile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
		
		}



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String userid = request.getParameter("userid");
		
		User user = new User(userid,email,fname,lname);
		registerdb rdb = new registerdb();
		String result = rdb.updateUser(user);
	
		response.getWriter().print(result);
		
		HttpSession session = request.getSession();
	    session.setAttribute("userUpdated", true);
	    response.sendRedirect("editprofile.jsp");
		}
	}


