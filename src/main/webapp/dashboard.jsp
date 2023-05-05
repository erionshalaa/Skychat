<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Skychat</title>
  <link rel="stylesheet" type="text/css" href="CSS/index.css">
<link rel="stylesheet" type="text/css" href="CSS/loader.css">
<link rel="stylesheet" type="text/css" href="CSS/button.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="website icon" type="png" href="Pictures/applogo.png">
  <link rel="stylesheet" type="text/css" href="CSS/dashboard.css">
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
          <li><a href="dashboard.jsp">Dashboard</a></li>
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
  	
 





<div id="container">
	<aside>
		<header>
			<input type="text" placeholder="Search for friends">
		</header>
		<ul>
			<li>
				<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/chat_avatar_01.jpg" alt="">
				<div>
					<h2>Vincent Porter</h2>
					
				</div>
			</li>
			<li>
				<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/chat_avatar_02.jpg" alt="">
				<div>
					<h2>User</h2>
					
				</div>
			</li>
			<li>
				<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/chat_avatar_03.jpg" alt="">
				<div>
					<h2>Prénom Nom</h2>
					
				</div>
			</li>
			<li>
				<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/chat_avatar_04.jpg" alt="">
				<div>
					<h2>Prénom Nom</h2>
					
				</div>
			</li>
			<li>
				<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/chat_avatar_05.jpg" alt="">
				<div>
					<h2>Prénom Nom</h2>
					
				</div>
			</li>
			<li>
				<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/chat_avatar_06.jpg" alt="">
				<div>
					<h2>Prénom Nom</h2>
					
				</div>
			</li>
			<li>
				<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/chat_avatar_07.jpg" alt="">
				<div>
					<h2>Prénom Nom</h2>
					
				</div>
			</li>
			<li>
				<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/chat_avatar_08.jpg" alt="">
				<div>
					<h2>Prénom Nom</h2>
					
				</div>
			</li>
			<li>
				<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/chat_avatar_09.jpg" alt="">
				<div>
					<h2>Prénom Nom</h2>
					
				</div>
			</li>
			<li>
				<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/chat_avatar_10.jpg" alt="">
				<div>
					<h2>Prénom Nom</h2>
					
				</div>
			</li>
		</ul>
	</aside>
	<main>
		<header>
			<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/chat_avatar_01.jpg" alt="">
			<div>
				<h2>Chat with Vincent Porter</h2>
				
			</div>
			
		</header>
		<ul id="chat">
			<li class="you">
				<div class="entete">
					<span class="status green"></span>
					<h2>Vincent</h2>
					<h3>10:12AM, Today</h3>
				</div>
				<div class="triangle"></div>
				<div class="message">
					Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor.
				</div>
			</li>
			<li class="me">
				<div class="entete">
					<h3>10:12AM, Today</h3>
					<h2>Vincent</h2>
					<span class="status blue"></span>
				</div>
				<div class="triangle"></div>
				<div class="message">
					Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor.
				</div>
			</li>
			<li class="me">
				<div class="entete">
					<h3>10:12AM, Today</h3>
					<h2>Vincent</h2>
					<span class="status blue"></span>
				</div>
				<div class="triangle"></div>
				<div class="message">
					OK
				</div>
			</li>
			<li class="you">
				<div class="entete">
					<span class="status green"></span>
					<h2>Vincent</h2>
					<h3>10:12AM, Today</h3>
				</div>
				<div class="triangle"></div>
				<div class="message">
					Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor.
				</div>
			</li>
			<li class="me">
				<div class="entete">
					<h3>10:12AM, Today</h3>
					<h2>Vincent</h2>
					<span class="status blue"></span>
				</div>
				<div class="triangle"></div>
				<div class="message">
					Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor.
				</div>
			</li>
			<li class="me">
				<div class="entete">
					<h3>10:12AM, Today</h3>
					<h2>Vincent</h2>
					<span class="status blue"></span>
				</div>
				<div class="triangle"></div>
				<div class="message">
					OK
				</div>
			</li>
		</ul>
		<footer>
			<textarea placeholder="Type your message"></textarea>
			
			<a href="#">Send</a>
		</footer>
	</main>
</div>
<!-- partial -->

     <script type="text/javascript" src="JS/index.js"></script>
	 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script src="js/jquery-3.0.0.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
<script>
    (function($){
        $(window).on("load",function(){
            $(".message-list, .chatter, .comment-section, .storyline").mCustomScrollbar({
                theme:"dark-3"
            });
        });
    })(jQuery);
</script>
</body>
</html>
