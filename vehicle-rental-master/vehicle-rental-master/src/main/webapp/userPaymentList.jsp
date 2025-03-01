<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Payments</title>
</head>
<body>
    <h2>User Payments</h2>
    <table border="1">
        <tr>
            <th>Payment ID</th>
            <th>Payment Amount</th>
            <th>Payment Mode</th>
            <th>Payment Status</th>
            <th>Payment Date</th>
        </tr>
        <c:forEach items="${payments}" var="payment">
            <tr>
                <td>${payment.id}</td>
                <td>${payment.paymentAmount}</td>
                <td>${payment.paymentMode}</td>
                <td>${payment.paymentStatus}</td>
                <td>${payment.paymentDate}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
    