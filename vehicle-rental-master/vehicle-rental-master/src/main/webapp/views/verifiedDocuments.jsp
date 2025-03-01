<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Verify User Documents</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f3e5f5; /* Light Lavender/Violet background */
            color: #333; /* Dark text for contrast */
            padding: 2rem;
            margin: 0;
        }

        .container {
            background: #ffffff; /* White container */
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1); /* Soft shadow */
            max-width: 800px;
            margin: 0 auto;
        }

        h2 {
            font-size: 24px;
            font-weight: 600;
            color: #512da8; /* Deep Violet heading */
            margin-bottom: 1.5rem;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 1.5rem;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #673ab7; /* Violet header */
            color: #fff;
        }

        tr:hover {
            background-color: #f5f5f5; /* Light gray hover */
        }

        .verify-btn {
            padding: 8px 12px;
            font-size: 14px;
            font-weight: 500;
            color: #fff;
            background: linear-gradient(135deg, #673ab7, #512da8); /* Violet gradient */
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .verify-btn:hover {
            background: linear-gradient(135deg, #512da8, #4527a0); /* Darker Violet on hover */
        }

        .back-btn {
            display: inline-block;
            padding: 10px 15px;
            font-size: 14px;
            font-weight: 500;
            color: #fff;
            background: linear-gradient(135deg, #673ab7, #512da8); /* Violet gradient */
            border: none;
            border-radius: 8px;
            text-decoration: none;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .back-btn:hover {
            background: linear-gradient(135deg, #512da8, #4527a0); /* Darker Violet on hover */
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Verify User Documents</h2>
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Driver's License</th>
                    <th>Aadhar</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td>${user.name}</td>
                        <td>${user.email}</td>
                        <td>
                            <c:choose>
                                <c:when test="${user.driverLicenseVerified}">
                                    <span style="color: green;">Verified</span>
                                </c:when>
                                <c:otherwise>
                                    <span style="color: red;">Not Verified</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${user.aadharVerified}">
                                    <span style="color: green;">Verified</span>
                                </c:when>
                                <c:otherwise>
                                    <span style="color: red;">Not Verified</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <form action="${pageContext.request.contextPath}/admin/verify-document" method="post">
                                <input type="hidden" name="userId" value="${user.id}">
                                <button type="submit" class="verify-btn">Verify</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="${pageContext.request.contextPath}/admin/home" class="back-btn">Back to Admin Home</a>
    </div>
</body>
</html>