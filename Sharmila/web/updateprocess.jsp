<%-- 
    Document   : updateprocess
    Created on : 4 Jan 2026, 1:10:37 pm
    Author     : krishnasamyshanmugam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.io.*, javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%@ page %>
<%
    // 1. Get the parts from the request
    Part filePart = request.getPart("image_file"); 
    String fileName = filePart.getSubmittedFileName();
    
    // 2. Define where to save the image
    // This points to the 'image' folder in your project
    String savePath = request.getServletContext().getRealPath("/") + "image" + File.separator + fileName;
    
    // 3. Save the file to the folder
    if (fileName != null && !fileName.isEmpty()) {
        filePart.write(savePath);
    }

    // 4. Update Database
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bangles", "root", "pass@123");
        
        // If a new file was uploaded, update image_url. Otherwise, keep old one.
        String sql = (fileName != null && !fileName.isEmpty()) 
                     ? "UPDATE products SET name=?, image_url=? WHERE id=?" 
                     : "UPDATE products SET name=? WHERE id=?";
        
        PreparedStatement ps = conn.prepareStatement(sql);
        if (fileName != null && !fileName.isEmpty()) {
            ps.setString(1, name);
            ps.setString(2, fileName);
            ps.setString(3, id);
        } else {
            ps.setString(1, name);
            ps.setString(2, id);
        }
        
        ps.executeUpdate();
        response.sendRedirect("admin.jsp");
    } catch (Exception e) {
        out.println(e.getMessage());
    }
%>
<servlet>
    <servlet-name>updateProcess</servlet-name>
    <jsp-file>/updateProcess.jsp</jsp-file>
    <multipart-config>
        <max-file-size>20848820</max-file-size> </multipart-config>
</servlet>
<servlet-mapping>
    <servlet-name>updateProcess</servlet-name>
    <url-pattern>/updateProcess.jsp</url-pattern>
</servlet-mapping>
    </body>
</html>
