<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Refund Requests</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
    body {
        font-family: 'Poppins', sans-serif;
        background-color: #f3e5f5; /* Light Lavender/Violet background */
        color: #333; /* Dark text for contrast */
        padding: 2rem;
    }
 
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 1rem;
    }
 
    th,
    td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #ce93d8; /* Light Lavender border */
    }
 
    th {
        background-color: #f8f0ff; /* Very light Lavender for header */
        color: #512da8; /* Deep Violet header text */
    }
 
    tr:hover {
        background-color: #f5f0ff; /* Very light lavender on hover */
    }
 
    .refund-button {
        padding: 8px 16px;
        font-size: 14px;
        font-weight: 500;
        color: #ffffff;
        background: linear-gradient(135deg, #673ab7, #512da8); /* Violet gradient */
        border: none;
        border-radius: 8px;
        cursor: pointer;
    }
 
    .refund-button:hover {
        background: linear-gradient(135deg, #512da8, #4527a0); /* Darker Violet on hover */
    }
 
    /* Style for success message */
    .success-message {
        display: none;
        background-color: #673ab7; /* Violet success message background */
        color: white;
        padding: 10px;
        margin-top: 10px;
        border-radius: 5px;
        text-align: center;
    }
</style>
 
    <script>
        function showSuccessMessage(event, form) {
            event.preventDefault(); // Prevent form submission
            
            // Show success message
            let messageDiv = document.getElementById("successMessage");
            messageDiv.style.display = "block";
            messageDiv.innerText = "Refund successful!";
            
            // Hide the message after 2 seconds and submit the form
            setTimeout(() => {
                form.submit();
            }, 2000);
        }
    </script>
</head>
<body>
    <h1>Refund Requests</h1>
 
    <!-- Success Message -->
    <div id="successMessage" class="success-message"></div>
 
    <table>
        <thead>
            <tr>
                <th>User ID</th>
                <th>Payment Status</th>
                <th>Payment Amount</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="payment" items="${refundPayments}">
                <tr>
                    <td>${payment.payer.id}</td>
                    <td>${payment.paymentStatus}</td>
                    <td>$${payment.paymentAmount}</td>
                    <td>
                        <form action="${pageContext.request.contextPath}/refund" method="post" style="display: inline;" onsubmit="showSuccessMessage(event, this)">
                            <input type="hidden" name="paymentId" value="${payment.id}">
                            <button type="submit" class="refund-button">Refund</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>