<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.Cookie"%>
<%@page import="javax.servlet.RequestDispatcher"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>
    <form method="post">
        <h2>Login</h2>

        <label for="username">Username</label>
        <input type="text" id="username" name="email" required><br><br>

        <label for="password">Password</label>
        <input type="password" id="password" name="password" required><br><br>

        <input type="submit" value="Login">
    </form>

<%
if (request.getMethod().equalsIgnoreCase("post")) {
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fourth", "root", "");

        PreparedStatement stmt = conn.prepareStatement("SELECT * FROM user WHERE Email=? AND PASSWORD=?");
        stmt.setString(1, email);
        stmt.setString(2, password);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            // Set cookie
            Cookie userCookie = new Cookie("email", email);
            userCookie.setMaxAge(7 * 24 * 60 * 60); // 7 days
            response.addCookie(userCookie);

            // Optional: Store session attribute
            session.setAttribute("email", email);

            // Redirect to home page
            response.sendRedirect("index.html");
        } else {
            out.println("<p style='color:red;'>Invalid email or password</p>");
        }

        conn.close();
    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
}
%>

</body>
</html>
