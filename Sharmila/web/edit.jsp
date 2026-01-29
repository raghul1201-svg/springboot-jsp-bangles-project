<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Product - SS Bangles</title>
    <link rel="stylesheet" href="newcss.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined">
</head>
<body>

    <input type="checkbox" id="nav-check"/>

    <div class="nav-btn">
        <label for="nav-check">
            <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px">
                <path d="M120-240v-80h720v80H120Zm0-200v-80h720v80H120Zm0-200v-80h720v80H120Z"/>
            </svg>
        </label>
    </div>

    <%
    String id = request.getParameter("id");
    
    String currentName = "";
    int currentPrice = 0;
    int currentOldPrice = 0; // NEW VARIABLE
    String currentImg = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/bangles","root","pass@123");
        
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM products WHERE id = ?");
        ps.setString(1, id);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            currentName = rs.getString("name");
            currentPrice = rs.getInt("price");
            currentOldPrice = rs.getInt("old_price"); // FETCH OLD PRICE
            currentImg = rs.getString("image_url");
        }
        conn.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>

    <div class="login-page">
        <div class="login-card" style="max-width: 450px;">
            <div class="card-accent"></div>
            
            <h3>Edit Product Details</h3>
            <p style="color: var(--clr-grey-2); font-size: 0.8rem; margin-bottom: 1rem;">Update information for ID: <%= id %></p>

            <div class="edit-preview-box" style="margin-bottom: 20px; text-align: center;">
                <img src="image/<%= currentImg %>" alt="preview" style="width: 120px; border-radius: 15px; border: 2px solid #eee;">
                <p style="font-size: 0.7rem; color: var(--clr-grey-2); margin-top: 5px;">Current Image: <%= currentImg %></p>
            </div>

            <form class="login-form" action="updateProduct.jsp" method="post">
    <input type="hidden" name="productId" value="<%= id %>">

    <div class="input-group">
        <label>Product Name</label>
        <input type="text" name="pname" value="<%= currentName %>" required>
    </div>

    <div class="input-group">
        <label>Old Price (₹) <span style="font-size: 0.7rem; color: #888;">(Shows as strikethrough)</span></label>
        <input type="number" name="poldprice" value="<%= currentOldPrice %>">
    </div>

    <div class="input-group">
        <label>New Price (₹)</label>
        <input type="number" name="pprice" value="<%= currentPrice %>" required>
    </div>

    <div class="input-group">
        <label>Image URL / Filename</label>
        <input type="text" name="pimage" value="<%= currentImg %>" required>
    </div>

    <button type="submit">Save Changes</button>
    <a href="admin.jsp" style="display: block; margin-top: 15px; color: var(--clr-grey-2); text-decoration: none; font-size: 0.85rem;">Cancel</a>
</form>
        </div>
    </div>

</body>
</html>