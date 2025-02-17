package com.rental.controller;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

import com.rental.entity.Payment;
import com.rental.entity.User;
import com.rental.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
@SuppressWarnings("unused")
@Controller

public class CompanyPaymentController {
	 @Autowired
	    private PaymentService paymentService;
	 @Autowired
	 private UserService userService;
	 
	 @Autowired
	 private NotificationService emailService;

	    // Fetch and display payments with status "forrefund"
	    @GetMapping("/refunds")
	    public String showRefunds(Model model) {
	        List<Payment> refundPayments = paymentService.findByPaymentStatus("forrefund");
	        model.addAttribute("refundPayments", refundPayments);
	        return "refundPage"; // Refund page JSP
	    }

	    // Handle refund action
	    @PostMapping("/refund")
	    public String processRefund(@RequestParam String paymentId, RedirectAttributes redirectAttributes) {
	        // Fetch the payment by ID
	        Payment payment = paymentService.findById(paymentId);
	        if (payment == null) {
	            redirectAttributes.addFlashAttribute("error", "Payment not found");
	            return "redirect:/refunds";
	        }

	        // Fetch the user (payer) and admin
	        User user = payment.getPayer();
	        User admin = userService.findByRole("admin");

	        if (admin == null) {
	            redirectAttributes.addFlashAttribute("error", "Admin not found");
	            return "redirect:/refunds";
	        }

	        double refundAmount = payment.getPaymentAmount();

	        // Transfer refund amount from admin to user
	        user.setBalance((float) (user.getBalance() + refundAmount*0.90));
	        admin.setBalance((float) (admin.getBalance() - refundAmount*0.90));

	        // Save updated balances
	        userService.saveUser(user);
	        userService.saveUser(admin);
	        
	        
	       
			emailService.sendEmail(user.getEmail(),"Refund mail", "Your amount has been refunded :"+refundAmount*0.90);

	        // Update payment status to "refunded"
	        paymentService.updatePaymentStatus(paymentId, "refunded");

	        redirectAttributes.addFlashAttribute("success", "Refund processed successfully.");
	        return "redirect:/refunds"; // Redirect back to the refunds page
	    }
	}
	

