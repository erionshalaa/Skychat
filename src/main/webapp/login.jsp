<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Skychat</title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="CSS/login.css">
<link rel="stylesheet" type="text/css" href="CSS/index.css">
<link rel="stylesheet" type="text/css" href="CSS/loader.css">
<link rel="stylesheet" type="text/css" href="CSS/button.css">
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
    
     
  <div class="login-form">
    <form action="Login_Servlet" name="login" onsubmit="return login();" method="post">
    	<div class="head">
    	<h1>Welcome Back</h1>
    	</div>
    	<div class="app-icons">
	<button type="button" disabled class="loginBtn loginBtn--facebook">
 	 Login with Facebook
	</button>

		<button type="button" disabled class="loginBtn loginBtn--google">
  	Login with Google
		</button>  	
    	</div>
    	<div  class="separator"><p >
        Or login with email
      </p></div>
      
      
      <div class="v-text-field__slot">
      <input placeholder="Email" id="input-33" type="email" name="loginemail" >
      </div>
      <div class="v-text-field__slot">
      <input placeholder="Password" id="input-33" type="password" name="loginpassword" >
      </div>
      <div class="forgot-password">
      <a href="#" id="a-forgot">Forgot Password</a>
      </div>
    	

      <input type="submit" value="CONTINUE">
    </form>

  </div>
  <div class="photo">
  <div class="login-header" >

				<h1>Please login to continue</h1>
				<p>A platform with efficient integration of many features <br> and so much more </p>
            </div>
	
	<img class="login-pic" src="Pictures/login.png">
	</div>
	
     </div>
     
     </div>
 	
 
  <script type="text/javascript" src="JS/index.js"></script>
  <script type="text/javascript" src="JS/validation.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</body>
</html>