<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
       	  <li><a href="#about" class="scroll">Features</a></li>
          <li><a href="#">Dashboard</a></li>
          <li><a href="#" >About</a></li>
          <li><a href="contact.jsp">Contact</a></li>
      	</ul>
      	<%
		    // Check if the user is logged in
		     HttpSession loginsession = request.getSession(false);
	         boolean userLogin = loginsession != null && loginsession.getAttribute("userLogin") != null && (boolean) loginsession.getAttribute("userLogin");
	         if(userLogin) {
	        	 
		    %>
		    <!-- Content for logged-in users -->
		    <div style="margin-left:100px;"></div>
		 	<details class="dropdown">
			    <summary role="button">
			      <a class="button">My Account</a>
			    </summary>
			    <ul> 
			      <li><a href="#">Dashboard</a></li>
			      <li><a href="#">My Account</a></li>
			      <li><a href="logout.jsp">Log Out</a></li>
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
         boolean userInserted = session1 != null && session1.getAttribute("userInserted") != null && (boolean) session1.getAttribute("userInserted");
         if(userInserted) {
     %>
     	<script>
        	alert("Jeni regjistruar me sukses!");
        </script>
     <%
         session1.removeAttribute("userInserted");
      }
     %>
     
     
   
  <div class="login-form">
    <form action="register" name="register"  onsubmit="return signup();" method="post">
    	<div class="head">
    	<h1>Create New Account</h1>
    	</div>
    	<div class="app-icons">
	<button type="button" disabled class="loginBtn loginBtn--facebook">
 	 Register with Facebook
	</button>

		<button type="button" disabled class="loginBtn loginBtn--google">
  	Register with Google
		</button>  	
    	</div>
    	<div  class="separator"><p >
        Or register with email
      </p></div>
      
      
      <div class="names-input">
      <input placeholder="First Name" id="input-33" type="text" name="fname">
      <input placeholder="Last Name" id="input-33" type="text" name="lname">
      </div>
      <div class="v-text-field__slot">
      <input placeholder="Email" id="input-33" type="email" name="email">
      </div>
      <div class="pw-input">
      <input placeholder="Password" id="input-33" type="password" name="pword">
      <input placeholder="Confirm Password" id="input-33" type="password">
      </div>
      
      <input type="submit" value="CONTINUE" name="submit">
    </form>
  </div>
  <div class="photo">
  <div class="login-header" >

				<h1>Just register to join with us</h1>
				<p>A platform with efficient integration of many features <br> and so much more </p>
            </div>
	
	<img class="login-pic" src="Pictures/register.png">
	</div>
	
     </div>
     
     </div>

  <script type="text/javascript" src="JS/index.js"></script>
  <script type="text/javascript" src="JS/validation.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</body>
</html>