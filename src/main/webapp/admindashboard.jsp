<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@  page import="CRUD_Users.User" %>
    <%@  page import="CRUD_Contacts.ContactGS" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Skychat</title>
<link rel="website icon" type="png" href="Pictures/applogo.png">
<link rel="stylesheet" type="text/css" href="CSS/loader.css">
<link rel="stylesheet" href=https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
   
</head>
<body>
 	<%
  HttpSession session2 = request.getSession();
%>

	 <% HttpSession loginsession = request.getSession();
 		HttpSession accesssession = request.getSession(false);
	         boolean userLogin = loginsession != null && loginsession.getAttribute("userLogin") != null && (boolean) loginsession.getAttribute("userLogin");
	         boolean checkAccess = accesssession != null && accesssession.getAttribute("checkAccess") != null && (boolean) accesssession.getAttribute("checkAccess"); 
	         if(userLogin){
          		if(userLogin && checkAccess){
          			response.sendRedirect("index.jsp");
          			}
          		
	         }else{response.sendRedirect("index.jsp");}
          %>
	<div class="loader_bg">
 	<div class="loader"></div>
 	</div>


		 <div class="col-md-12">
        <a href="index.jsp" class="btn btn-primary" style="position:relative
        ;top:20px;left:20px;background-color:#ff7200;
        border:none;border-radius:5px">Back to Home</a>
    </div>
    <div class="container">
      <div class="row">
        <div class="col-md-12 mt-5">
          <h1 class="text-center">Users Information</h1>
          <hr style="height: 1px;color: black;background-color: black;">
        </div>
      </div>
      <div class="row">
      	
            <%
            @SuppressWarnings("unchecked")
			ArrayList<User> userList = (ArrayList<User>)request.getAttribute("userList");
           
			%>
			
			<table class="table table-hover">
			  <thead>
			    <tr>
			      <th>ID</th>
			      <th>First Name</th>
			      <th>Last Name</th>
			      <th>Email</th>
			      <th>Access</th>
			    </tr>
			  </thead>
			  <tbody>
			    <%
			    if(userList != null){
			    for(User user : userList) { %>
			    <tr>
			     <td><%= user.getId() %></td>
			      <td><%= user.getFname() %></td>
			      <td><%= user.getLname() %></td>
			      <td><%= user.getEmail() %></td>
			       <td><%= user.getAccess() %></td>
			      <td><a  href="admindashboard?userId=<%= user.getId() %>&action=changetoadmin" class="badge badge-success">Change role to Admin</a>
                  <a href="admindashboard?userId=<%= user.getId() %>&action=changetouser" class="badge badge-success">Change role to User</a> 
                  </td>
			    </tr>
			    <% }
			    }else {%>
			    <p>No Data</p>
			   <%} %>
			  </tbody>
			</table>
        </div>
      </div>
   
    <div class="container">
      <div class="row">
        <div class="col-md-12 mt-5">
          <h1 class="text-center">Contacts from users</h1>
          <hr style="height: 1px;color: black;background-color: black;">
        </div>
      </div>
      <div class="row">
       		<%
            @SuppressWarnings("unchecked")
			ArrayList<ContactGS> contactList = (ArrayList<ContactGS>)request.getAttribute("contactList");
           
			%>
          <table class="table table-hover">
    <thead>
              <tr>
              <th>Id</th>
                <th>Name</th>
                <th>Phone</th>
                <th>Email</th>
                <th>Subject</th>
                <th>Message</th>
              </tr>
    </thead>
    			<tbody>
    			 <% 
    			 if(contactList != null){
    			 for(ContactGS contact : contactList) { %>
			    <tr>
			    <td><%= contact.getContact_id() %></td>
			     <td><%= contact.getName() %></td>
			      <td><%= contact.getPhone() %></td>
			      <td><%= contact.getEmail() %></td>
			      <td><%= contact.getCompany() %></td>
			      <td><%= contact.getMessage() %></td>
			      <td>
			      <a href="admindashboard?contactId=<%= contact.getContact_id() %>&action=deletecontact" class="badge badge-danger">Delete</a>
                  </td>
			    </tr>
			    
			    <% }
    			 }else{%>
    			 	<p>No Data</p>
    			 <%} %>
              </tbody>
              </table>
        </div>
      </div>
  




 <script type="text/javascript" src="JS/index.js"></script>
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</body>
</html>