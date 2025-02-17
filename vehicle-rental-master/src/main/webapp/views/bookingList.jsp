<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Bookings</title>
</head>
<body>
    <h2>All Bookings</h2>
    <table border="1">
        <tr>
            <th>Booking ID</th>
            <th>User ID</th>
            <th>Vehicle ID</th>
            <th>Booking Price</th>
            <th>Duration</th>
            <th>Booking Time</th>
            <th>Status</th>
        </tr>
        <c:forEach items="${bookings}" var="booking">
            <tr>
                <td>${booking.id}</td>
                <td>${booking.userId}</td>
                <td>${booking.vehicleId}</td>
                <td>${booking.bookingPrice}</td>
                <td>${booking.duration}</td>
                <td>${booking.bookingTime}</td>
                <td>${booking.bookingStatus}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>