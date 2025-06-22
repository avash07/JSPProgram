<%-- 
    Document   : Form
    Created on : Jun 17, 2025, 1:38:20 PM
    Author     : Asus
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    <title>User Information Form</title>
</head>
<body>

    <form method="post">
        <h2>User Information Form</h2>
        <p>Please fill in your personal information below</p>

        <label for="name">Full Name:</label><br>
        <input type="text" id="name" name="name" required><br><br>

        <label for="email">Email Address:</label><br>
        <input type="email" id="email" name="email" required><br><br>

        <label for="mobile">Mobile Number:</label><br>
        <input type="tel" id="mobile" name="mobile" required><br><br>

        <label>Gender:</label><br>
        <input type="radio" id="male" name="gender" value="Male" required>
        <label for="male">Male</label>
        <input type="radio" id="female" name="gender" value="Female">
        <label for="female">Female</label>
        <input type="radio" id="other" name="gender" value="Other">
        <label for="other">Other</label><br><br>

        <label for="bloodGroup">Blood Group:</label>
        <select id="bloodGroup" name="bloodGroup" required>
            <option value="">Select</option>
            <option value="A+">A+</option>
            <option value="A-">A-</option>
            <option value="B+">B+</option>
            <option value="B-">B-</option>
            <option value="AB+">AB+</option>
            <option value="AB-">AB-</option>
            <option value="O+">O+</option>
            <option value="O-">O-</option>
        </select><br><br>
        
       <label for="password">Password:</label>
       <input type="text" id="pass" name="pass" required><br><br>
        <button type="submit">Submit</button>
    </form>
   <%
       if(request.getMethod().equalsIgnoreCase("post")){
       Class.forName("com.mysql.cj.jdbc.Driver");
       String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobnum = request.getParameter("mobile");
        String gender = request.getParameter("gender");
        String blood = request.getParameter("bloodGroup");
        String pass = request.getParameter("pass");
         Connection conn ;
        try{
            conn = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/fourth","root","");
            String sql="INSERT into user(Name,Email,Gender,MobileNumber,BloodGroup,PASSWORD) VALUES(?,?,?,?,?,?)";
            PreparedStatement st =conn.prepareStatement(sql);
            st.setString(1,name);
            st.setString(2,email);
            st.setString(3,gender);
            st.setString(4,mobnum);
            st.setString(5,blood);
            st.setString(6,pass);
            st.execute();
            conn.close();
            
    } catch (SQLException e) {
    out.println("Driver not found: " + e.getMessage()); 
    }
       }
       
   %>



    </body>
</html>
