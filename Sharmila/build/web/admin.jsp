<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>SS bangles - Admin Dashboard</title>
    <link rel="icon" type="image/x-icon" href="image/favicon.ico"/>
    <link rel="stylesheet" href="newcss.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
    
    <!-- NAV BUTTON -->
    <div class="nav-btn">
        <label for="nav-check">
            <svg xmlns="http://www.w3.org/2000/svg" height="24px"
                 viewBox="0 -960 960 960" width="24px">
                <path d="M120-240v-80h720v80H120Zm0-200v-80h720v80H120Zm0-200v-80h720v80H120Z"/>
            </svg>
        </label>
    </div>

    <input type="checkbox" id="nav-check"/>

    <!-- NAVBAR -->
    <nav class="navbar">
        <div class="navbar-header">
            <img class="hide-bg" src="image/sharmi.png" alt="logo"/>
            <h3>SS bangles</h3>

            <span class="nav-close">
                <label for="nav-check">
                    <svg xmlns="http://www.w3.org/2000/svg" height="24px"
                         viewBox="0 -960 960 960" width="24px">
                        <path d="m256-200-56-56 224-224-224-224
                        56-56 224 224 224-224 56 56-224 224
                        224 224-56 56-224-224-224 224Z"/>
                    </svg>
                </label>
            </span>
        </div>

        <ul class="nav-item">
            <li><a href="index.html" class="nav-link">home</a></li>
            <li><a href="login.jsp" class="nav-link">login page</a></li>
            <li><a href="sign_in.jsp" class="nav-link">sign in</a></li>
            <li><a href="produce.jsp" class="nav-link">produce</a></li>
            <li><a href="contact.jsp" class="nav-link">contact</a></li>
            <li><a href="about_us.jsp" class="nav-link">about us</a></li>
        </ul>
    </nav>

    <div class="login-page" style="flex-direction: column; align-items: center; display: flex; gap: 30px; padding: 20px;">
        
        <div class="admin-panel-card">
            <div class="card-accent"></div>
            <div class="admin-header">
                <div>
                    <h2>Inventory Dashboard</h2>
                </div>
                <a href="add-product.jsp" class="btn-primary">+ Add New</a>
            </div>
            <div class="admin-grid">
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bangles", "root", "pass@123");
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM products");
                        while (rs.next()) {
                %>
                <div class="admin-item-card">
                    <div class="admin-img-box"><img src="image/<%= rs.getString("image_url") %>"></div>
                    <div class="admin-details" style="text-align: center;"> 
                        <h4><%= rs.getString("name") %></h4>
                        <p style="margin: 5px 0;">
    <span style="font-weight: bold; font-size: 1.1rem;">₹<%= rs.getInt("price") %></span>
    
    <% 
        int oldPrice = rs.getInt("old_price");
        if (oldPrice > rs.getInt("price")) { 
    %>
        <span style="text-decoration: line-through; color: #888; margin-left: 8px; font-size: 0.9rem;">
            ₹<%= oldPrice %>
        </span>
    <% } %>
</p>
       
                        <div class="admin-actions">
                            <a href="edit.jsp?id=<%= rs.getInt("id") %>" class="btn-edit"><span class="material-symbols-outlined">edit</span></a>
                            <a href="javascript:void(0);" onclick="deleteProduct(<%= rs.getInt("id") %>)" class="btn-delete"><span class="material-symbols-outlined">delete</span></a>
                        </div>
                    </div>
                </div>
                <% } conn.close(); } catch (Exception e) { out.println(e); } %>
            </div>
        </div>

        <div class="admin-panel-card" style="width: 100%; max-width: 1100px;">
            <div class="card-accent" style="background: #e67e22;"></div>
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                <h3>Customer Inquiries</h3>
                <span class="material-symbols-outlined">mail</span>
            </div>

            <div class="message-feed">
                <%
                    try {
                        Connection conn2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/bangles", "root", "pass@123");
                        // SQL Join to get phone number from lon_in table based on email
                        String sqlMsg = "SELECT m.*, l.phone FROM messages m LEFT JOIN lon_in l ON m.email = l.email ORDER BY m.created_at DESC";
                        Statement st2 = conn2.createStatement();
                        ResultSet rs2 = st2.executeQuery(sqlMsg);

                        while(rs2.next()) {
                %>
                <div class="msg-card" style="border: 1px solid #eee; padding: 15px; border-radius: 8px; margin-bottom: 15px; background: white;">
                    <div style="display: flex; justify-content: space-between;">
                        <div style="display: flex; gap: 10px;">
                            <div class="msg-avatar" style="background: #e67e22; color: white; width: 40px; height: 40px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: bold;">
                                <%= rs2.getString("name").substring(0,1).toUpperCase() %>
                            </div>
                            <div>
                                <h4 style="margin:0;"><%= rs2.getString("name") %></h4>
                                <small style="color: #666;"><%= rs2.getString("email") %> | <strong>Phone: <%= rs2.getString("phone") != null ? rs2.getString("phone") : "N/A" %></strong></small>
                            </div>
                        </div>
                        <span style="font-size: 0.8rem; color: #aaa;"><%= rs2.getTimestamp("created_at") %></span>
                    </div>
                    <div style="margin: 15px 0; font-size: 0.95rem; color: #333;"><%= rs2.getString("message") %></div>
                    
                    <div style="text-align: right;">
                        <a href="deleteMsg.jsp?id=<%= rs2.getInt("id") %>" 
                           onclick="return confirm('Delete this message?')" 
                           style="background: #ff4d4d; color: white; padding: 5px 15px; text-decoration: none; border-radius: 4px; font-size: 0.8rem;">
                           DELETE INQUIRY
                        </a>
                    </div>
                </div>
                <% } conn2.close(); } catch(Exception e) { out.print(e); } %>
            </div>
        </div>

        <div class="admin-panel-card" style="width: 100%; max-width: 1100px;">
            <div class="card-accent" style="background: #2ecc71;"></div>
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                <h3>Registered Users (lon_in)</h3>
                <span class="material-symbols-outlined">group</span>
            </div>
            <div style="overflow-x: auto;">
                <table style="width: 100%; border-collapse: collapse; text-align: left;">
                    <tr style="background: #f4f4f4; border-bottom: 2px solid #ddd;">
                        <th style="padding: 10px;">ID</th>
                        <th style="padding: 10px;">Name</th>
                        <th style="padding: 10px;">Email</th>
                        <th style="padding: 10px;">Phone</th>
                        <th style="padding: 10px;">Action</th>
                    </tr>
                    <%
                        try {
                            Connection conn3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/bangles", "root", "pass@123");
                            ResultSet rs3 = conn3.createStatement().executeQuery("SELECT * FROM lon_in");
                            while(rs3.next()) {
                    %>
                    <tr style="border-bottom: 1px solid #eee;">
                        <td style="padding: 10px;"><%= rs3.getInt("id") %></td>
                        <td style="padding: 10px;"><%= rs3.getString("full_name") %></td>
                        <td style="padding: 10px;"><%= rs3.getString("email") %></td>
                        <td style="padding: 10px;"><%= rs3.getString("phone") %></td>
                        <td style="padding: 10px;">
                            <a href="deleteUser.jsp?id=<%= rs3.getInt("id") %>" onclick="return confirm('Delete User?')" style="color: red;"><span class="material-symbols-outlined">delete</span></a>
                        </td>
                    </tr>
                    <% } conn3.close(); } catch(Exception e) { out.print(e); } %>
                </table>
            </div>
        </div>
    </div>

    <script>
        function deleteProduct(id) {
            if (confirm("Delete this product?")) {
                fetch("http://localhost:8081/api/products/" + id, { method: "DELETE" })
                .then(() => location.reload());
            }
        }
    </script>
</body>
</html>