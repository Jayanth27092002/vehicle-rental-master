<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Location Form</title>
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');
 
    body {
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #f3e5f5, #ede7f6); /* Light Lavender gradient background */
        color: #333;
        padding: 20px;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
 
    .form-container {
        background-color: #ffffff;
        padding: 2rem;
        border-radius: 12px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1); /* Softer shadow */
        width: 100%;
        max-width: 400px;
    }
 
    h2 {
        font-size: 24px;
        font-weight: 600;
        color: #512da8; /* Deep Violet heading */
        text-align: center;
        margin-bottom: 20px;
    }
 
    form {
        display: flex;
        flex-direction: column;
        gap: 20px;
    }
 
    label {
        font-weight: 600;
        font-size: 14px;
        color: #673ab7; /* Violet label color */
        margin-bottom: 5px;
    }
 
    input[type="text"] {
        width: 100%;
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ce93d8; /* Light Lavender border */
        border-radius: 8px;
        box-sizing: border-box;
        background-color: #f8f0ff; /* Light Lavender input background */
    }
 
    button {
        padding: 12px;
        font-size: 16px;
        font-weight: 600;
        color: #ffffff;
        background-color: #673ab7; /* Deep Violet */
        border: none;
        border-radius: 8px;
        cursor: pointer;
        transition: background-color 0.3s ease, transform 0.2s ease;
        width: 100%;
        text-transform: uppercase;
        letter-spacing: 1px;
    }
 
    button:hover {
        background-color: #512da8; /* Darker Violet */
        transform: scale(1.05);
    }
</style>
</head>
<body>
    <div class="form-container">
        <h2>Location Form</h2>
        <form action="${pageContext.request.contextPath}/location/save" method="post">
            <label for="id">Location ID:</label>
            <input type="text" name="id" id="id" required>
 
            <label for="locationName">Location Name:</label>
            <input type="text" name="locationName" id="locationName" required>
 
            <label for="locationAddress">Location Address:</label>
            <input type="text" name="locationAddress" id="locationAddress" required>
 
            <button type="submit">Submit</button>
        </form>
    </div>
</body>
</html>