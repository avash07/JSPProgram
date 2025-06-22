<%-- 
    Document   : Delete
    Created on : Jun 22, 2025, 12:23:22 PM
    Author     : Asus
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
             int uid = Integer.parseInt(request.getParameter("id"));
        
        try {
            // Connect to database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fourth", "root", "");
            
            // Prepare and execute delete statement
            String sql = "DELETE FROM user WHERE UID = ?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, uid);
            
            int result = pstmt.executeUpdate();
            
            // Close resources
            pstmt.close();
            con.close();
                con.close();
        } catch (SQLException e) {
            response.getWriter().println("Error: " + e.getMessage());
        } catch (ClassNotFoundException ex) {
            response.getWriter().println("Error: Database driver not found");
        }
        %>
    </body>
</html>
