<%-- 
    Document   : registerUser
    Created on : 4 Jan 2026, 1:59:21 pm
    Author     : krishnasamyshanmugam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ page import="java.sql.*" %>

<%
    // 1. Retrieve form data
    String fullName = request.getParameter("fullname");
    String userName = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String phone = request.getParameter("phonenumber");

    Connection conn = null;
    PreparedStatement ps = null;

    try {
        // 2. Database Connection (pointing to user_auth)
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bangles", "root", "pass@123");

        // 3. Prepare SQL Insert Query
        String sql = "INSERT INTO lon_in (full_name, username, email, password, phone) VALUES (?, ?, ?, ?, ?)";
        ps = conn.prepareStatement(sql);
        ps.setString(1, fullName);
        ps.setString(2, userName);
        ps.setString(3, email);
        ps.setString(4, password);
        ps.setString(5, phone);

        // 4. Execute Update
        int result = ps.executeUpdate();

        if (result > 0) {
            // Success: Send to login page with a success message
            out.println("<script type='text/javascript'>");
            out.println("alert('Registration Successful! Please login.');");
            out.println("window.location.href='login.jsp';");
            out.println("</script>");
        } else {
            out.println("<script>alert('Registration failed. Please try again.'); window.history.back();</script>");
        }

    } catch (SQLIntegrityConstraintViolationException e) {
        // Handle duplicate username or email
        out.println("<script>alert('Username or Email already exists!'); window.history.back();</script>");
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
%>
    </body>
</html>
