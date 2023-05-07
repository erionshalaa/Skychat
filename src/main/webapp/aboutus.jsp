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
	<header>
		<h1>About Our Chat</h1>
		<nav>

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
		</nav>
	</header>
	<main>
		<p>Our chat is a real-time messaging platform that allows users to communicate with each other instantly. It is designed to be simple and easy to use, while also providing advanced features for power users.</p>
		<h2>Features</h2>
		<ul>
			<li>Real-time messaging</li>
			<img src="Pictures/instant-messaging-at-work.png" width="200px" height="200px">
			<li>Multiple chat rooms</li>
			<img src="Pictures/3891330.png" width="200px" height="200">
			<li>User authentication</li>
			<img src="Pictures/1.png" width="200px" height="200">
			<li>Private messaging</li>
			<img src="Pictures/best-secure-messaging-app.jpg" width="200px" height="200">
			<li>Emojis and stickers</li>
			<img src="Pictures/emoji-sticker-face-set-emoticon-cartoon-emojis-vector-28025943.jpg" width="200px" height="200">
		</ul>
		<h2>Getting Started</h2>
		<p>To get started with our chat, simply click on the "Chat" link in the navigation menu. You will be taken to a page where you can enter a username and select a chat room to join. Once you are in a chat room, you can start messaging with other users in real-time.</p>
		<h2>Contact Us</h2>
		<p>If you have any questions or feedback about our chat, please don't hesitate to contact us at support@ourchat.com.</p>
	</main>
	<footer>
		<p>&copy; 2023 Our Chat. All rights reserved.</p>
	</footer>
</body>
</html>