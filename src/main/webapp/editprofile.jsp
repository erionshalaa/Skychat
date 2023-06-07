<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@  page import="CRUD_Users.User" %>
<%@  page import="CRUD_Users.registerdb" %>
<%@ page import="java.util.ArrayList" %>


<!DOCTYPE html>
<html>
<head>
<title>Skychat</title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="CSS/login.css">
<link rel="stylesheet" type="text/css" href="CSS/index.css">
<link rel="stylesheet" type="text/css" href="CSS/loader.css">
<link rel="stylesheet" type="text/css" href="CSS/signup.css">
<link rel="stylesheet" type="text/css" href="CSS/button.css">
<link rel="stylesheet" type="text/css" href="CSS/editprofile.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="website icon" type="png" href="Pictures/applogo.png">
</head>
<body>

<div class="loader_bg">
 	<div class="loader"></div>
 	</div>
 	
 	
 	<div class="header">
  		<img class="logoicon" src="Pictures/applogo.png" >
		<h1 class="logo"><a href="index.jsp">Skychat</a></h1>
    	<ul class="main-nav">
            <li><a href="index.jsp">Homepage</a></li>
       	  <li><a href="index.jsp">Features</a></li>
       	  <% HttpSession loginsession = request.getSession();
	         boolean userLogin = loginsession != null && loginsession.getAttribute("userLogin") != null && (boolean) loginsession.getAttribute("userLogin"); 
	         if(userLogin){%>
          <li><a href="dashboard_servlet">Dashboard</a></li>
          <% }else{%>
          
          <li><a href="login.jsp">Dashboard</a></li>
          <%} %>
          <li><a href="#" >About</a></li>
          <li><a href="contact.jsp">Contact</a></li>
      	</ul>
      	
		<%
		    // Check if the user is logged in
		    
	         if(userLogin) {
	        	 
		    %>
		    <!-- Content for logged-in users -->
		    <div style="margin-left:100px;"></div>
		 	<details class="dropdown">
			    <summary role="button">
			      <a class="button">My Account</a>
			    </summary>
			    <ul> 
			    <% HttpSession accesssession = request.getSession(false);
		         boolean checkAccess = accesssession != null && accesssession.getAttribute("checkAccess") != null && (boolean) accesssession.getAttribute("checkAccess");
			    if(userLogin && checkAccess){%>
				      <li><a href="editprofile.jsp">My Account</a></li>
				      <li><a href="logout.jsp">Log Out</a></li>
			      <%}else{ %>
				      <li><a href="admindashboard">Admin Dashboard</a></li>
				      <li><a href="editprofile.jsp">My Account</a></li>
				      <li><a href="logout.jsp">Log Out</a></li>
			      <%} %>
			      
			  </ul>
			</details>

			
	     	 
		<% }else{%>  
			 <% String error = (String) request.getAttribute("error");
		       if (error != null) { %>
		       <script>alert("<%=error %>");</script>
        
    			<% } %>
		   
		    <!-- Content for non-logged-in users -->
		    <a href="login.jsp"><button class="login">Log in</button></a>
      		<a href="register.jsp"><button class="signup">Sign up</button></a>
		<%  } %>
		
     </div>
     <div class="container">
     <div class="box">
    
     
     <%
         HttpSession session1 = request.getSession(false);
         boolean userUpdated = session1 != null && session1.getAttribute("userUpdated") != null && (boolean) session1.getAttribute("userUpdated");
         if(userUpdated) {
     %>
     	<script>
        	alert("Keni ndryshuar te dhenat me sukses!");
        </script>
     <%
         session1.removeAttribute("userUpdated");
      }
     %>
   
  <div class="login-form">
    <form action="editprofile" name="editprofile"  onsubmit="return signup();" method="post">
    	<div class="head">
    	<h1>Edit You Profile</h1>
    	</div>
    	
    	<% 
		
		registerdb rgdb = new registerdb();
		List<User> allUsers = rgdb.selectallusers();
			String fname = "";
			String lname = "";
			String email = "";
			String access = "";
			String userid= "";
	
		    User loggedInUser = (User) request.getSession().getAttribute("loggedInUser");
		   
		    for (User user : allUsers) {
		    	if (user.getId().equals(loggedInUser.getId())) {
		    		userid = user.getId();
		    		fname = user.getFname();
					lname = user.getLname();
					email = user.getEmail();
					access = user.getAccess();
					break;
		           
		        }
		    }
		%>
    	<input style="display:none;" name="userid" value="<%= userid  %>">
      <label id="label2">First Name</label>
      <label id="label2-1">Last Name</label>
      <div class="names-input">
      <input id="input-33" type="text" name="fname" value="<%= fname %>">
      <input  id="input-33" type="text" name="lname" value="<%= lname %>">
      </div>
      <div class="v-text-field__slot">
      <label id="label1">Email</label>
      <input id="input-33" type="email" name="email" value="<%= email %>">
      </div>
      <div class="v-text-field__slot">
      <label id="label1">Access</label>
      <input  id="input-33" type="email" readonly  value="<%= access %>">
      </div>
      
      
      <input type="submit" value="CONTINUE" name="submit">
    </form>
  </div>
 
     </div>
     </div>
	
  <script type="text/javascript" src="JS/index.js"></script>
  <script type="text/javascript" src="JS/validation.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</body>
</html>