<!DOCTYPE html>
<html lang="en" >
<%@ page import="java.util.List" %>
<%@  page import="CRUD_Users.User" %>
<%@  page import="CRUD_Users.registerdb" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Dashboard_Messages.Friends" %>


    
<%
		String query = request.getParameter("query");
		registerdb rgdb = new registerdb();
		List<User> allUsers = rgdb.selectallusers();
		List<User> matchingUsers = new ArrayList<>();
		
		if (query != null) {
		    User loggedInUser = (User) request.getSession().getAttribute("loggedInUser");
		   
		    for (User user : allUsers) {
		    	if (!user.getId().equals(loggedInUser.getId())) {
		            String fname = user.getFname();
		            if (fname != null && fname.contains(query)) {
		                matchingUsers.add(user);
		            }
		        }
		    }
		}
%>
<head>
  <meta charset="UTF-8">
  <title>Skychat</title>
  <link rel="stylesheet" type="text/css" href="CSS/index.css">
<link rel="stylesheet" type="text/css" href="CSS/loader.css">
<link rel="stylesheet" type="text/css" href="CSS/button.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="website icon" type="png" href="Pictures/applogo.png">
  <link rel="stylesheet" type="text/css" href="CSS/dashboard.css">
 	
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
          <% }else{response.sendRedirect("login.jsp");}%>
          
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

<div id="container">
	<aside>
		<header>
		<div class="search-container"></div>
			<form action="dashboard.jsp" method="GET">
			<input type="text" name="query" id="search-input" placeholder="Search for friends">
			</form>
			
		</header>
		<ul>
			<%
			// Retrieve the search query parameter (friend ID)
			String friendId = request.getParameter("friendId");
			registerdb friendDAO = new registerdb();
			User loggedInUserId = (User) request.getSession().getAttribute("loggedInUser");
			
			if(matchingUsers != null){
				for (User user : matchingUsers) {
					int logged = Integer.parseInt(loggedInUserId.getId());
					int userid = Integer.parseInt(user.getId());
					boolean isFriend = friendDAO.isFriendAdded(logged, userid);%>
			<li>
				<img src="Pictures/profile-icon.png" alt="">
				<div>
					<h2><%= user.getFname() %> <%= user.getLname() %></h2>
					<%if(!isFriend){ %>
					<a class="addfriend" href="dashboard_servlet?userId=<%= user.getId() %>&action=addfriend" >Add Friend</a>
					<%} %>
				</div>
			</li>
			<%}} %>
			
			
		    <% @SuppressWarnings("unchecked")
		    ArrayList<String> friendNames = (ArrayList<String>) request.getAttribute("friendNames"); %>
		    <% if (friendNames != null) {
		        for (String friend : friendNames) {
		    %>
		    <li>
		        <img src="Pictures/profile-icon.png" >
		        <div>
		            <h2><%= friend %></h2>
		        </div>
		    </li>
		    <% }
		    } %>
			
			
		</ul>
	</aside>
	<main>
		<header>
			<img src="Pictures/profile-icon.png" alt="">
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
