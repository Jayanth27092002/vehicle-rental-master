<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Registration</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

      body {
    font-family: 'Poppins', sans-serif;
    background: linear-gradient(135deg, #FFE6A9, #FFF0D1); /* Matching background gradient */
    color: #1a1a2e; /* Dark navy-blue for text */
    display: flex;
    justify-content: center;
    align-items: flex-start; /* Align to the top */
    height: 100vh;
    margin: 0;
    padding-top: 20px; /* Add some space from the top */
}


        .container {
            background: #E0A75E;
            padding: 2.5rem;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
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
            border: 1px solid #ccc;
            border-radius: 8px;
            background: #ffffff;
            color: #1a1a2e;
            font-size: 14px;
            transition: 0.3s ease;
        }

        input:focus {
            outline: none;
            border-color: #D4A55C;
            box-shadow: 0 0 5px rgba(212, 165, 92, 0.5);
        }

        .btn {
            width: 100%;
            padding: 12px;
            font-size: 14px;
            font-weight: 500;
            color: #ffffff;
            background: linear-gradient(135deg, #D4A55C, #B88C4A);
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: transform 0.2s ease, background 0.3s ease;
            margin-top: 15px;
        }

        .btn:hover {
            background: linear-gradient(135deg, #B88C4A, #9A743D);
            transform: scale(1.05);
        }

        .links {
            margin-top: 10px;
            font-size: 14px;
            color: #1a1a2e;
        }

        .links a {
            color: #16213e;
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
            <p class="error"><%= request.getAttribute("error") %></p>
        <% } %>
        <form action="${pageContext.request.contextPath}/user/register" method="post">
            <label>Name:</label>
            <input type="text" name="name" value="${user.name}" required>
            <label>Email:</label>
            <input type="email" name="email" value="${user.email}" required>
            <label>Password:</label>
            <input type="password" name="password" required>
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