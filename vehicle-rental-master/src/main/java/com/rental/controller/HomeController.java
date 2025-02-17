package com.rental.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rental.entity.Booking;
import com.rental.entity.Location;
import com.rental.entity.User;
import com.rental.entity.Vehicle;
import com.rental.service.BookingService;
import com.rental.service.LocationService;
import com.rental.service.UserService;
import com.rental.service.VehicleService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/home")
public class HomeController {

    @Autowired
    private LocationService locationService;
    
    
    @Autowired
    private BookingService bookingService;

    @Autowired
    private VehicleService vehicleService;

    @Autowired
    private UserService userService;

    // Display home page
    @GetMapping
    public String home(Model model, HttpSession session) {
        List<Location> locations = locationService.getAllLocations();
        model.addAttribute("locations", locations);
        
        // Keep user session
        User loggedInUser = (User) session.getAttribute("user");
        if (loggedInUser != null) {
            model.addAttribute("user", loggedInUser);
        }

        model.addAttribute("showSearch", true); // Show search form initially
        return "userHome";
    }
    
    @GetMapping("/bookings")
    public String getUserBookings(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/user/login"; // Redirect to login if user is not logged in
        }

        List<Booking> bookings = bookingService.getBookingsByUser(user);
        model.addAttribute("bookings", bookings);
        return "userBookings"; // Return the view name for displaying bookings
    }

    // Search for available vehicles
    @PostMapping("/search")
    public String searchVehicles(
        @RequestParam String locationId,
        @RequestParam String bookingDate,
        @RequestParam int duration,
        Model model, HttpSession session
    ) {
        List<Vehicle> vehicles = vehicleService.getVehiclesByLocationAndStatus(locationId, "available");
        model.addAttribute("vehicles", vehicles);
        
        // Retain user info
        User loggedInUser = (User) session.getAttribute("user");
        if (loggedInUser != null) {
            model.addAttribute("user", loggedInUser);
        }

        model.addAttribute("showSearch", false); // Hide search form after search
        return "userHome";
    }
    
    @GetMapping("/profile")
    public String showProfileForm(Model model, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("user");
        if (loggedInUser != null) {
            model.addAttribute("user", loggedInUser);
            return "userProfile"; // Return the profile view
        } else {
            return "redirect:/user/login"; // Redirect to login if no user is logged in
        }
    }

    // Update profile
    @PostMapping("/profile")
    public String updateProfile(@ModelAttribute User user, Model model, HttpSession session) {
        try {
            // Ensure the ID is set from the session or the form
            User loggedInUser = (User) session.getAttribute("user");
            if (loggedInUser != null) {
                user.setId(loggedInUser.getId()); // Set the ID from the session
            }

            User updatedUser = userService.updateUser(user);
            session.setAttribute("user", updatedUser); // Update session with new user data
            model.addAttribute("success", "Profile updated successfully!");
            return "userProfile";
        } catch (IllegalArgumentException e) {
            model.addAttribute("error", e.getMessage()); // Show validation errors
            model.addAttribute("user", user); // Retain user input
            return "userProfile";
        }
    }
}
