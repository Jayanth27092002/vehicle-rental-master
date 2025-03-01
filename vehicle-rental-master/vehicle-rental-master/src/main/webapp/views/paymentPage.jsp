<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Payment Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');
 
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #e0f7fa, #f3e5f5);
            color: #1a1a2e;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
 
        .container {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            background: #ffffff;
            padding: 2.5rem;
            border-radius: 12px;
            width: 90%;
            max-width: 1000px;
            gap: 2rem;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
        }
 
        .payment-section, .booking-section {
            width: 48%;
        }
 
        h2 {
            font-size: 22px;
            font-weight: 600;
            color: #1a1a2e;
            margin-bottom: 15px;
        }
 
        .payment-method {
            margin-bottom: 1.5rem;
            display: flex;
            gap: 1rem;
            align-items: center;
        }
 
        .payment-method label {
            font-weight: 500;
            color: #1a1a2e;
        }
 
        .card-details, .wallet-details {
            display: none;
            margin-top: 1rem;
        }
 
        input[type="text"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ce93d8;
            border-radius: 8px;
            background: #ffffff;
            color: #1a1a2e;
        }
 
        button[type="submit"] {
            padding: 12px;
            width: 100%;
            font-size: 14px;
            font-weight: 500;
            color: #ffffff;
            background: linear-gradient(135deg, #9c27b0, #6a1b9a);
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: transform 0.2s ease, background 0.3s ease;
            margin-top: 15px;
        }
 
        button[type="submit"]:hover {
            background: linear-gradient(135deg, #6a1b9a, #4a148c);
            transform: scale(1.05);
        }
 
        .booking-details {
            background: #f3e5f5;
            padding: 1rem;
            border-radius: 8px;
        }
 
        .booking-details p {
            margin: 0.5rem 0;
            color: #1a1a2e;
        }
        .error {
        color: red;}
</style>
    <script>
    
        function showPaymentMethod(method) {
            if (method === 'card') {
                document.getElementById('card-details').style.display = 'block';
                document.getElementById('wallet-details').style.display = 'none';
            } else if (method === 'wallet') {
                document.getElementById('wallet-details').style.display = 'block';
                document.getElementById('card-details').style.display = 'none';
            }
        }
        
        // Real-time validation for card number
        function validateCardNumber() {
            const cardNumber = document.getElementById("cardNumber").value;
            const cardNumberError = document.getElementById("cardNumberError");
            if (!/^\d{16}$/.test(cardNumber)) {
                cardNumberError.textContent = "Invalid card number. Must be 16 digits.";
                return false;
            } else {
                cardNumberError.textContent = "";
                return true;
            }
        }
 
        // Real-time validation for expiry date
        function validateExpiryDate() {
            const expiryDate = document.getElementById("expiryDate").value;
            const expiryDateError = document.getElementById("expiryDateError");
            if (!/^\d{2}\/\d{2}$/.test(expiryDate)) {
                expiryDateError.textContent = "Invalid expiry date. Must be in MM/YY format.";
                return false;
            } else {
                expiryDateError.textContent = "";
                return true;
            }
        }
 
        // Real-time validation for CVV
        function validateCVV() {
            const cvv = document.getElementById("cvv").value;
            const cvvError = document.getElementById("cvvError");
            if (!/^\d{3}$/.test(cvv)) {
                cvvError.textContent = "Invalid CVV. Must be 3 digits.";
                return false;
            } else {
                cvvError.textContent = "";
                return true;
            }
        }
 
        // Card validation script
        function validateForm(event) {
            if (!validateCardNumber() || !validateExpiryDate() || !validateCVV()) {
                event.preventDefault(); // Prevent form submission if validation fails
                return false;
            }
            return true;
        }
 
        // Attach event listeners for input validation
        window.addEventListener('load', () => {
            document.getElementById("cardNumber").addEventListener("input", validateCardNumber);
            document.getElementById("expiryDate").addEventListener("input", validateExpiryDate);
            document.getElementById("cvv").addEventListener("input", validateCVV);
        });
    </script>
</head>
<body>
    <div class="container">
        <!-- Payment Section -->
        <div class="payment-section">
            <h2>Payment Options</h2>
 
            <!-- Payment Method Selection -->
            <div class="payment-method">
                <label>
                    <input type="radio" name="paymentMethod" value="card" onclick="showPaymentMethod('card')">
                    Pay with Card
                </label>
                <label>
                    <input type="radio" name="paymentMethod" value="wallet" onclick="showPaymentMethod('wallet')">
                    Pay with Wallet
                </label>
            </div>
 
            <!-- Card Payment Details -->
            <div id="card-details" class="card-details">
    <input type="text" id="cardNumber" name="cardNumber" placeholder="Card Number" required>
     <div id="cardNumberError" class="error"></div>
    <input type="text" id="expiryDate" name="expiryDate" placeholder="Expiry Date (MM/YY)" required>
     <div id="expiryDateError" class="error"></div>
     <input type="text" id="cvv" name="cvv" placeholder="CVV" required>
     <div id="cvvError" class="error"></div>
</div>
            <!-- Wallet Payment Details -->
            <div id="wallet-details" class="wallet-details">
                <p>Your Current Balance: $${user.balance}</p>
                <p>Amount to Transfer: $${totalCost}</p>
                
            </div>
 
            <!-- Error Message -->
            <c:if test="${not empty error}">
                <div class="error">${error}</div>
            </c:if>
 
            <!-- Submit Button -->
            <form action="${pageContext.request.contextPath}/payment/process" method="post">
                <input type="hidden" name="vehicleId" value="${vehicle.id}">
                <input type="hidden" name="duration" value="${duration}">
                <input type="hidden" name="BookingDateTime" value="${BookingDateTime}">
                <input type="hidden" name="paymentMode" id="paymentMode" value="">
                <button type="submit" style="padding: 10px 16px; font-size: 14px; font-weight: 500; color: #ffffff; background: linear-gradient(135deg, #ff4b5c, #d33f49); border: none; border-radius: 8px; cursor: pointer;">
                    Confirm Payment
                </button>
            </form>
        </div>
 
        <!-- Booking Section -->
        <div class="booking-section">
            <h2>Booking Details</h2>
            <div class="booking-details">
                <p><strong>Vehicle:</strong> ${vehicle.vehicleName}</p>
                <p><strong>Type:</strong> ${vehicle.vehicleType}</p>
                <p><strong>Duration:</strong> ${duration} hours</p>
                <p><strong>Total Cost:</strong> $${totalCost}</p>
                <p><strong>User:</strong> ${user.name}</p>
                <p><strong>Email:</strong> ${user.email}</p>
            </div>
        </div>
    </div>
 
    <script>
    function processWalletPayment() {
        const paymentModeInput = document.getElementById('paymentMode');
        paymentModeInput.value = 'wallet';
    }
 
    document.querySelector('form').addEventListener('submit', function (e) {
        const paymentMethod = document.querySelector('input[name="paymentMethod"]:checked');
        if (!paymentMethod) {
            e.preventDefault();
            alert('Please select a payment method.');
        } else {
            const paymentModeInput = document.getElementById('paymentMode');
            paymentModeInput.value = paymentMethod.value;
        }
    });
    </script>
</body>
</html>