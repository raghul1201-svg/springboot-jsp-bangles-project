<%-- 
    Document   : produce
    Created on : 2 Jan 2026, 9:39:43 am
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
                 <title>SS bangles</title>
        <link rel="icon" type="image/x-icon" href="image/favicon.ico"/>
        <link rel="stylesheet" href="newcss.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=menu" />
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <div class="nav-btn">
            <label for="nav-check">
              <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M120-240v-80h720v80H120Zm0-200v-80h720v80H120Zm0-200v-80h720v80H120Z"/></svg>
            </label>
        </div>    
        
        <input type="checkbox" id="nav-check"/>
            
            <nav class="navbar">
                <div class="navbar-header">
                    <img class="hide-bg" src="image/sharmi.png" alt="alt"/>
                    <h3>SS bangles</h3>

                    <span class="nav-close">
                        <label for="nav-check"><svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="m256-200-56-56 224-224-224-224 56-56 224 224 224-224 56 56-224 224 224 224-56 56-224-224-224 224Z"/></svg></label>
                    </span>
                </div>
                <ul class="nav-item">
                    <li><a href="index.html" class="nav-link"> home</a></li>
                    <li><a href="login.jsp" class="nav-link">login page</a></li>
                    <li><a href="sign_in.jsp" class="nav-link">sign in</a></li>
<!--                    <li><a href="produce.jsp" class="nav-link">products</a></li>-->
                    <li><a href="contact.jsp" class="nav-link">contact</a></li>
                    <li><a href="about_us.jsp" class="nav-link">About us</a></li>
                </ul>
            </nav>
        
<div class="product-page-container">
    <header class="product-header">
        <h1>Our Collection</h1>
        <p>Handcrafted elegance for every occasion</p>
    </header>

<div class="product-page-wrapper">
    <header class="product-header">
        <span class="brand-badge">Handmade Collection</span>
        <h1>Exquisite Designs</h1>
        <p>Discover the perfect circle of elegance for your every occasion.</p>
    </header>

<main class="product-grid">
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bangles", "root", "pass@123");
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM products");

                while (rs.next()) {
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    double oldPrice = rs.getDouble("old_price");
                    String imageUrl = rs.getString("image_url");

                    // Discount calculation
                    int discountPercent = 0;
                    if (oldPrice > price) {
                        discountPercent = (int) (((oldPrice - price) / oldPrice) * 100);
                    }
        %>
        
        <div class="product-card">
            <div class="product-image-container">
                <img src="image/<%= imageUrl %>" alt="<%= name %>">
                <% if (discountPercent > 0) { %>
                    <span class="discount-tag"><%= discountPercent %>% OFF</span>
                <% } %>
            </div>
            
            <div class="product-details">
                <h3><%= name %></h3>
                <div class="price-box">
                    <span class="new-price">₹<%= (int)price %></span>
                    <% if (oldPrice > price) { %>
                        <span class="old-price">₹<%= (int)oldPrice %></span>
                    <% } %>
                </div>
                
                <a href="contact.jsp" class="view-btn">
                    <span class="material-symbols-outlined">info</span>
                    Enquire Now
                </a>
            </div>
        </div>

        <% 
                } 
                conn.close();
            } catch (Exception e) {
                out.println("<div class='error-msg'>Connection Error: " + e.getMessage() + "</div>");
            }
        %>
    </main>
</div>
    </body>
</html>
