<%-- 
    Document   : UpdateForm
    Created on : Jun 22, 2025, 12:06:12 PM
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
        if (request.getMethod().equalsIgnoreCase("POST")) {
        // Update user data in database
        int uid = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String gender = request.getParameter("gender");
        String bloodGroup = request.getParameter("bloodGroup");

        try {
            // Connect to database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fourth", "root", "");

            // Update user data
            String sql = "UPDATE user SET Name=?, Email=?, MobileNumber=?, Gender=?, BloodGroup=? WHERE UID=?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, mobile);
            pstmt.setString(4, gender);
            pstmt.setString(5, bloodGroup);
            pstmt.setInt(6, uid);
            pstmt.executeUpdate();

            // Close resources
            pstmt.close();
            con.close();

            // Redirect to user list page
            response.sendRedirect("ShowData.jsp");

        } catch (SQLException e) {
            out.println("Error: " + e.getMessage());
        } catch (ClassNotFoundException ex) {
            out.println("Error: Database driver not found");
        }
    } else {
            
        int uid = Integer.parseInt(request.getParameter("id"));

                    try {
                        // Connect to database
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fourth", "root", "");

                        // Get user data
                        String sql = "SELECT * FROM user WHERE UID = ?";
                        PreparedStatement pstmt = con.prepareStatement(sql);
                        pstmt.setInt(1, uid);
                        ResultSet rs = pstmt.executeQuery();
                        if (rs.next()) {
                            out.println("<!DOCTYPE html>");
                            out.println("<html>");
                            out.println("<head>");
                            out.println("<title>Update User</title>");
                            out.println("<meta charset='UTF-8'>");
                            out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
                            out.println("</head>");
                            out.println("<body>");
                            out.println("<h2>Update User</h2>");
                            out.println("<form  action='UpdateForm.jsp' method='post'>");

                            out.println("<input type='hidden' name='id' value='" + uid + "'>");

                            out.println("<label for='name'>Name:</label>");
                            out.println("<input type='text' id='name' name='name' value='" + rs.getString("Name") + "' required><br><br>");

                            out.println("<label for='email'>Email:</label>");
                            out.println("<input type='email' id='email' name='email' value='" + rs.getString("Email") + "' required><br><br>");

                            out.println("<label for='mobile'>Mobile:</label>");
                            out.println("<input type='tel' id='mobile' name='mobile' value='" + rs.getString("MobileNumber") + "' required><br><br>");

                            out.println("<label>Gender:</label><br>");
                            out.println("<input type='radio' id='male' name='gender' value='Male' " + (rs.getString("Gender").equals("Male") ? "checked" : "") + "> Male<br>");
                            out.println("<input type='radio' id='female' name='gender' value='Female' " + (rs.getString("Gender").equals("Female") ? "checked" : "") + "> Female<br>");
                            out.println("<input type='radio' id='other' name='gender' value='Other' " + (rs.getString("Gender").equals("Other") ? "checked" : "") + "> Other<br><br>");

                            out.println("<label for='bloodGroup'>Blood Group:</label>");
                            out.println("<select id='bloodGroup' name='bloodGroup' required>");
                            out.println("<option value=''>Select</option>");
                            String[] bloodGroups = {"A+", "A-", "B+", "B-", "O+", "O-", "AB+", "AB-"};
                            for (String bg : bloodGroups) {
                                out.println("<option value='" + bg + "'" + (rs.getString("BloodGroup").equals(bg) ? " selected" : "") + ">" + bg + "</option>");
                            }
                            out.println("</select><br><br>");

                            out.println("<input type='submit' value='Update'>");
                            out.println("</form>");
                            out.println("<br><a href='ShowData.jsp'>Back to List</a>");
                            out.println("</body>");
                            out.println("</html>");
        }
           rs.close();
                        pstmt.close();
                        con.close();

                    } catch (SQLException e) {
                        out.println("Error: " + e.getMessage());
                    } catch (ClassNotFoundException ex) {
                        out.println("Error: Database driver not found");
                    }
    }
        
        %>
    </body>
</html>
