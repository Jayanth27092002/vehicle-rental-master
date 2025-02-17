<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Home</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');
 
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f3e5f5; /* Light Lavender/Violet background */
            color: #333; /* Dark text for contrast */
            display: flex;
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
            min-height: 100vh; /* Ensure full viewport height */
            margin: 0;
        }
 
        .container {
            background: #ffffff; /* White container */
            padding: 3rem; /* Increased padding */
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1); /* Soft shadow */
            text-align: center;
            width: 90%;
            max-width: 500px; /* Adjusted max width */
            animation: fadeIn 0.8s ease-in-out;
            box-sizing: border-box; /* Include padding in width */
        }
 
        h2 {
            font-size: 24px;
            font-weight: 600;
            color: #512da8; /* Deep Violet heading */
            margin-bottom: 2rem; /* Increased margin */
        }
 
        .action-btn {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            padding: 12px;
            font-size: 16px;
            font-weight: 500;
            color: #fff; /* White text for button */
            background: linear-gradient(135deg, #673ab7, #512da8); /* Violet gradient */
            border: none;
            border-radius: 8px;
            text-decoration: none;
            cursor: pointer;
            transition: transform 0.2s ease, background 0.3s ease;
            margin-bottom: 1.5rem; /* Increased margin between buttons */
        }
 
        .action-btn i {
            margin-right: 10px;
            font-size: 18px;
        }
        
        .action-btn:hover {
            background: linear-gradient(135deg, #512da8, #4527a0); /* Darker Violet on hover */
            transform: scale(1.05);
        }
 
        .logout-btn {
            background: linear-gradient(135deg, #673ab7, #512da8); /* Violet gradient */
        }
 
        .logout-btn:hover {
            background: linear-gradient(135deg, #512da8, #4527a0); /* Darker Violet on hover */
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
    <div class="container">
        <h2>Welcome, Admin!</h2>
        <a href="${pageContext.request.contextPath}/admin/logout" class="action-btn logout-btn">
            <i class="fas fa-sign-out-alt"></i> Logout
        </a>
 
        <a href="${pageContext.request.contextPath}/reports/all" class="action-btn">
            <i class="fas fa-file-alt"></i> View Reports
        </a>
 
        <a href="${pageContext.request.contextPath}/location/list" class="action-btn">
            <i class="fas fa-map-marker-alt"></i> View Locations
        </a>
 
        <a href="${pageContext.request.contextPath}/vehicle/list" class="action-btn">
            <i class="fas fa-car"></i> View Vehicles
        </a>
 
        <a href="${pageContext.request.contextPath}/refunds" class="action-btn">
            <i class="fas fa-money-bill"></i> Refunds
        </a>
    </div>
</body>
</html>