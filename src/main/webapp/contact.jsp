<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Skychat</title>
<link rel="stylesheet" type="text/css" href="CSS/index.css">
<link rel="stylesheet" type="text/css" href="CSS/contact.css">
<link rel="stylesheet" type="text/css" href="CSS/loader.css">
<link rel="stylesheet" type="text/css" href="CSS/button.css">
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
          <% HttpSession loginsession = request.getSession(false);
	         boolean userLogin = loginsession != null && loginsession.getAttribute("userLogin") != null && (boolean) loginsession.getAttribute("userLogin"); 
	         if(userLogin){%>
          <li><a href="dashboard.jsp">Dashboard</a></li>
          <% }else{%>
          
          <li><a href="login.jsp">Dashboard</a></li>
          <%} %>
          <li><a href="#" >About</a></li>
          <li><a href="contact.jsp">Contact</a></li>
      	</ul>
      	<%
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
	         HttpSession session3 = request.getSession(false);
	         boolean messageSent = session3 != null && session3.getAttribute("messageSent") != null && (boolean) session3.getAttribute("messageSent");
	         if(messageSent) {
		     %>
		     	<script>
		        	alert("Mesazhi eshte derguar me sukses!");
		        </script>
		     <%
		         session3.removeAttribute("messageSent");
		      }
		     %>
 			<div class="contact-text">
 			<h3>
          	Say Hello to Us
        	</h3>
        	<p>Do you have any questions? Or simply want to say hi? <br> Drop us a message. </p>
 			</div>
 			 
 		</div>
 		<div class="box2">
 		<div class="contact-inputs">
 				  <form action="contact" name="contactform" onsubmit="return contact();" method="post">
			      <div>
			      <input placeholder="What is your name?" id="input-33" type="text" name="fullname">
			      <input placeholder="What is your email?" id="input-33" type="email" name="emailc">
			      </div>
			      <div>
			      <input placeholder="What is your phone number?" id="input-33" type="text" name="phonec">
			       <input placeholder="What is your company?" id="input-33" type="text" name="companyc">
			      </div>
			      <textarea rows="10" cols="85" placeholder="Write your message here" name="messagec"></textarea>
			      <div><input type="submit" value="Send Message" name="submit"></div> 
			      </form>
 			</div>
 		</div>
 	</div>
     <script type="text/javascript" src="JS/index.js"></script>
     <script type="text/javascript" src="JS/validation.js"></script>
	 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</body>
</html>