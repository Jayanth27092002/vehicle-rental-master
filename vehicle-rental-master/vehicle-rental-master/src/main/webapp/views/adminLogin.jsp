<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Login</title>
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');
 
    body {
        font-family: 'Poppins', sans-serif;
        background-color: #f3e5f5; /* Light Lavender/Violet background */
        color: #333; /* Dark text for contrast */
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
 
    .container {
        background: #ffffff; /* White container */
        padding: 2.5rem;
        border-radius: 12px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1); /* Soft shadow */
        text-align: center;
        width: 90%;
        max-width: 400px;
        animation: fadeIn 0.8s ease-in-out;
    }
 
    h2 {
        font-size: 22px;
        font-weight: 600;
        color: #673ab7; /* Deep Violet heading */
        margin-bottom: 15px;
    }
 
    .error {
        color: #ff4b5c; /* Vivid Purple/Magenta error message */
        font-size: 14px;
        margin-bottom: 15px;
    }
 
    label {
        display: block;
        font-size: 14px;
        font-weight: 500;
        color: #673ab7; /* Deep Violet label */
        text-align: left;
        margin-bottom: 5px;
    }
 
    input {
        width: 100%;
        padding: 12px;
        margin-bottom: 15px;
        border: 1px solid #ce93d8; /* Light Lavender border */
        border-radius: 8px;
        background: #f8f0ff; /* Very light Lavender/Violet input background */
        color: #333; /* Dark text for input */
        font-size: 14px;
    }
 
    input:focus {
        outline: none;
        border-color: #673ab7; /* Deep Violet focus */
        box-shadow: 0 0 5px rgba(103, 58, 183, 0.3); /* Violet shadow on focus */
    }
 
    .login-btn {
        width: 100%;
        padding: 12px;
        font-size: 14px;
        font-weight: 500;
        color: #fff; /* White text for button */
        background: linear-gradient(135deg, #673ab7, #512da8); /* Violet gradient */
        border: none;
        border-radius: 8px;
        cursor: pointer;
        transition: transform 0.2s ease, background 0.3s ease;
    }
 
    .login-btn:hover {
        background: linear-gradient(135deg, #512da8, #4527a0); /* Darker Violet on hover */
        transform: scale(1.05);
    }
 
    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(-20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
</style>
</head>
<body>
    <div class="container">
        <h2>Admin Login</h2>
        <% if (request.getAttribute("error") != null) { %>
            <p class="error"><%= request.getAttribute("error") %></p>
        <% } %>
        <form action="${pageContext.request.contextPath}/admin/login" method="post">
            <label>Email:</label>
            <input type="email" name="email" required>
            <label>Password:</label>
            <input type="password" name="password" required>
            <button type="submit" class="login-btn">Login</button>
        </form>
    </div>
</body>
</html>
