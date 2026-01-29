<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Updating Product...</title>
    </head>
    <body>
<%
    // 1. Capture all parameters from the Edit Form
    String id = request.getParameter("productId");
    String name = request.getParameter("pname");
    String price = request.getParameter("pprice");
    String oldPrice = request.getParameter("poldprice"); // NEW PARAMETER
    String imageName = request.getParameter("pimage");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bangles", "root", "pass@123");
        
        // 2. Updated SQL Query to include old_price
        String sql = "UPDATE products SET name=?, price=?, old_price=?, image_url=? WHERE id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        
        ps.setString(1, name);
        ps.setString(2, price);
        ps.setString(3, oldPrice); // NEW BINDING
        ps.setString(4, imageName);
        ps.setString(5, id);

        int i = ps.executeUpdate();
        conn.close(); // Good practice to close connection

        if(i > 0) {
            response.sendRedirect("admin.jsp?status=success");
        } else {
            response.sendRedirect("admin.jsp?status=fail");
        }
    } catch(Exception e) {
        // This will print the error (useful for debugging column name issues)
        out.print("Database Error: " + e.getMessage());
    }
%>
    </body>
</html>