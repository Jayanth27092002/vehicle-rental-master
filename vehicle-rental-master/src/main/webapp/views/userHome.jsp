<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Home</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #e0f7fa, #f3e5f5); /* Sky blue to pastel violet */
            color: #1a1a2e;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 2rem;
            margin: 0;
        }

        .profile-icon {
            position: absolute;
            top: 20px;
            right: 20px;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: linear-gradient(135deg, #9c27b0, #6a1b9a); /* Violet gradient */
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            color: #fff;
            font-size: 20px;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1); /* Softer shadow */
        }

        .profile-icon:hover {
            background: linear-gradient(135deg, #6a1b9a, #4a148c); /* Darker violet hover */
        }

        .container {
            background: #ffffff; /* White container */
            padding: 2rem;
            border-radius: 12px;
            text-align: center;
            width: 90%;
            max-width: 600px;
            margin-bottom: 2rem;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
        }

        h2 {
            font-size: 22px;
            font-weight: 600;
            color: #1a1a2e;
            margin-bottom: 15px;
        }

        p {
            color: #1a1a2e;
        }

        .logout-btn, .choose-again-btn, .search-form button {
            padding: 12px 16px;
            font-size: 14px;
            font-weight: 600;
            color: #fff;
            background: linear-gradient(135deg, #9c27b0, #6a1b9a); /* Violet gradient */
            border: none;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
            margin-top: 10px;
            display: inline-block;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
        }

        .logout-btn:hover, .choose-again-btn:hover, .search-form button:hover {
            background: linear-gradient(135deg, #6a1b9a, #4a148c); /* Darker violet hover */
        }

        .search-form {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .search-form input, .search-form select {
            padding: 12px;
            font-size: 14px;
            border: 1px solid #ce93d8; /* Light violet border */
            border-radius: 8px;
            background: #fff;
            color: #333;
            outline: none;
            box-shadow: inset 2px 2px 5px rgba(0, 0, 0, 0.1);
        }
        .bookings-icon {
        position: absolute;
        top: 20px;
        left: 20px;
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background-color: #444;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        color: #ffffff;
        font-size: 20px;
    }
 
    .bookings-icon:hover {
        background-color: #666;
    }

        .vehicle-cards {
            display: flex;
            flex-wrap: wrap;
            gap: 1rem;
            justify-content: center;
        }

        .vehicle-card {
            background: #f3e5f5; /* Light pastel violet for cards */
            padding: 1rem;
            border-radius: 8px;
            text-align: center;
            width: 200px;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
        }

        .vehicle-card img {
            width: 100%;
            border-radius: 8px;
        }

        .vehicle-card h3 {
            color: #6a1b9a; /* Dark violet for headings */
            margin-top: 10px;
        }

        .vehicle-card p {
            color: #333;
            font-size: 14px;
        }

        .vehicle-card button {
            padding: 8px 12px;
            font-size: 14px;
            font-weight: 500;
            color: #fff;
            background: linear-gradient(135deg, #9c27b0, #6a1b9a); /* Violet gradient */
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }

        .vehicle-card button:hover {
            background: linear-gradient(135deg, #6a1b9a, #4a148c); /* Darker violet hover */
        }
    </style>
</head>
<body>
    <div class="profile-icon" onclick="window.location.href='${pageContext.request.contextPath}/home/profile'">
        <i class="fas fa-user"></i>
    </div>
    <div class="bookings-icon" onclick="window.location.href='${pageContext.request.contextPath}/home/bookings'">
    <i class="fas fa-calendar-alt"></i> <!-- Font Awesome icon for bookings -->
</div>

    <div class="container">
        <h2>Welcome, ${user.name}!</h2>
        <p>Email: ${user.email}</p>
        <a href="${pageContext.request.contextPath}/user/logout" class="logout-btn">Logout</a>
    </div>

    <c:if test="${showSearch}">
        <div class="container">
            <h2>Search Vehicles</h2>
            <form class="search-form" action="${pageContext.request.contextPath}/home/search" method="post">
                <select name="locationId" required>
                    <option value="">-- Select Location --</option>
                    <c:forEach var="location" items="${locations}">
                        <option value="${location.id}">${location.locationName}</option>
                    </c:forEach>
                </select>
                <input type="date" name="bookingDate" required>
                <input type="number" name="duration" placeholder="Duration (in hours)" min="1" required>
                <button type="submit">Search Vehicles</button>
            </form>
        </div>
    </c:if>

    <c:if test="${not showSearch}">
        <div class="container">
            <h2>Available Vehicles</h2>
            <div class="vehicle-cards">
                <c:forEach var="vehicle" items="${vehicles}">
                    <div class="vehicle-card">
                        <img src="${vehicle.vehicleImage}" alt="${vehicle.vehicleName}">
                        <h3>${vehicle.vehicleName}</h3>
                        <p>Type: ${vehicle.vehicleType}</p>
                        <p>Price: $${vehicle.rentalPrice}/hour</p>
                        <form action="${pageContext.request.contextPath}/bookings/payment" method="get">
                            <input type="hidden" name="vehicleId" value="${vehicle.id}">
                            <input type="hidden" name="duration" value="${param.duration}">
                            <button type="submit">Book Now</button>
                        </form>
                    </div>
                </c:forEach>
            </div>
            <a href="${pageContext.request.contextPath}/home" class="choose-again-btn">Choose Again</a>
        </div>
    </c:if>
</body>
</html>