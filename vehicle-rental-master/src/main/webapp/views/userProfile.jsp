<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Profile</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

         body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #e0f7fa, #f3e5f5); /* Sky blue to pastel violet */
            color: #1a1a2e;
            display: flex;
            justify-content: center;
            align-items: flex-start; /* Align to the top */
            padding-top: 2rem; /* Add top padding to the body */ /* This is the key change */
            margin: 0;
        }

        .container {
            background: #ffffff; /* White container */
            padding: 2.5rem;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1); /* Softer shadow */
            text-align: center;
            width: 90%;
            max-width: 500px;
            animation: fadeIn 0.8s ease-in-out;
        }

        h2 {
            font-size: 22px;
            font-weight: 600;
            color: #1a1a2e;
            margin-bottom: 15px;
        }

        .message {
            font-size: 14px;
            margin-bottom: 15px;
            padding: 10px;
            border-radius: 8px;
        }

        .success {
            background: #c8e6c9; /* Light green */
            color: #2e7d32; /* Darker green */
        }

        .error {
            background: #ffcdd2; /* Light red */
            color: #c62828; /* Darker red */
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
            background: linear-gradient(135deg, #9c27b0, #6a1b9a); /* Violet gradient */
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: transform 0.2s ease, background 0.3s ease;
            margin-top: 15px;
        }

        .btn:hover {
            background: linear-gradient(135deg, #6a1b9a, #4a148c); /* Darker violet hover */
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
        <h2>Profile</h2>

        <c:if test="${not empty success}">
            <p class="message success">${success}</p>
        </c:if>
        <c:if test="${not empty error}">
            <p class="message error">${error}</p>
        </c:if>

        <form action="${pageContext.request.contextPath}/home/profile" method="post">
            <input type="hidden" id="id" name="id" value="${user.id}">

            <label for="name">Name</label>
            <input type="text" id="name" name="name" value="${user.name}" required>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" value="${user.email}" required>

            <label for="phoneNumber">Phone Number</label>
            <input type="text" id="phoneNumber" name="phoneNumber" value="${user.phoneNumber}" required>

            <label for="userLicense">License</label>
            <input type="text" id="userLicense" name="userLicense" value="${user.userLicense}" required>

            <label for="userAadhar">Aadhar</label>
            <input type="text" id="userAadhar" name="userAadhar" value="${user.userAadhar}" required>

            <label for="balance">Balance</label>
            <input type="number" id="balance" name="balance" value="${user.balance}" step="0.01" required>

            <button type="submit" class="btn">Save Changes</button>
        </form>

        <div class="links">
            <p><a href="${pageContext.request.contextPath}/home">Back to Home</a></p>
        </div>
    </div>
</body>
</html>