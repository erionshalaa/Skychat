<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Skychat</title>
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
       	  <li><a href="#about">Features</a></li>
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
				      <li><a href="#">My Account</a></li>
				      <li><a href="logout.jsp">Log Out</a></li>
			      <%}else{ %>
				      <li><a href="admindashboard">Admin Dashboard</a></li>
				      <li><a href="#">My Account</a></li>
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
    
     	<div class="background"></div>
     	<div class="background2"></div>
     	
        	<div class="text-container">
				<h1>Bringing you closer <br> to the people</h1>
				<p><br><br>We're commited to fostering  a safe 
				and <br>supportive community for everyone </p>
            </div>
            <div class="buttons">
            <a href="register.jsp"> <button>Join now</button></a>
            <p class="contact"><i class="fa fa-paper-plane-o"></i> <a href="contact.jsp"> Contact us </a></p>
            </div>
            <div class="image-container">
     		<img class="backpic" src="Pictures/background.svg">
     		<br>
     		<div id="about"></div>
     		<div class="title"><h3>Features</h3></div>
     		<div>
     		<img class="sec-pic" src="Pictures/sec-pic.png"> 
     		<div class="sec-line"><h4>Connect with more people</h4>
     		</div> 
     		<div class="pclass"><p>You'll get fast, simple, secure messaging, available on <br>phones all over the world.</p> </div>
     		</div>
     		<div>
     		<img class="third-pic" src="Pictures/third-pic.png"> 
     		<div class="third-line"><h4>Simplify Your Conversations</h4></div> 
     		<div class="third-p"><p>Effortlessly stay in touch with Skychat <br> the app that simplifies your chats</p></div> 
     		
     		</div>
     		</div>
     		
     		
     		<div class="background3"></div>
     		
     		<div id="ftitle">Stay Connected</div><br>
     		<div class="social-icons">
			  <a href="#"  title="facebook"> 
			    <i class="fa fa-facebook-square" aria-hidden="true"></i>
			  </a>
			  <a href="#" title="twitter"> 
			    <i class="fa fa-twitter-square" aria-hidden="true"></i>
			  </a>
			  <a href="#" title="instagram">  
			    <i class="fa fa-instagram" aria-hidden="true"></i>
			  </a>
			  <a href="#" title="youtube">
			    <i class="fa fa-youtube-square" aria-hidden="true"></i>
			  </a>
			  <a href="#" title="linkedin">
			    <i class="fa fa-linkedin-square" aria-hidden="true"></i>
			  </a>
			  <ul class="ulfooter">
			  <li><a href="#">Terms & Conditions</a></li>
			  <li><a href="#">Privacy Policy</a></li>
			  <li> <a href="#" id="copyright">Copyright © Skychat</a></li>
			  </ul>
			
			</div>
     		
     		</div>
     
     <script type="text/javascript" src="JS/index.js"></script>
	 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</body>
</html>