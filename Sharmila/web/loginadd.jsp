<%-- 
    Document   : loginadd
    Created on : 2 Jan 2026, 10:03:10 am
    Author     : krishnasamyshanmugam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="icon" type="image/x-icon" href="image/favicon.ico"/>
    <link rel="stylesheet" href="newcss.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%
            try{
            String username=(String)request.getParameter("name");
            String password=(String)request.getParameter("pass");
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/bangles","root","pass@123");
            String query="Select * from lon_in where Username=? and Password=?";
            PreparedStatement ps=conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs=ps.executeQuery();
            if(rs.next())
            {
                if ("admin".equals(username))
                {
                conn.close();
                response.sendRedirect("admin.jsp");
                }
                else
                {
                    conn.close();
                    response.sendRedirect("produce.jsp");
                }

            }
            else
            {conn.close();
    %>
    <script type="text/javascript">
        alert("Invalid Username or Password! Please try again.");
        window.location.href = "login.jsp";
    </script>
    <%}
        }
        catch(ClassNotFoundException e)
        {
            out.println(e.getMessage());
        }
        catch(SQLException e)
        {
            out.println(e.getMessage());
        }
        %>
    </body>
</html>
