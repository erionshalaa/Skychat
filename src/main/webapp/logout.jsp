<%@ page language="java" %>
<%
    // Invalidate the session
    HttpSession session5 = request.getSession();
    session5.invalidate();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Logged Out</title>
</head>
<body>
    <% response.sendRedirect("login.jsp"); %>
</body>
</html>