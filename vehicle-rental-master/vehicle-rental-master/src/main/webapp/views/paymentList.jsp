<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Payments</title>
</head>
<body>
    <h2>All Payments</h2>
    <table border="1">
        <tr>
            <th>Payment ID</th>
            <th>Payer ID</th>
            <th>Payment Amount</th>
            <th>Payment Mode</th>
            <th>Payment Status</th>
            <th>Payment Date</th>
        </tr>
        <c:forEach items="${payments}" var="payment">
            <tr>
                <td>${payment.id}</td>
                <td>${payment.payerId}</td>
                <td>${payment.paymentAmount}</td>
                <td>${payment.paymentMode}</td>
                <td>${payment.paymentStatus}</td>
                <td>${payment.paymentDate}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>