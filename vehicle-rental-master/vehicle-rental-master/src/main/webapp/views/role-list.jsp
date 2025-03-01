<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Role List</title>
</head>
<body>
    <h2>Role List</h2>
    <a href="${pageContext.request.contextPath}/role/create">Add New Role</a>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Role Identifier</th>
            <th>Role Name</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="role" items="${roles}">
            <tr>
                <td>${role.id}</td>
                <td>${role.roleId}</td>
                <td>${role.role}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/role/edit/${role.id}">Edit</a>
                    <a href="${pageContext.request.contextPath}/role/delete/${role.id}" 
                       onclick="return confirm('Are you sure you want to delete this role?')">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
    