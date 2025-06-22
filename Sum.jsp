<%-- 
    Document   : Sum
    Created on : Jun 17, 2025, 1:30:40 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sum Calculator</title>
    </head>
    <body>
        <form method="post">
            Enter 1st number:<input type="text" name="num1"><br><br>
            Enter 2nd number:<input type="text" name="num2"><br><br>
            <input  type="submit" value="Calculate"><br><br>
        </form>
        <%
            if(request.getMethod().equalsIgnoreCase("post")){
            int n1=Integer.parseInt(request.getParameter("num1"));
            int n2=Integer.parseInt(request.getParameter("num2"));
            int sum = n1+n2;
            out.write("The sum is "+sum);
            }
        %>
    </body>
</html>
