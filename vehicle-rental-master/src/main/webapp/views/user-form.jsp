<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Form</title>
</head>
<body>
    <h2>User Registration / Update Form</h2>
    <form action="${pageContext.request.contextPath}/user/save" method="post">
        <label for="id">User ID:</label>
        <input type="text" name="id" id="id" required><br><br>

        <label for="name">Name:</label>
        <input type="text" name="name" id="name" required><br><br>

        <label for="email">Email:</label>
        <input type="email" name="email" id="email" required><br><br>

        <label for="password">Password:</label>
        <input type="password" name="password" id="password" required><br><br>

        <label for="phoneNumber">Phone Number:</label>
        <input type="text" name="phoneNumber" id="phoneNumber" required><br><br>

        <label for="userPan">User PAN:</label>
        <input type="text" name="userPan" id="userPan" required><br><br>

        <label for="userAadhar">User Aadhar:</label>
        <input type="text" name="userAadhar" id="userAadhar" required><br><br>

        <label for="rentalStatus">Rental Status:</label>
        <select name="rentalStatus" id="rentalStatus">
            <option value="Active">Active</option>
            <option value="Inactive">Inactive</option>
        </select><br><br>

        <label for="balance">Balance:</label>
        <input type="number" step="0.01" name="balance" id="balance" required><br><br>

        <button type="submit">Submit</button>
    </form>
</body>
</html>
    