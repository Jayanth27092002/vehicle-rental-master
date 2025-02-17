<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vehicle Rental Report</title>
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');
 
    body {
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #f3e5f5, #ede7f6); /* Light Lavender gradient background */
        color: #333;
        padding: 20px;
    }
 
    h2 {
        font-size: 26px;
        font-weight: 600;
        color: #512da8; /* Deep Violet heading */
        margin-bottom: 20px;
    }
 
    a {
        text-decoration: none;
        font-weight: 600;
        color: #ffffff;
        background-color: #673ab7; /* Violet */
        padding: 10px 16px;
        border-radius: 8px;
        transition: background-color 0.3s ease;
    }
 
    a:hover {
        background-color: #512da8; /* Darker Violet */
    }
 
    table {
        width: 100%;
        border-collapse: collapse;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Softer shadow */
        background: #ffffff;
        margin-top: 20px;
    }
 
    th,
    td {
        padding: 16px;
        text-align: left;
        border-bottom: 1px solid #ce93d8; /* Light Lavender border */
    }
 
    th {
        background-color: #f8f0ff; /* Very light Lavender for header */
        font-weight: 600;
        color: #512da8; /* Deep Violet header text */
    }
 
    input[type="text"] {
        width: 90%;
        padding: 8px;
        border: 1px solid #ce93d8; /* Light Lavender border */
        border-radius: 5px;
        font-size: 16px;
        background-color: #f8f0ff; /* Light Lavender input background */
    }
 
    button {
        padding: 10px 14px;
        font-size: 14px;
        font-weight: 600;
        color: #ffffff;
        background-color: #673ab7; /* Deep Violet */
        border: none;
        border-radius: 8px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        margin-right: 8px;
    }
 
    button:hover {
        background-color: #512da8; /* Darker Violet */
    }
 
    .btn-danger {
        background-color: #d500f9; /* Vivid Purple/Magenta */
    }
 
    .btn-danger:hover {
        background-color: #c51162; /* Darker Magenta */
    }
 
    .btn-secondary {
        background-color: #673ab7; /* Deep Violet */
    }
 
    .btn-secondary:hover {
        background-color: #512da8; /* Darker Violet */
    }
</style>
</head>
<body>
    <div class="container">
        <h2>Vehicle Rental Report</h2>
        <table>
            <thead>
                <tr>
                    <th>Rental ID</th>
                    <th>Customer Name</th>
                    <th>Vehicle ID</th>
                    <th>Rental Date</th>
                    <th>Booking ID</th>
                    <th>Booking Duration</th>
                    <th>Return Date</th>
                    <th>Rental Price</th>
                    <th>Total Amount</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Retrieve the rentalReports list from the request attributes
                    List<Object[]> rentalReports = (List<Object[]>) request.getAttribute("rentalReports");
 
                    if (rentalReports != null && !rentalReports.isEmpty()) {
                        for (Object[] report : rentalReports) {
                %>
                <tr>
                    <td><%= report[0] %></td> <!-- Rental ID -->
                    <td><%= report[1] %></td> <!-- Customer Name -->
                    <td><%= report[2] %></td> <!-- Vehicle ID -->
                    <td><%= report[3] %></td> <!-- Rental Date -->
                    <td><%= report[4] %></td> <!-- Booking ID -->
                    <td><%= report[5] %></td> <!-- Booking Duration -->
                    <td><%= report[6] %></td> <!-- Return Date -->
                    <td><%= report[7] %></td> <!-- Rental Price -->
                    <td><%= report[8] %></td> <!-- Total Amount -->
                </tr>
                <%
                        }
                    } else {
                %>
                    <tr><td colspan="9" class="no-data">No rental reports available.</td></tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>