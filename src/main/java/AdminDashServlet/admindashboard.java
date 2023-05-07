package AdminDashServlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
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
		  String userId = request.getParameter("userId");
		  String action = request.getParameter("action");
		  if (userId != null && action != null) {
		        int id = Integer.parseInt(userId);
		        registerdb userDAO = new registerdb();
		        if (action.equals("changetoadmin")) {
		            userDAO.changeAccessToAdmin(id); 
		        } else if (action.equals("changetouser")) {
		            userDAO.changeAccessToUser(id);
		        }
		    }
		  String contactId = request.getParameter("contactId");
		  if(contactId != null) {
			  int id = Integer.parseInt(contactId);
			  contactsdb contactdao = new contactsdb();
			  if(action.equals("deletecontact")) {
				  contactdao.deleteContact(id);
			  }
		  }
		  
		registerdb userDAO = new registerdb();
	    ArrayList<User> users = userDAO.selectallusers();
	    contactsdb userDAO1 = new contactsdb();
	    ArrayList<ContactGS> contacts = userDAO1.selectallcontacts();
	    
	    
	    request.setAttribute("userList", users);
	    request.setAttribute("contactList", contacts);
	    RequestDispatcher dispatcher = request.getRequestDispatcher("admindashboard.jsp");
	    dispatcher.forward(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
