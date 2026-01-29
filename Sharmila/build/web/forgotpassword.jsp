<%-- 
    Document   : forgotpassword
    Created on : 4 Jan 2026, 3:25:38 pm
    Author     : krishnasamyshanmugam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    String user = request.getParameter("username");
    String newPass = request.getParameter("password");
    String confirmPass = request.getParameter("confirm_password");
    String phone = request.getParameter("phone");

    // 2. Check if passwords match before touching the database
    if (!newPass.equals(confirmPass)) {
        out.println("<script>alert('Passwords do not match!'); window.history.back();</script>");
        return;
    }

    Connection conn = null;
    PreparedStatement ps = null;

    try {
        // 3. Database Connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bangles", "root", "pass@123");

        // 4. Update password ONLY if username and phone match
        // This acts as a verification and update in one step
        String sql = "UPDATE lon_in SET password = ? WHERE username = ? AND phone = ?";
        ps = conn.prepareStatement(sql);
        ps.setString(1, newPass);
        ps.setString(2, user);
        ps.setString(3, phone);

        int rowsUpdated = ps.executeUpdate();

        if (rowsUpdated > 0) {
            // Success
            out.println("<script type='text/javascript'>");
            out.println("alert('Password updated successfully! Please login with your new password.');");
            out.println("window.location.href='login.jsp';");
            out.println("</script>");
        } else {
            // Failure: Either username or phone was wrong
            out.println("<script>");
            out.println("alert('Verification failed. Username or Phone Number is incorrect.');");
            out.println("window.history.back();");
            out.println("</script>");
        }

    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
%>
    </body>
</html>
