<%-- 
    Document   : contactProcess
    Created on : 4 Jan 2026, 5:00:11 pm
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
    // Get the data from the form inputs
    String name = request.getParameter("uname");
    String email = request.getParameter("uemail");
    String msg = request.getParameter("umessage");

    if (name != null && email != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Verify your DB name (bangles) and password (pass@123)
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bangles", "root", "pass@123");
            
            // The columns MUST match your CREATE TABLE command: name, email, message
            String sql = "INSERT INTO messages (name, email, message) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, msg);

            int result = ps.executeUpdate();
            conn.close();

            if(result > 0) {
                // Redirect with a success alert
                out.println("<script>alert('Message Sent Successfully!'); window.location='contact.jsp';</script>");
            }
        } catch(Exception e) {
            out.print("Error: " + e.getMessage());
        }
    }
%>
    </body>
</html>
