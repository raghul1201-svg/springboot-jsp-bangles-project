<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SS bangles</title>
        <link rel="icon" type="image/x-icon" href="image/favicon.ico"/>
        <link rel="stylesheet" href="newcss.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=menu" />
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        
        <%
            // LOGIC TO CHECK USER AND UPDATE DATABASE
            String name = request.getParameter("uname");
            String email = request.getParameter("uemail");
            String message = request.getParameter("umessage");

            if (name != null && email != null) {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bangles", "root", "pass@123");

                    // 1. Check if Name and Email exist in lon_in table
                    // We check full_name OR username to match your requirement
                    String checkSql = "SELECT * FROM lon_in WHERE (full_name=? OR username=?) AND email=?";
                    PreparedStatement psCheck = conn.prepareStatement(checkSql);
                    psCheck.setString(1, name);
                    psCheck.setString(2, name);
                    psCheck.setString(3, email);
                    ResultSet rs = psCheck.executeQuery();

                    if (rs.next()) {
                        // 2. If match found, insert message into messages table
                        String insertSql = "INSERT INTO messages (name, email, message, created_at) VALUES (?, ?, ?, NOW())";
                        PreparedStatement psInsert = conn.prepareStatement(insertSql);
                        psInsert.setString(1, name);
                        psInsert.setString(2, email);
                        psInsert.setString(3, message);
                        psInsert.executeUpdate();
                        
                        out.println("<script>alert('Message sent successfully!');</script>");
                    } else {
                        // 3. If no match, show the popup message
                        out.println("<script>alert('First you need to login then send message'); window.location='login.jsp';</script>");
                    }
                    conn.close();
                } catch (Exception e) {
                    out.println("<script>alert('Error: " + e.getMessage() + "');</script>");
                }
            }
        %>

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
                <li><a href="contact.jsp" class="nav-link">contact</a></li>
                <li><a href="about_us.jsp" class="nav-link">About us</a></li>
            </ul>
        </nav>

        <div class="contact-page-wrapper">
            <div class="contact-container">
                <div class="contact-info-panel">
                    <div class="card-accent"></div>
                    <h3>Get in Touch</h3>
                    <p>Have a custom order in mind? Or just want to say hi? We'd love to hear from you.</p>
                    <div class="info-list">
                        <div class="info-item">
                            <span class="material-symbols-outlined">location_on</span>
                            <div>
                                <strong>Our Workshop</strong>
                                <p>No. 12 5th Street Iyyappan Nagar Madhuravoyal Chennai 95</p>
                            </div>
                        </div>
                        <div class="info-item">
                            <span class="material-symbols-outlined">mail</span>
                            <div>
                                <strong>Email Us</strong>
                                <p>sharmila13saravanan@gmail.com</p>
                            </div>
                        </div>
                    </div>
                </div>  

                <div class="contact-form-panel">
                    <form class="login-form" action="contact.jsp" method="post">
                        <div class="input-group">
                            <label>Your Name</label>
                            <input type="text" name="uname" placeholder="Enter your name or username" required>
                        </div>
                        <div class="input-group">
                            <label>Email Address</label>
                            <input type="email" name="uemail" placeholder="email@example.com" required>
                        </div>
                        <div class="input-group">
                            <label>Message</label>
                            <textarea name="umessage" placeholder="Tell us about your requirements..." rows="5" required></textarea>
                        </div>
                        <button type="submit">Send Message</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>