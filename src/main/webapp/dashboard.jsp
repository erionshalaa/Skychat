
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
 	
	
		
 	<script>
  function openChatBox(friendName, friendId) {
    var friendNameElement = document.getElementById('friendName');
    friendNameElement.textContent = "Chat with " + friendName;
    connect(friendId);

  }
</script>
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
		    ArrayList<Friends> friendNames = (ArrayList<Friends>) request.getAttribute("friendNames"); %>
		    
		    <% if (friendNames != null) {
		        for (Friends friend : friendNames) {
		    %>
		    <li class="user" onclick="openChatBox('<%= friend.getName() %>', '<%= friend.getId() %>')">
		        <img src="Pictures/profile-icon.png" >
		        <div>
		            <h2><%= friend.getName() + " " + friend.getSurname()%></h2>
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
				<h2><span id="friendName"></span></h2>
				
			</div>
			
		</header>
		 <div id="chatArea">
	    <% if (matchingUsers != null) {
	      for (User user : matchingUsers) { %>
	    <div id="chatBox-<%= user.getId() %>" 
	     class="chat-box">
	      
	    </div> 
	    
	    <% }
	    } %>
	  	</div>
	  	<ul id="chat" >
	    <li>
				
				<div id="messageList" class="message">
				</div>
			</li>
	    
	    </ul>
		<footer><% 
		@SuppressWarnings("unchecked")
		    ArrayList<Friends> friendNamess = (ArrayList<Friends>) request.getAttribute("friendNames"); %>
		    
		    <% if (friendNamess != null) {
		        for (Friends friend : friendNamess) {
		    %>
			  <form id="messageForm" onsubmit="return sendMessage(event,<%= friend.getId() %>);">
			  <% }
		    } %>
		        <textarea id="messageInput" placeholder="Type your message"></textarea>
		        <span style="display: none;" id="wsid"></span>
		        <!--  <button style="display: none;" id="connectbutton" onclick="connect(document.getElementById('wsid').textContent); return false;">Connect</button>-->
		        
		        <button id="send" type="submit">Send</button>
    			</form>
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

<%
  User loggedInUser = (User) request.getSession().getAttribute("loggedInUser");
  String currentUserId = (loggedInUser != null) ? loggedInUser.getId() : "";
%>

<script>
  var socket; 
  var currentUser = '<%= currentUserId %>';

  function connect(friendId) {
	var senderId = currentUser;
    var host = "ws://localhost:8080/lab1-chatapp/dashboard_servlet/" + friendId + "/" + senderId;
    console.log("Connect function called for friend ID: " + friendId);

    socket = new WebSocket(host); 

    socket.onopen = function() {
      console.log("WebSocket connection established for friend ID: " + friendId);
    };

    socket.onmessage = function(event) {
      var message = event.data;
      console.log("Received message: " + message);

      var senderId = message.substring(0, message.indexOf(":"));
      var messageContent = message.substring(message.indexOf(":") + 3);
      if (senderId === friendId || senderId === currentUser) {
  	    displayMessage(messageContent, senderId === currentUser);
  	  }
    };

    socket.onclose = function() {
      console.log("WebSocket connection closed for friend ID: " + friendId);
    };

    socket.onerror = function(error) {
      console.log("WebSocket error for friend ID: " + friendId + ": " + error);
    };
  }

  function sendMessage(event,friendId) {
	  event.preventDefault();

	  var messageInput = document.getElementById('messageInput');
	  var message = messageInput.value;

	  if (socket && socket.readyState === WebSocket.OPEN) {
	    socket.send(currentUser + ":" + friendId + ":" + message);
	    console.log("Sent message: " + message);

	    displayMessage(message, true);

	    messageInput.value = '';
	  } else {
	    console.log("WebSocket connection is not open or has been closed");
	  }

	  return false; // Prevent form submission
	}

  function displayMessage(message, isSender) {
    console.log("Displaying message: " + message + " for receiver");

    var messageList = document.getElementById("messageList");
    var listItem = document.createElement("li");
    listItem.className = isSender ? "you" : "me";

    var entete = document.createElement("div");
    entete.className = "entete";

    var status = document.createElement("span");
    status.className = "status green";
    entete.appendChild(status);

    var h2 = document.createElement("h2");
    h2.textContent = isSender ? "Me" : "Friend";
    entete.appendChild(h2);

    var triangle = document.createElement("div");
    triangle.className = "triangle";

    var messageContent = document.createElement("div");
    messageContent.className = "message";
    messageContent.textContent = message;

    listItem.appendChild(entete);
    listItem.appendChild(triangle);
    listItem.appendChild(messageContent);

    messageList.appendChild(listItem);
  }
</script>

</body>
</html>