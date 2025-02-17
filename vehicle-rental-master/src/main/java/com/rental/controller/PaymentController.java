package com.rental.controller;
 
import com.rental.entity.*;
import com.rental.service.BookingService;
import com.rental.service.NotificationService;
import com.rental.service.PaymentService;
import com.rental.service.VehicleService;
import com.rental.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
 
import java.sql.Timestamp;
import java.util.UUID;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
 
@Controller
@RequestMapping("/payment")
public class PaymentController {
 
    @Autowired
    private BookingService bookingService;
 
    @Autowired
    private PaymentService paymentService;
 
    @Autowired
    private VehicleService vehicleService;
 
    @Autowired
    private UserService userService;
    
    @Autowired
    private NotificationService emailService;
 
    // Show payment page
    @GetMapping
    public String showPaymentPage(
            @RequestParam String vehicleId,
            @RequestParam double duration,
            HttpSession session,
            Model model
    ) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/user/login"; // Redirect to login if user is not logged in
        }
 
        Vehicle vehicle = vehicleService.getVehicleById(vehicleId)
                .orElseThrow(() -> new IllegalArgumentException("Vehicle not found"));
 
        double totalCost = vehicle.getRentalPrice() * duration;
 
        model.addAttribute("vehicle", vehicle);
        model.addAttribute("duration", duration);
        model.addAttribute("user", user);
        model.addAttribute("totalCost", totalCost);
 
        return "paymentPage"; // Render the payment page
    }
    
    // Show payment success page
    @GetMapping("/success")
    public String showPaymentSuccessPage(Model model) {
        // Retrieve booking and payment details from flash attributes
        Booking booking = (Booking) model.getAttribute("booking");
        Payment payment = (Payment) model.getAttribute("payment");
 
//        if (booking == null || payment == null) {
//            return "redirect:/home"; // Redirect to home if no booking/payment details are found
//        }
 
        model.addAttribute("booking", booking);
        model.addAttribute("payment", payment);
 
        return "paymentSuccess"; // Render the paymentSuccess.jsp page
    }
 
    // Process payment
    @PostMapping("/process")
    public String processPayment(
            @RequestParam String vehicleId,
            @RequestParam double duration,
            @RequestParam String paymentMode,
            @RequestParam(required = false) String cardNumber,
            @RequestParam(required = false) String expiryDate,
            @RequestParam(required = false) String cvv,
            HttpSession session,
            RedirectAttributes redirectAttributes // Use RedirectAttributes to pass data to the redirected page
    ) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/user/login"; // Redirect to login if user is not logged in
        }
 
        Vehicle vehicle = vehicleService.getVehicleById(vehicleId)
                .orElseThrow(() -> new IllegalArgumentException("Vehicle not found"));
 
        double totalCost = vehicle.getRentalPrice() * duration;
 
        // Process payment based on the selected mode
        boolean paymentSuccess = false;
        System.out.println("Card Number: " + cardNumber);
        System.out.println("Expiry Date: " + expiryDate);
        System.out.println("CVV: " + cvv);
 
        if ("wallet".equals(paymentMode)) {
            paymentSuccess = processWalletPayment(user, totalCost, vehicleId, duration, redirectAttributes);
        } else if ("card".equals(paymentMode)) {
        	
        	 paymentSuccess=true;
            // Mocking payment success (you can implement a real payment gateway here)
            
        }
 
        // If payment is successful, create and save booking and payment
        if (paymentSuccess) {
            // Create and save payment entry
            Payment payment = new Payment();
            payment.setId(UUID.randomUUID().toString());
            payment.setPayer(user);
            payment.setPaymentAmount(totalCost);
            payment.setPaymentMode(paymentMode);
            payment.setPaymentStatus("Completed");
            payment.setPaymentDate(new Timestamp(System.currentTimeMillis()));
            paymentService.savePayment(payment);
 
            // Create booking entry
            Booking booking = new Booking();
            booking.setId(UUID.randomUUID().toString());
            booking.setUser(user);
            booking.setVehicle(vehicle);
            booking.setBookingTime(new Timestamp(System.currentTimeMillis()));
            booking.setBookingPrice((float) totalCost);
            booking.setDuration(duration);
            booking.setCreatedAt(new Timestamp(System.currentTimeMillis()));
            booking.setBookingStatus("Confirmed");
            booking.setPayment(payment); // Link payment to booking
 
            // Save the booking
            bookingService.saveBooking(booking);
            
            // Update vehicle status to "booked"
            vehicle.setVehicleStatus("booked");
            vehicleService.saveVehicle(vehicle);
            
            emailService.sendPaymentSuccess(user.getEmail(), user.getName(), totalCost);
            emailService.sendBookingConfirmation(user.getEmail(), user.getName(), booking.toString());
            
          
 
            // Schedule vehicle status update after booking duration
            scheduleVehicleStatusUpdate(vehicle.getId(), duration);
 
            // Add booking details to RedirectAttributes
            redirectAttributes.addFlashAttribute("booking", booking);
            redirectAttributes.addFlashAttribute("payment", payment);
 
            // Redirect to the payment success page
            return "redirect:/payment/success";
        } else {
            // If payment failed (wallet or card), show error
            redirectAttributes.addFlashAttribute("error", "Payment failed. Please try again.");
            return "redirect:/payment?vehicleId=" + vehicleId + "&duration=" + duration; // Redirect to the same payment page
        }
    }
    
    private boolean processWalletPayment(User user, double totalCost, String vehicleId, double duration,
			RedirectAttributes redirectAttributes) {
    	if (user.getBalance() < totalCost) {
            redirectAttributes.addFlashAttribute("error", "Insufficient funds in wallet");
            return false;
        }
 
        // Deduct from user's wallet
        user.setBalance((float) (user.getBalance() - totalCost));
        userService.saveUser(user);
 
        // Transfer funds to admin
        User admin = userService.findByRole("admin");
        if (admin != null) {
            admin.setBalance((float) (admin.getBalance() + totalCost));
            userService.saveUser(admin);
            return true;
        } else {
            redirectAttributes.addFlashAttribute("error", "Admin not found");
            return false;
        }
	}
    
    
    @PostMapping("/cancel")
    public String cancelBooking(
            @RequestParam String bookingId,
            HttpSession session,
            RedirectAttributes redirectAttributes
    ) {
        // Get the logged-in user from the session
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/user/login"; // Redirect to login if user is not logged in
        }
 
        // Retrieve the booking by ID
        Booking booking = bookingService.getBookingById(bookingId);
        if (booking == null) {
            throw new IllegalArgumentException("Booking not found");
        }
 
        // Ensure the logged-in user is the one who made the booking
        if (!booking.getUser().getId().equals(user.getId())) {
            redirectAttributes.addFlashAttribute("error", "You are not authorized to cancel this booking.");
            return "redirect:/home";
        }
 
        // Retrieve the vehicle associated with the booking
        Vehicle vehicle = booking.getVehicle();
 
        // Calculate the refund amount (5% fee deducted)
        double refundAmount = booking.getBookingPrice() * 0.95; // 95% of the booking price after 5% fee
 
     
 
        // Update the vehicle status to "available"
        vehicle.setVehicleStatus("available");
        vehicleService.saveVehicle(vehicle);
 
        // Optionally: Save the status of the booking as "Cancelled" (if required)
        booking.setBookingStatus("Cancelled");
        bookingService.saveBooking(booking);
        
        
        Payment payment = booking.getPayment();
        if (payment != null) {
            payment.setPaymentStatus("forrefund");
            paymentService.savePayment(payment);
        }
        
        
        emailService.sendEmail(user.getEmail(),"Cancellation mail", "Your booking has been cancelled");
 
        // Add success message and redirect to home or booking list
        redirectAttributes.addFlashAttribute("success", "Booking cancelled successfully. Refund processed.");
        return "redirect:/home"; // Or wherever you want to redirect
    }
	// Validate card details (mock implementation)
    private boolean isValidCardDetails(String cardNumber, String expiryDate, String cvv) {
        // Normalize card number: Remove spaces, dashes, etc.
        String normalizedCardNumber = cardNumber.replaceAll("[^0-9]", "");
        
        // Normalize CVV: Remove non-numeric characters
        String normalizedCvv = cvv.replaceAll("[^0-9]", "");

        // Validate card number (must be exactly 16 digits)
        boolean isCardNumberValid = normalizedCardNumber.length() == 16;

        // Validate expiry date (must be in MM/YY format)
        boolean isExpiryDateValid = expiryDate != null && expiryDate.matches("^(0[1-9]|1[0-2])/\\d{2}$");

        // Validate CVV (must be exactly 3 digits)
        boolean isCvvValid = normalizedCvv.length() == 3;

        // Return true only if all validations pass
        return isCardNumberValid && isExpiryDateValid && isCvvValid;
    }
 
    // Schedule vehicle status update after booking duration
    private void scheduleVehicleStatusUpdate(String vehicleId, double duration) {
        ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);
        scheduler.schedule(() -> {
            Vehicle vehicle = vehicleService.getVehicleById(vehicleId)
                    .orElseThrow(() -> new IllegalArgumentException("Vehicle not found"));
            vehicle.setVehicleStatus("available");
            vehicleService.saveVehicle(vehicle);
        }, (long) (duration * 60 * 60), TimeUnit.SECONDS); // Convert hours to seconds
    }
}
 
 
 