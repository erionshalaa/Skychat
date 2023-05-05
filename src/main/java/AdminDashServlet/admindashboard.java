package AdminDashServlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import CRUD_Contacts.ContactGS;
import CRUD_Contacts.contactsdb;
import CRUD_Users.User;
import CRUD_Users.registerdb;

/**
 * Servlet implementation class admindashboard
 */
@WebServlet("/admindashboard")
public class admindashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public admindashboard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		registerdb userDAO = new registerdb();
	    ArrayList<User> users = userDAO.selectallusers();
	    contactsdb userDAO1 = new contactsdb();
	    ArrayList<ContactGS> contacts = userDAO1.selectallcontacts();
	    
	    HttpSession session1 = request.getSession();
	    HttpSession session = request.getSession();
	    session1.setAttribute("userList", users);
	    session.setAttribute("contactList", contacts);
	    response.sendRedirect("admindashboard.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
