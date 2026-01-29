<%-- 
    Document   : addProductProcess
    Created on : 4 Jan 2026, 4:50:54 pm
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
    String name = request.getParameter("pname");
    String priceStr = request.getParameter("pprice");
    String old_PriceStr = request.getParameter("old_price"); // Match the form 'name' attribute
    String img = request.getParameter("pimage");

    Connection conn = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bangles", "root", "pass@123");

        String sql = "INSERT INTO products (name, price, old_price, image_url) VALUES (?, ?, ?, ?)";
        ps = conn.prepareStatement(sql);
        
        ps.setString(1, name);
        ps.setInt(2, Integer.parseInt(priceStr));

        // Logic to handle empty Old Price
        if (old_PriceStr == null || old_PriceStr.trim().isEmpty()) {
            ps.setInt(3, 0); // Stores 0 if empty
        } else {
            ps.setInt(3, Integer.parseInt(old_PriceStr));
        }

        ps.setString(4, img);

        int result = ps.executeUpdate();
        if (result > 0) {
            response.sendRedirect("admin.jsp?status=added");
        } else {
            out.println("<script>alert('Failed to add product'); window.location='add-product.jsp';</script>");
        }
    } catch (Exception e) {
        // ... rest of your error handling ...
    }
%>
    </body>
</html>
