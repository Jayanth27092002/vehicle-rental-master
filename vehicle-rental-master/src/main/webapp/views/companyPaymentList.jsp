<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Company Payments</title>
</head>
<body>
    <h2>All Company Payments</h2>
    <table border="1">
        <tr>
            <th>Payment ID</th>
            <th>User ID</th>
            <th>Amount Received</th>
            <th>Payment Status</th>
            <th>Balance</th>
        </tr>
        <c:forEach items="${companyPayments}" var="payment">
            <tr>
                <td>${payment.paymentId}</td>
                <td>${payment.userId}</td>
                <td>${payment.amountReceived}</td>
                <td>${payment.paymentStatus}</td>
                <td>${payment.balance}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>