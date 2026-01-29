<%-- 
    Document   : about_us
    Created on : 2 Jan 2026, 9:41:34 am
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
<div class="about-wrapper">
    <section class="about-section">
        <div class="about-container">
            <div class="about-image">
                <img src="image/WhatsApp Image 2026-01-04 at 6.14.39 PM (1).jpeg" alt="Crafting Bangles" class="rounded-img">
            </div>
            <div class="about-text">
                <span class="brand-subtitle">Our Heritage</span>
                <h2>The Art of Handmade Elegance</h2>
                <p>SS Bangles started with a simple vision: to bring back the charm of traditional handmade jewelry in a modern world. Every piece we create is a result of hours of meticulous work and a deep love for craftsmanship.</p>
                <div class="stats-grid">
                    <div class="stat-item">
                        <h4>500+</h4>
                        <p>Designs</p>
                    </div>
                    <div class="stat-item">
                        <h4>100%</h4>
                        <p>Handmade</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="about-section reverse">
        <div class="about-container">
            <div class="about-text">
                <span class="brand-subtitle">Our Mission</span>
                <h2>Crafted to Perfection</h2>
                <p>We believe that bangles are not just accessories; they are symbols of connection and tradition. Our mission is to provide premium quality, unique designs that make every woman feel special and celebrated.</p>
                <a href="produce.jsp" class="btn-primary">View Our Collection</a>
            </div>
            <div class="about-image">
                <img src="image/WhatsApp Image 2026-01-04 at 6.09.35 PM.jpeg" alt="Bangle Logo" class="rounded-img shadow-img">
            </div>
        </div>
    </section>
</div>
    </body>
</html>
