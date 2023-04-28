package CRUD_Contacts;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class contacts
 */
@WebServlet("/contact")
public class contact extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public contact() {
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
		String fullname = request.getParameter("fullname");
		String phonec = request.getParameter("phonec");
		String emailc = request.getParameter("emailc");
		String companyc = request.getParameter("companyc");
		String messagec = request.getParameter("messagec");
		
		
		
		ContactGS	contact = new ContactGS(fullname,phonec,emailc,companyc,messagec);
		contactsdb cdb = new contactsdb();
		String result = cdb.insert(contact);
		response.getWriter().print(result);
		
		HttpSession session = request.getSession();
	    session.setAttribute("messageSent", true);
	    response.sendRedirect("contact.jsp");
		
	}

}
