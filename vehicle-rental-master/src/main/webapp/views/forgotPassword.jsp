<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>Forgot Password</title>
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
            text-align: center;
            width: 90%;
            max-width: 400px;
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

        label {
            display: block;
            text-align: left;
            margin: 10px 0 5px;
            color: #1a1a2e;
            font-weight: 500;
        }

        input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ce93d8; /* Light violet border */
            border-radius: 8px;
            background: #ffffff; /* White background */
            color: #1a1a2e;
            font-size: 16px;
            outline: none;
            transition: 0.3s ease; /* Add transition for focus effect */
        }

        input:focus {
            border-color: #9c27b0; /* Violet focus */
            box-shadow: 0 0 5px rgba(156, 39, 176, 0.3); /* Violet focus shadow */
        }

        .btn {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            font-weight: 500; /* Slightly less bold */
            color: #ffffff;
            background: linear-gradient(135deg, #9c27b0, #6a1b9a); /* Violet gradient button */
            border: none;
            border-radius: 8px;
            cursor: pointer;
            margin-top: 15px;
            transition: transform 0.2s ease, background 0.3s ease; /* Add transitions */
        }

        .btn:hover {
            background: linear-gradient(135deg, #6a1b9a, #4a148c); /* Darker violet on hover */
            transform: scale(1.05); /* Scale on hover */
        }

        .register-link {
            margin-top: 10px;
            color: #1a1a2e; /* Darker link color */
            font-size: 14px;
            display: inline-block;
            text-decoration: none;
            font-weight: 500;
            transition: 0.3s ease; /* Add transition for hover effect */
        }

        .register-link:hover {
            color: #673ab7; /* Deep violet on hover */
            text-decoration: underline;
        }

        @keyframes fadeIn { /* Fade-in animation */
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
        <h2>Forgot Password</h2>
        <form action="forgot-password" method="post">
            <label>Email:</label>
            <input type="email" name="email" required>
            <button type="submit" class="btn">Reset Password</button>
        </form>
        <p><a href="${pageContext.request.contextPath}/user/login" class="register-link">Back to Login</a></p>
    </div>
</body>
</html>