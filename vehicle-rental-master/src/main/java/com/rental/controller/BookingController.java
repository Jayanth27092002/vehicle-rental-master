package com.rental.controller;
import com.rental.entity.Booking;
import com.rental.entity.Payment;
import com.rental.entity.User;
import com.rental.entity.Vehicle;
import com.rental.service.BookingService;
import com.rental.service.UserService;
import com.rental.service.VehicleService;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;
@Controller
@RequestMapping("/bookings")
public class BookingController {
	
    @Autowired
    private VehicleService vehicleService;
    
    @Autowired
    private BookingService bookingService;
    
    @Autowired
    private UserService userService;
    
    
    @GetMapping("/payment")
    public String showPaymentPage(
            @RequestParam String vehicleId,
            @RequestParam double duration,
            HttpSession session,
            Model model
    ) {
        // Get the logged-in user from the session
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/user/login"; // Redirect to login if user is not logged in
        }

        // Get the vehicle by ID
        Vehicle vehicle = vehicleService.getVehicleById(vehicleId)
                .orElseThrow(() -> new IllegalArgumentException("Vehicle not found"));

        // Add booking details to the model
        model.addAttribute("vehicle", vehicle);
        model.addAttribute("duration", duration);
        model.addAttribute("user", user);

        // Redirect to the payment page
        return "redirect:/payment?vehicleId=" + vehicleId + "&duration=" + duration;
    }
    
    @GetMapping
    public String listAllBookings(Model model) {
        List<Booking> bookings = bookingService.getAllBookings();
        model.addAttribute("bookings", bookings);
        return "bookingList";
    }

    @GetMapping("/user/{userId}")
    public String listUserBookings(@PathVariable String userId, Model model) {
        List<Booking> bookings = bookingService.getBookingsByUserId(userId);
        model.addAttribute("bookings", bookings);
        return "userBookingList";
    }
}
