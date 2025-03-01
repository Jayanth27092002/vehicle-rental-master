<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Booking Confirmation</title>
</head>
<body>
    <h2>Booking Confirmed!</h2>
    <p>Booking ID: ${booking.id}</p>
    <p>Vehicle: ${booking.vehicle.vehicleName}</p>
    <p>Total Cost: $${booking.bookingPrice}</p>
    <p>Status: ${booking.bookingStatus}</p>
</body>
</html>