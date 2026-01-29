<%-- 
    Document   : sign_in
    Created on : 28 Dec 2025, 3:05:41 pm
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
<!--                    <li><a href="produce.jsp" class="nav-link">produce</a></li>-->
                    <li><a href="contact.jsp" class="nav-link">contact</a></li>
                    <li><a href="about_us.jsp" class="nav-link">About us</a></li>
                </ul>
            </nav>
<div class="login-page">
    <div class="login-card">
        <div class="card-accent"></div>
        
        <h3>Create Account</h3>
        <p style="color: var(--clr-grey-2); font-size: 0.8rem; margin-bottom: 1rem;">
            Join SS Bangles today
        </p>

        <form class="login-form" action="registerUser.jsp" method="post">
            
            <div class="input-group">
                <label>Full Name</label>
                <input type="text" name="fullname" placeholder="Raghul" required>
            </div>
            <div class="input-group">
                <label>User Name</label>
                <input type="text" name="username" placeholder="Raghul" required>
            </div>

            <div class="input-group">
                <label>Email Address</label>
                <input type="email" name="email" placeholder="raghul@example.com" required>
            </div>

            <div class="input-group">
                <label>Create Password</label>
                <input type="password" name="password" placeholder="Min. 8 characters" required>
            </div>
            <div class="input-group">
                <label>Phone number</label>
                <input type ="number" name="phonenumber" placeholder="10 dig phone number" required>
            </div>
            <button type="submit">Sign Up</button>
        </form>

        <div style="margin-top: 1.5rem; font-size: 0.85rem;">
            <span style="color: var(--clr-grey-2);">Already have an account?</span> 
            <a href="login.jsp" style="color: var(--clr-primary); font-weight: 600;">Login</a>
        </div>
    </div>
</div>

    </body>
</html>
