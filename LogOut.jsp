<%-- 
    Document   : LogOut
    Created on : Jun 22, 2025, 12:28:09 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
             session = request.getSession(false); // Don't create a new session
        if (session != null) {
            session.invalidate(); 
        }
        response.sendRedirect("login.html");
          
        
        %>
    </body>
</html>
