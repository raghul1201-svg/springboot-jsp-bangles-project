<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>SS bangles</title>
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
<!--            <li><a href="produce.jsp" class="nav-link">produce</a></li>-->
            <li><a href="contact.jsp" class="nav-link">contact</a></li>
            <li><a href="about_us.jsp" class="nav-link">about us</a></li>
        </ul>
    </nav>

    <!-- LOGIN PAGE -->
<div class="login-page">
    <div class="login-card">
        <div class="card-accent"></div>
        
        <div class="icon-header">
            <span class="material-symbols-outlined">account_circle</span>
        </div>

        <h3>Welcome Back</h3>
        <p style="color: var(--clr-grey-2); font-size: 0.8rem; margin-bottom: 1.5rem;">
            Please enter your details to login
        </p>

        <form class="login-form" action="loginadd.jsp" method="post">
            
            <div class="input-group">
                <label>Username</label>
                <input type="text" name="name" placeholder="Enter username" required>
            </div>

            <div class="input-group">
                <label>Password</label>
                <input type="password" name="pass" placeholder="Enter password" required>
            </div>

            <button type="submit">Login</button>
        </form>

        <div class="login-links" style="margin-top: 1.5rem; font-size: 0.85rem;">
            <a href="forgot.jsp" style="color: var(--clr-grey-2); display: block; margin-bottom: 8px;">Forgot Password?</a>
            <span style="color: var(--clr-grey-2);">New here?</span> 
            <a href="sign_in.jsp" style="color: var(--clr-primary); font-weight: 600;">Create Account</a>
        </div>
    </div>
</div>
</body>
</html>