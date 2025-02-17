<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vehicle Form</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');
 
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f3e5f5; /* Light Lavender/Violet background */
            display: flex;
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
            min-height: 100vh; /* Ensure full viewport height */
            margin: 0;
            padding: 20px;
        }
 
        .form-container {
            background: #ffffff;
            padding: 3rem; /* Increased padding */
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 500px; /* Adjusted max width */
            animation: fadeIn 0.8s ease-in-out;
            box-sizing: border-box; /* Include padding in width */
        }
 
        h2 {
            font-size: 24px;
            font-weight: 600;
            color: #512da8; /* Deep Violet heading */
            text-align: center;
            margin-bottom: 2rem; /* Increased margin */
        }
 
        label {
            display: block;
            margin-bottom: 0.5rem; /* Adjusted margin */
            font-weight: 500;
            color: #673ab7; /* Violet label color */
        }
 
        input[type="text"] {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ce93d8; /* Light Lavender border */
            border-radius: 8px;
            margin-bottom: 1.5rem; /* Increased margin */
            transition: border-color 0.2s;
            box-sizing: border-box; /* Include padding in width */
            background-color: #f8f0ff; /* Light Lavender input background */
        }
 
        input[type="text"]:focus {
            outline: none;
            border-color: #512da8; /* Deep Violet focus */
        }
 
        button[type="submit"] {
            background-color: #673ab7; /* Deep Violet button */
            color: #ffffff;
            padding: 12px;
            font-size: 16px;
            font-weight: 600;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s;
        }
 
        button[type="submit"]:hover {
            background-color: #512da8; /* Darker Violet hover */
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
    <div class="form-container">
        <h2>Vehicle Form</h2>
        <form action="${pageContext.request.contextPath}/vehicle/save" method="post">
            <label for="id">Vehicle ID:</label>
            <input type="text" name="id" id="id" required>
 
            <label for="vehicleType">Vehicle Type:</label>
            <input type="text" name="vehicleType" id="vehicleType" required>
 
            <label for="vehicleName">Vehicle Name:</label>
            <input type="text" name="vehicleName" id="vehicleName" required>
 
            <label for="vehicleStatus">Vehicle Status:</label>
            <input type="text" name="vehicleStatus" id="vehicleStatus">
 
            <label for="vehicleImage">Vehicle Image:</label>
            <input type="text" name="vehicleImage" id="vehicleImage">
 
            <label for="rentalPrice">Rental Price:</label>
            <input type="text" name="rentalPrice" id="rentalPrice" required>
 
            <label for="locationId">Location ID:</label>
            <input type="text" name="locationId" id="locationId" required>
 
            <button type="submit">Submit</button>
        </form>
    </div>
</body>
</html>