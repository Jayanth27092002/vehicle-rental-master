<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Role Form</title>
</head>
<body>
    <h2>Role Form</h2>
    <form action="${pageContext.request.contextPath}/role/save" method="post">
        <label for="id">Role ID:</label>
        <input type="text" name="id" id="id" required><br><br>

        <label for="roleId">Role Identifier:</label>
        <input type="text" name="roleId" id="roleId" required><br><br>

        <label for="role">Role Name:</label>
        <input type="text" name="role" id="role" required><br><br>

        <button type="submit">Submit</button>
    </form>
</body>
</html>
    