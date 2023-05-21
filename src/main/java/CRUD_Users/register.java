package CRUD_Users;


import java.io.IOException;


import java.util.Base64;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
    public register() {
    	super();
        // TODO Auto-generated constructor stub
    }

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		    
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("pword");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
	    
		byte[] salty = PasswordUtils.generateSalt();
	    String salt = new String(Base64.getEncoder().encode(salty));
	    String pword = PasswordUtils.hashPassword(password, salty);
		
		
		User user = new User(email,pword,fname,lname,salt);
		registerdb rdb = new registerdb();
		String result = rdb.insert(user);
	
		response.getWriter().print(result);
		
		HttpSession session = request.getSession();
	    session.setAttribute("userInserted", true);
	    response.sendRedirect("register.jsp");

	}
}