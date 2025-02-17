<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>EasyDrives</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #e0f7fa, #f3e5f5); /* Sky blue to pastel violet */
            color: #1a1a2e; /* Dark text for contrast */
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            display: flex;
            width: 80%;
            max-width: 900px;
            background: #ffffff; /* White container */
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1); /* Softer shadow */
            overflow: hidden;
        }

        .left-section {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            background: rgba(255, 255, 255, 0.2); /* Semi-transparent white background */
        }

        .left-section img {
            max-width: 100%;
            border-radius: 12px;
        }

        .right-section {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 2.5rem;
        }

        h1 {
            font-size: 26px;
            font-weight: 600;
            color: #1a1a2e; /* Dark heading */
            margin-bottom: 20px;
        }

        .btn {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            padding: 14px;
            font-size: 16px;
            font-weight: 500;
            color: #ffffff;
            background: linear-gradient(135deg, #9c27b0, #6a1b9a); /* Violet gradient */
            border: none;
            border-radius: 10px;
            text-decoration: none;
            cursor: pointer;
            transition: transform 0.2s ease, background 0.3s ease;
            margin-bottom: 12px;
        }

        .btn i {
            margin-right: 10px;
            font-size: 18px;
        }

        .btn:hover {
            background: linear-gradient(135deg, #6a1b9a, #4a148c); /* Darker violet hover */
            transform: scale(1.06);
        }

        .navbar {
            position: absolute;
            top: 20px;
            left: 50%;
            transform: translateX(-50%);
            font-size: 24px;
            font-weight: 600;
            color: #4a148c; /* Dark violet navbar text */
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.min.js"></script>
</head>
<body>
    <div class="navbar">EasyDrives</div>
    <div class="container">
        <div class="left-section">
            <img src="https://www.shutterstock.com/shutterstock/videos/3629777031/thumb/10.jpg?ip=x480" alt="Car for Rent">
        </div>
        <div class="right-section">
            <h1>Welcome to EasyDrives Rental Service</h1>
            <a href="${pageContext.request.contextPath}/user/login" class="btn">
                <i class="fas fa-user"></i> Login/Register as User
            </a>
            <a href="${pageContext.request.contextPath}/admin/login" class="btn">
                <i class="fas fa-user-shield"></i> Login as Admin
            </a>
        </div>
    </div>
</body>
</html>