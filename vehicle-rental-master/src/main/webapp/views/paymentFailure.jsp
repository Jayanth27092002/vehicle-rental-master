<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Payment Failed</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #121212;
            color: #ffffff;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 2rem;
            margin: 0;
        }
        .container {
            background: #1e1e1e;
            padding: 2rem;
            border-radius: 12px;
            text-align: center;
            width: 90%;
            max-width: 800px;
            margin-bottom: 2rem;
        }
        .error-message {
            color: #ff4b5c;
            font-size: 24px;
            margin-bottom: 20px;
        }
        .button {
            padding: 10px 20px;
            font-size: 16px;
            font-weight: 500;
            color: #ffffff;
            background: linear-gradient(135deg, #ff4b5c, #d33f49);
            border: none;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
        }
        .button:hover {
            background: linear-gradient(135deg, #d33f49, #a32a34);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="error-message">Payment Failed!</div>
        <p>Please try again or choose a different payment method.</p>
        <a href="${pageContext.request.contextPath}/home" class="button">Go Back to Booking</a>
    </div>
</body>
</html>