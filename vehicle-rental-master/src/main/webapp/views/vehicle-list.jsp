<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vehicle List</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f3e5f5; /* Light Lavender/Violet background */
            color: #333; /* Dark text for contrast */
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh; /* Ensure full viewport height */
            margin: 0;
            padding: 20px;
        }
 
        .container {
            background: #ffffff; /* White container */
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1); /* Softer shadow */
            width: 90%;
            max-width: 1200px; /* Adjust max width as needed */
            animation: fadeIn 0.8s ease-in-out;
            box-sizing: border-box; /* Include padding in width */
        }
 
        h2 {
            font-size: 24px;
            font-weight: 600;
            color: #512da8; /* Deep Violet heading */
            text-align: center;
            margin-bottom: 20px;
        }
 
        .btn {
            padding: 10px 20px;
            font-size: 16px;
            font-weight: 500;
            color: #ffffff;
            background: linear-gradient(135deg, #673ab7, #512da8); /* Violet gradient */
            border: none;
            border-radius: 8px;
            text-decoration: none;
            cursor: pointer;
            transition: transform 0.2s ease, background 0.3s ease;
            margin-bottom: 20px;
            display: inline-block;
        }
 
        .btn:hover {
            background: linear-gradient(135deg, #512da8, #4527a0); /* Darker Violet on hover */
            transform: scale(1.05);
        }
 
        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 16px; /* Slightly smaller font size */
            margin-top: 20px;
            table-layout: fixed; /* For even column distribution */
        }
 
        th, td {
            padding: 12px;
            border: 1px solid #ce93d8; /* Light Lavender border */
            text-align: left;
            overflow: hidden; /* Prevent content from overflowing */
            white-space: nowrap; /* Prevent text from wrapping */
            text-overflow: ellipsis; /* Add ellipsis (...) for overflowing text */
        }
 
        th {
            background-color: #f8f0ff; /* Very light Lavender for header */
            color: #512da8; /* Deep Violet header text */
            font-weight: 600;
        }
 
        input[type="text"] {
            background-color: #f8f0ff; /* Light Lavender input background */
            color: #333; /* Dark text */
            border: 1px solid #ce93d8; /* Light Lavender border */
            padding: 8px;
            border-radius: 4px;
            width: 100%;
            box-sizing: border-box; /* Include padding and border in width */
        }
 
        .action-btn {
            margin-right: 10px;
            padding: 8px 12px;
            font-size: 14px;
            color: #ffffff;
            background-color: #673ab7; /* Violet */
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
 
        .action-btn:hover {
            background-color: #512da8; /* Darker Violet */
        }
 
        
        
        
 
        
        .delete-btn {
            background-color: #ef5350;
        }
 
        .delete-btn:hover {
            background-color: #e53935;
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
        <h2>Vehicle List</h2>
        <a href="${pageContext.request.contextPath}/vehicle/create" class="btn">Add New Vehicle</a>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Vehicle Name</th>
                    <th>Vehicle Type</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="vehicle" items="${vehicles}">
                    <tr>
                        <td>${vehicle.id}</td>
                        <td>
                            <input type="text" id="editName_${vehicle.id}" value="${vehicle.vehicleName}" readonly>
                        </td>
                        <td>
                            <input type="text" id="editType_${vehicle.id}" value="${vehicle.vehicleType}" readonly>
                        </td>
                        <td>
                            <button class="action-btn" onclick="enableEdit('${vehicle.id}')">Edit</button>
                            <button class="action-btn" id="saveBtn_${vehicle.id}" style="display:none;"
                                    onclick="saveVehicle('${vehicle.id}')">Save</button>
                            <a href="${pageContext.request.contextPath}/vehicle/delete/${vehicle.id}"
                               class="action-btn delete-btn"
                               onclick="return confirm('Are you sure you want to delete this vehicle?')">Delete</a>
                        </td>
                    </tr>
                    <form id="editForm_${vehicle.id}" method="post" action="${pageContext.request.contextPath}/vehicle/save">
                        <input type="hidden" name="id" value="${vehicle.id}">
                        <input type="hidden" name="vehicleName" id="hiddenName_${vehicle.id}">
                        <input type="hidden" name="vehicleType" id="hiddenType_${vehicle.id}">
                    </form>
                </c:forEach>
            </tbody>
        </table>
    </div>
 
    <script type="text/javascript">
        function enableEdit(rowId) {
            document.getElementById("editName_" + rowId).removeAttribute("readonly");
            document.getElementById("editType_" + rowId).removeAttribute("readonly");
            document.getElementById("saveBtn_" + rowId).style.display = "inline";
        }
 
        function saveVehicle(rowId) {
            // Set the hidden form values
            document.getElementById("hiddenName_" + rowId).value = document.getElementById("editName_" + rowId).value;
            document.getElementById("hiddenType_" + rowId).value = document.getElementById("editType_" + rowId).value;
            // Submit the form
            document.getElementById("editForm_" + rowId).submit();
        }
    </script>
</body>
</html>