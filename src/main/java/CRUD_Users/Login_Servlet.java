package CRUD_Users;

import java.io.IOException;
import java.util.Base64;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Login_Servlet")
public class Login_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Login_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String loginemail = request.getParameter("loginemail");
		String loginpassword = request.getParameter("loginpassword");
		
		registerdb rgdb1 = new registerdb();
		registerdb rgdb2 = new registerdb();
		User user = rgdb1.getUserByEmail(loginemail);
		User user1 = rgdb2.getUserByEmail1(loginemail);
		
		if(user != null) {
			String saltString = user.getSalt();
		if(saltString !=null) {
			String hashedPassword = user.getPword();
		    byte[] salt = Base64.getDecoder().decode(saltString);
		    String hashedEnteredPassword = PasswordUtils.hashPassword(loginpassword, salt);
		    

			if(hashedEnteredPassword.trim().equals(hashedPassword.trim())){
					HttpSession loginsession = request.getSession();
				    loginsession.setAttribute("userLogin", true);
				    request.getSession().setAttribute("loggedInUser", user1);
				    registerdb rgdb = new registerdb();
				    HttpSession accesssession = request.getSession(true);
				    if(rgdb.checkAccess(user)) {
				    	accesssession.setAttribute("checkAccess", true);
				    }else {
				    	accesssession.setAttribute("checkAccess", false);
				    }
				    
				    response.sendRedirect("dashboard_servlet");
				    return;
		    } else {
		        // Forward request to the login page with an error message
		        request.setAttribute("error", "Incorrect email or password");
		        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		        dispatcher.forward(request, response);
		    }
		}
	}
	}


}
