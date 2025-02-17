<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>Reset Password</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #e0f7fa, #f3e5f5); /* Sky blue to pastel violet */
            color: #1a1a2e;
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
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1); /* Softer shadow */
            width: 90%;
            max-width: 400px;
            text-align: center;
            animation: fadeIn 0.8s ease-in-out; /* Add fade-in animation */
        }

        h2 {
            font-size: 22px;
            font-weight: 600;
            color: #1a1a2e;
            margin-bottom: 15px;
            border-bottom: 2px solid #9c27b0; /* Violet underline */
            padding-bottom: 5px;
        }

        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ce93d8; /* Light violet border */
            border-radius: 8px;
            background: #ffffff; /* White background */
            color: #1a1a2e;
            font-size: 16px;
            outline: none;
            transition: 0.3s ease;
        }

        input[type="password"]:focus {
            border-color: #9c27b0; /* Violet focus */
            box-shadow: 0 0 5px rgba(156, 39, 176, 0.3); /* Violet focus shadow */
        }

        button {
            background: linear-gradient(135deg, #9c27b0, #6a1b9a); /* Violet gradient */
            color: white;
            padding: 12px;
            border: none;
            border-radius: 8px;
            width: 100%;
            cursor: pointer;
            font-size: 16px;
            font-weight: 500;
            transition: transform 0.2s ease, background 0.3s ease;
        }

        button:hover {
            background: linear-gradient(135deg, #6a1b9a, #4a148c); /* Darker violet hover */
            transform: scale(1.05);
        }

        .error {
            color: #ff4b5c; /* Red error color */
            margin-bottom: 10px;
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
        <h2>Reset Password</h2>
        <% if (request.getAttribute("error") != null) { %>
            <p class="error"><%= request.getAttribute("error") %></p>
        <% } %>
        <form action="reset-password" method="post">
            <input type="hidden" name="email" value="<%= request.getParameter("email") %>">
            <input type="password" name="newPassword" placeholder="New Password" required>
            <button type="submit">Update Password</button>
        </form>
    </div>
</body>
</html>