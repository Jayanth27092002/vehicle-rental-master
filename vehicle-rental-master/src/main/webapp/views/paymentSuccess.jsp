<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Payment Success</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap'); /* Import Poppins font */

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #e0f7fa, #f3e5f5); /* Sky blue to pastel violet gradient */
            color: #1a1a2e; /* Dark text color for contrast */
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 2rem;
            margin: 0;
        }

        .container {
            background: #ffffff; /* White container */
            padding: 2.5rem; /* Increased padding */
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1); /* Softer shadow */
            text-align: center;
            width: 90%;
            max-width: 600px; /* Adjusted max-width */
            margin-bottom: 2rem;
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

        .success-message {
            color: #4CAF50; /* Green success message */
            font-size: 16px; /* Slightly smaller font */
            margin-bottom: 1rem;
        }

        .details {
            text-align: left; /* Align details to the left */
            margin-bottom: 1.5rem; /* Increased margin */
        }

        .details p {
            margin-bottom: 0.5rem; /* Spacing between detail lines */
        }

        .cancel-button {
            padding: 10px 16px; /* Adjusted padding */
            font-size: 14px;
            font-weight: 500;
            color: #ffffff;
            background: linear-gradient(135deg, #9c27b0, #6a1b9a); /* Violet gradient button */
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: transform 0.2s ease, background 0.3s ease; /* Add transitions */
        }

        .cancel-button:hover {
            background: linear-gradient(135deg, #6a1b9a, #4a148c); /* Darker violet on hover */
            transform: scale(1.05); /* Scale on hover */
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
        <h2>Payment Successful</h2>
        <div class="success-message">Your payment was successful!</div>
        <div class="details">
            <p><strong>Booking ID:</strong> ${booking.id}</p>
            <p><strong>Vehicle:</strong> ${booking.vehicle.vehicleName}</p>
            <p><strong>Duration:</strong> ${booking.duration} hours</p>
            <p><strong>Total Cost:</strong> $${booking.bookingPrice}</p>
            <p><strong>Payment Mode:</strong> ${payment.paymentMode}</p>
            <p><strong>Payment Status:</strong> ${payment.paymentStatus}</p>
        </div>
        <form action="${pageContext.request.contextPath}/payment/cancel" method="post">
            <input type="hidden" name="bookingId" value="${booking.id}">
            <button type="submit" class="cancel-button">Cancel Booking</button>
        </form>
    </div>
</body>
</html>