<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Bangle - SS Bangles</title>
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

    <nav class="navbar">
        <div class="navbar-header">
            <img class="hide-bg" src="image/sharmi.png" alt="logo"/>
            <h3>SS bangles</h3>
            <span class="nav-close">
                <label for="nav-check">
                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px">
                        <path d="m256-200-56-56 224-224-224-224 56-56 224 224 224-224 56 56-224 224 224 224-56 56-224-224-224 224Z"/>
                    </svg>
                </label>
            </span>
        </div>
        <ul class="nav-item">
            <li><a href="admin.jsp" class="nav-link">Dashboard</a></li>
            <li><a href="produce.jsp" class="nav-link">View Products</a></li>
        </ul>
    </nav>

    <div class="login-page">
        <div class="login-card" style="max-width: 450px;">
            <div class="card-accent"></div>
            
            <div class="icon-header">
                <span class="material-symbols-outlined" style="font-size: 3rem; color: var(--clr-primary);">add_circle</span>
            </div>

            <h3>Add New Product</h3>
            <p style="color: var(--clr-grey-2); font-size: 0.8rem; margin-bottom: 1.5rem;">
                Enter the details to add a new bangle to the shop
            </p>

            <form class="login-form" action="addProductProcess.jsp" method="post">
                <div class="input-group">
                    <label>Bangle Name</label>
                    <input type="text" name="pname" placeholder="e.g. Silk Thread Bangle" required>
                </div>

                <div class="input-group">
                    <label>Price (₹)</label>
                    <input type="number" name="pprice" placeholder="e.g. 500" required>
                </div>
                <div class="input-group">
                <label>Old Price (₹) (Optional)</label>
                <input type="number" name="old_price" placeholder="e.g. 600"> 
                </div>
                <div class="input-group">
                    <label>Image Filename</label>
                    <input type="text" name="pimage" placeholder="e.g. bangle1.jpg" required>
                    <small style="color: var(--clr-grey-2); font-size: 0.7rem;">Make sure the image is in the /image folder</small>
                </div>

                <button type="submit">Add to Inventory</button>
                <a href="admin.jsp" style="display: block; margin-top: 15px; color: var(--clr-grey-2); text-decoration: none; font-size: 0.85rem;">Cancel</a>
            </form>
        </div>
    </div>

</body>
</html>