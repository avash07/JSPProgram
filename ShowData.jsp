<%-- 
    Document   : ShowData
    Created on : Jun 22, 2025, 11:48:03 AM
    Author     : Asus
--%>

<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Records</title>
        <style>
            table, th, td {
                border: 1px solid black;
                border-collapse: collapse;
                padding: 8px;
            }
            .btn-update, .btn-delete {
                text-decoration: none;
                padding: 5px 10px;
                border-radius: 5px;
            }
            .btn-update {
                background-color: lightblue;
            }
            .btn-delete {
                background-color: lightcoral;
            }
        </style>
    </head>
    <body>
        <h2>User Records</h2>
        <table id="outputTable">
            <thead>
                <tr>
                    <th>UID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Mobile Number</th>
                    <th>Gender</th>
                    <th>Blood Group</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
            <%
                Connection con = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fourth", "root", "");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM user");

                    while (rs.next()) {
            %>
                        <tr>
                            <td><%= rs.getInt("UID") %></td>
                            <td><%= rs.getString("Name") %></td>
                            <td><%= rs.getString("Email") %></td>
                            <td><%= rs.getString("MobileNumber") %></td>
                            <td><%= rs.getString("Gender") %></td>
                            <td><%= rs.getString("BloodGroup") %></td>
                            <td><a href="UpdateForm.jsp?id=<%= rs.getInt("UID") %>" class="btn-update">Update</a></td>
                            <td><a href="Delete.jsp?id=<%= rs.getInt("UID") %>" class="btn-delete" onclick="return confirm('Are you sure you want to delete this record?');">Delete</a></td>
                        </tr>
            <%
                    }

                    con.close();
                } catch (SQLException e) {
                    out.println("<tr><td colspan='8'>Error: " + e.getMessage() + "</td></tr>");
                } catch (ClassNotFoundException ex) {
                    out.println("<tr><td colspan='8'>Error: Database driver not found</td></tr>");
                }
            %>
            </tbody>
        </table>
    </body>
</html>
