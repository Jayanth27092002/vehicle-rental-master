<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Login</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #e0f7fa, #f3e5f5); /* Sky blue to pastel violet gradient */
            color: #1a1a2e;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background: #ffffff;
            padding: 2.5rem;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 90%;
            max-width: 400px;
            animation: fadeIn 0.8s ease-in-out;
        }

        h2 {
            font-size: 22px;
            font-weight: 600;
            color: #1a1a2e;
            margin-bottom: 15px;
        }

        .error {
            color: #ff4b5c;
            font-size: 14px;
            margin-bottom: 15px;
        }

        label {
            display: block;
            text-align: left;
            font-size: 14px;
            font-weight: 500;
            color: #1a1a2e;
            margin-bottom: 5px;
        }

        input {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ce93d8; /* Light violet border */
            border-radius: 8px;
            background: #ffffff;
            color: #1a1a2e;
            font-size: 14px;
            transition: 0.3s ease;
        }

        input:focus {
            outline: none;
            border-color: #9c27b0; /* Violet focus */
            box-shadow: 0 0 5px rgba(156, 39, 176, 0.3); /* Violet focus shadow */
        }

        .btn {
            width: 100%;
            padding: 12px;
            font-size: 14px;
            font-weight: 500;
            color: #ffffff;
            background: linear-gradient(135deg, #9c27b0, #6a1b9a); /* Violet gradient button */
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: transform 0.2s ease, background 0.3s ease;
            margin-top: 15px;
        }

        .btn:hover {
            background: linear-gradient(135deg, #6a1b9a, #4a148c); /* Darker violet on hover */
            transform: scale(1.05);
        }

        .links {
            margin-top: 10px;
            font-size: 14px;
            color: #1a1a2e;
        }

        .links a {
            color: #673ab7; /* Deep violet links */
            text-decoration: none;
            transition: 0.3s ease;
        }

        .links a:hover {
            color: #1a1a2e;
            text-decoration: underline;
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
        <h2>User Login</h2>
        <% if (request.getAttribute("error") != null) { %>
            <p class="error"><%= request.getAttribute("error") %></p>
        <% } %>
        <form action="${pageContext.request.contextPath}/user/login" autocomplete="off" method="post">
            <label>Email:</label>
            <input type="email" name="email" value="" required>
            <label>Password:</label>
            <input type="password" name="password" autocomplete="off" value="" required>
            <button type="submit" class="btn">Login</button>
        </form>
        <div class="links">
            <p><a href="forgot-password">Forgot Password?</a></p>
            <p>Don't have an account? <a href="${pageContext.request.contextPath}/user/register">Register here</a></p>
            <p class="admin-link"><a href="${pageContext.request.contextPath}/admin/login">Login as Admin?</a></p>
        </div>
    </div>
</body>
</html>