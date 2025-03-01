<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Registration</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #e0f7fa, #f3e5f5);
            color: #1a1a2e;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            overflow: hidden;
        }

        .container {
            background: #ffffff;
            padding: 2.5rem;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 90%;
            max-width: 400px;
            max-height: 90vh;
            overflow-y: auto;
            animation: fadeIn 0.8s ease-in-out;
        }

        h2 {
            font-size: 22px;
            font-weight: 600;
            color: #1a1a2e;
            margin-bottom: 15px;
        }

       .error {
    color: #fff;
    background-color: #ff4b5c;
    font-size: 14px;
    padding: 10px;
    border-radius: 8px;
    text-align: center;
    margin-bottom: 15px;
    font-weight: 500;
    animation: fadeIn 0.5s ease-in-out;
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
            border: 1px solid #ce93d8;
            border-radius: 8px;
            background: #ffffff;
            color: #1a1a2e;
            font-size: 14px;
            transition: 0.3s ease;
        }

        input:focus {
            outline: none;
            border-color: #9c27b0;
            box-shadow: 0 0 5px rgba(156, 39, 176, 0.3);
        }

        .btn {
            width: 100%;
            padding: 12px;
            font-size: 14px;
            font-weight: 500;
            color: #ffffff;
            background: linear-gradient(135deg, #9c27b0, #6a1b9a);
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: transform 0.2s ease, background 0.3s ease;
            margin-top: 15px;
        }

        .btn:hover {
            background: linear-gradient(135deg, #6a1b9a, #4a148c);
            transform: scale(1.05);
        }

        .links {
            margin-top: 10px;
            font-size: 14px;
            color: #1a1a2e;
        }

        .links a {
            color: #673ab7;
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
        <h2>User Registration</h2>
       <% if (request.getAttribute("error") != null) { %>
    <div class="error">
        <%= request.getAttribute("error") %>
    </div>
<% } %>
        <form action="${pageContext.request.contextPath}/user/register" method="post">
            <label>Name:</label>
            <input type="text" name="name" value="${user.name}" required>
            <label>Email:</label>
            <input type="email" name="email" value="${user.email}" required>
            <label>Password:</label>
            <input type="password" name="password" placeholder="Atleast 1 &quot;Aa!1&quot; should be present" required>
            <label>Phone Number:</label>
            <input type="text" name="phoneNumber" value="${user.phoneNumber}" required>
            <label>License:</label>
            <input type="text" name="userLicense" value="${user.userLicense}" required>
            <label>Aadhar:</label>
            <input type="text" name="userAadhar" value="${user.userAadhar}" required>
            <button type="submit" class="btn">Register</button>
        </form>
        <div class="links">
            <p>Already have an account? <a href="${pageContext.request.contextPath}/user/login">Login here</a></p>
        </div>
    </div>
</body>
</html>
