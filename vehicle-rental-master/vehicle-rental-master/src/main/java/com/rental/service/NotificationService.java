package com.rental.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.*;
 
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
 
@Service
public class NotificationService {
 
    @Autowired
    private JavaMailSender mailSender;
 
    private final String FROM_EMAIL = "capstoneag426@gmail.com"; // Replace with your email
    private final Map<String, String> otpStorage = new HashMap<>();
    private final Random random = new Random();
 
    public void sendBookingConfirmation(String toEmail, String userName, String bookingDetails) {
        String subject = "Booking Confirmation - Vehicle Rental";
        String message = "<h3>Dear " + userName + ",</h3>" +
                         "<p>Your booking has been confirmed successfully.</p>" +
                         "<p>Details: " + bookingDetails + "</p>" +
                         "<p>Thank you for choosing us!</p>";
        sendEmail(toEmail, subject, message);
    }
 
    public void sendPaymentSuccess(String toEmail, String userName, double amount) {
        String subject = "Payment Successful - Vehicle Rental";
        String message = "<h3>Dear " + userName + ",</h3>" +
                         "<p>Your payment of $" + amount + " has been received successfully.</p>" +
                         "<p>Thank you for your payment.</p>";
        sendEmail(toEmail, subject, message);
    }
 
    public void sendOtp(String toEmail) {
        String otp = String.format("%06d", random.nextInt(1000000));
        otpStorage.put(toEmail, otp);
        
        String subject = "Your OTP Code";
        String message = "<h3>Dear User,</h3>" +
                         "<p>Your OTP code is: <strong>" + otp + "</strong></p>" +
                         "<p>Use this code to complete your process. It is valid for a short time.</p>";
        sendEmail(toEmail, subject, message);
    }
    public void sendRegistrationEmail(String toEmail, String userId, String userName, String password) {
        String subject = "Welcome to Vehicle Rental System!";
        
        String message = "<h3>Dear " + userName + ",</h3>"
                + "<p>Welcome to <b>EasyDrives</b>! We are excited to have you on board.</p>"
                + "<p><b>User ID:</b> " + userId + "</p>"
                + "<p><b>Password:</b> " + password + "</p>"
                + "<p>For security reasons, we recommend changing your password after your first login.</p>"
                + "<p>You can now log in and start booking vehicles effortlessly.</p>"
                + "<p>If you have any questions, feel free to reach out to our support team.</p>"
                + "<p>Thank you for choosing <b>EasyDrives</b>!</p>"
                + "<p>Best Regards,<br>Vehicle Rental Team</p>";
 
 
        sendEmail(toEmail, subject, message);
    }
 
    public boolean verifyOtp(String toEmail, String otp) {
        return otpStorage.containsKey(toEmail) && otpStorage.get(toEmail).equals(otp);
    }
 
    public void sendEmail(String toEmail, String subject, String message) {
        try {
            MimeMessage mimeMessage = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
            helper.setFrom(FROM_EMAIL);
            helper.setTo(toEmail);
            helper.setSubject(subject);
            helper.setText(message, true);
            mailSender.send(mimeMessage);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
    
    public void sendCancellationConfirmation(String email, String userName, String bookingId) {
        String subject = "Booking Cancellation Confirmation";
        String body = "Dear " + userName + ",\n\n" +
                "Your booking (ID: " + bookingId + ") has been cancelled. Refund is pending.\n\n" +
                "Thank you for using our service.";
        sendEmail(email, subject, body);
    }
}
 