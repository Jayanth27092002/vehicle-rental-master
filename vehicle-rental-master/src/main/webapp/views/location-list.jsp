<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Location List</title>
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');
 
    body {
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #f6f7f9, #eaeef3); /* Original background gradient */
        color: #333;
        padding: 20px;
    }
 
    h2 {
        font-size: 26px;
        font-weight: 600;
        color: #555; /* Slightly darker heading */
        margin-bottom: 20px;
    }
 
    a {
        text-decoration: none;
        font-weight: 600;
        color: #ffffff;
        background-color: #512da8; /* Violet */
        padding: 10px 16px;
        border-radius: 8px;
        transition: background-color 0.3s ease;
    }
 
    a:hover {
        background-color: #4527a0; /* Darker Violet */
    }
 
    table {
        width: 100%;
        border-collapse: collapse;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05); /* Softer shadow */
        background: #ffffff;
        margin-top: 20px;
    }
 
    th,
    td {
        padding: 16px;
        text-align: left;
        border-bottom: 1px solid #eee; /* Lighter border */
    }
 
    th {
        background-color: #f8f9fa; /* Very light gray for header */
        font-weight: 600;
        color: #555; /* Darker header text */
    }
 
    input[type="text"] {
        width: 90%;
        padding: 8px;
        border: 1px solid #ced4da; /* Light gray border */
        border-radius: 5px;
        font-size: 16px;
    }
 
    button {
        padding: 10px 14px;
        font-size: 14px;
        font-weight: 600;
        color: #ffffff;
        background-color: #512da8; /* Violet */
        border: none;
        border-radius: 8px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        margin-right: 8px;
    }
 
    button:hover {
        background-color: #4527a0; /* Darker Violet */
    }
 
    .btn-danger {
        background-color: #d32f2f; /* Darker Red */
    }
 
    .btn-danger:hover {
        background-color: #c62828; /* Even Darker Red */
    }
 
    .btn-secondary {
        background-color: #512da8; /* Violet */
    }
 
    .btn-secondary:hover {
        background-color: #4527a0; /* Darker Violet */
    }
</style>
</head>
<body>
    <h2>Location List</h2>
    <a href="${pageContext.request.contextPath}/location/create">Add New Location</a>
    <table>
        <tr>
            <th>ID</th>
            <th>Location Name</th>
            <th>Location Address</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="location" items="${locations}">
            <tr>
                <td>${location.id}</td>
                <td>
                    <input type="text" id="editName_${location.id}" value="${location.locationName}" readonly>
                </td>
                <td>
                    <input type="text" id="editAddress_${location.id}" value="${location.locationAddress}" readonly>
                </td>
                <td>
                    <button class="btn-secondary" onclick="enableEdit('${location.id}')">Edit</button>
                    <button id="saveBtn_${location.id}" style="display:none;" onclick="saveLocation('${location.id}')">Save</button>
                    <a href="${pageContext.request.contextPath}/location/delete/${location.id}"
                       class="btn-danger"
                       onclick="return confirm('Are you sure you want to delete this location?')">Delete</a>
                </td>
            </tr>
            <form id="editForm_${location.id}" method="post" action="${pageContext.request.contextPath}/location/save">
                <input type="hidden" name="id" value="${location.id}">
                <input type="hidden" name="locationName" id="hiddenName_${location.id}">
                <input type="hidden" name="locationAddress" id="hiddenAddress_${location.id}">
            </form>
        </c:forEach>
    </table>
 
    <script type="text/javascript">
        function enableEdit(rowId) {
            document.getElementById("editName_" + rowId).removeAttribute("readonly");
            document.getElementById("editAddress_" + rowId).removeAttribute("readonly");
            document.getElementById("saveBtn_" + rowId).style.display = "inline";
        }
 
        function saveLocation(rowId) {
            document.getElementById("hiddenName_" + rowId).value = document.getElementById("editName_" + rowId).value;
            document.getElementById("hiddenAddress_" + rowId).value = document.getElementById("editAddress_" + rowId).value;
            document.getElementById("editForm_" + rowId).submit();
        }
    </script>
</body>
</html>
 