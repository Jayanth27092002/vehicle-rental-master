package com.rental.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.*;
 
import com.rental.service.NotificationService;
 
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
@RestController
@RequestMapping("/notifications")
public class NotificationController {
 
    @Autowired
    private NotificationService emailNotificationService;
 
    @PostMapping("/booking")
    public String sendBookingEmail(@RequestParam String email, @RequestParam String name, @RequestParam String details) {
        emailNotificationService.sendBookingConfirmation(email, name, details);
        return "Booking confirmation email sent successfully!";
    }
 
    @PostMapping("/payment")
    public String sendPaymentEmail(@RequestParam String email, @RequestParam String name, @RequestParam double amount) {
        emailNotificationService.sendPaymentSuccess(email, name, amount);
        return "Payment success email sent successfully!";
    }
 
    @PostMapping("/send-otp")
    public String sendOtp(@RequestParam String email) {
        emailNotificationService.sendOtp(email);
        return "OTP sent successfully!";
    }
 
    @PostMapping("/verify-otp")
    public String verifyOtp(@RequestParam String email, @RequestParam String otp) {
        boolean isValid = emailNotificationService.verifyOtp(email, otp);
        return isValid ? "OTP verified successfully!" : "Invalid OTP.";
    }
}