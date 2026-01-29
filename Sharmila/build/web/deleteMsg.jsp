<%-- 
    Document   : deleteMsg
    Created on : 4 Jan 2026, 5:27:33 pm
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
    String id = request.getParameter("id");
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bangles", "root", "pass@123");
        PreparedStatement ps = conn.prepareStatement("DELETE FROM messages WHERE id=?");
        ps.setString(1, id);
        ps.executeUpdate();
        conn.close();
        response.sendRedirect("admin.jsp"); 
    } catch(Exception e) {
        out.print(e);
    }
%>
    </body>
</html>
