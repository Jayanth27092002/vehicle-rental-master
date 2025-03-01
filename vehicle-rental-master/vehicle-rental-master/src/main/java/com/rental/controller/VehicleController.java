package com.rental.controller;
import com.rental.entity.Location;
import com.rental.entity.User;
import com.rental.entity.Vehicle;
import com.rental.service.LocationService;
import com.rental.service.VehicleService;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;
 
@Controller
@RequestMapping("/vehicle")
public class VehicleController {
 
    @Autowired
    private VehicleService vehicleService;
    
    @Autowired
    private LocationService locationService;
 
    // Display all vehicles
    @GetMapping("/list")
    public String listVehicles(Model model,HttpSession session) {
    	User adminUser = (User) session.getAttribute("adminUser");
        if (adminUser == null) {
            return "redirect:/admin/login"; // Redirect to login if user is not logged in
        }
        List<Vehicle> vehicles = vehicleService.getAllVehicles();
        model.addAttribute("vehicles", vehicles);
        return "vehicle-list";
    }
 
    // Show form for creating a new vehicle
    @GetMapping("/create")
    public String createVehicleForm(Model model,HttpSession session) {
    	User adminUser = (User) session.getAttribute("adminUser");
        if (adminUser == null) {
            return "redirect:/admin/login"; // Redirect to login if user is not logged in
        }
        model.addAttribute("vehicle", new Vehicle());
        return "vehicle-form";
    }
 
    // Save or update a vehicle
    @PostMapping("/save")
    public String saveVehicle(
        @RequestParam("id") String id,
        @RequestParam("vehicleType") String vehicleType,
        @RequestParam("vehicleName") String vehicleName,
        @RequestParam(value = "vehicleStatus", required = false, defaultValue = "Available") String vehicleStatus,
        @RequestParam(value = "vehicleImage", required = false, defaultValue = "default.jpg") String vehicleImage,
        @RequestParam("rentalPrice") float rentalPrice,
        @RequestParam("locationId") String locationId,
        HttpSession session) {

        
        User adminUser = (User) session.getAttribute("adminUser");
        if (adminUser == null) {
            return "redirect:/admin/login"; // Redirect if not logged in
        }

        
        Optional<Location> location = locationService.getLocationById(locationId);
        if (location.get() == null) {
            return "redirect:/vehicle/form?error=LocationNotFound"; // Error if location does not exist
        }

        Location loc=location.get();
        // Create new Vehicle object
        Vehicle vehicle = new Vehicle();
        vehicle.setId(id); // Use provided ID
        vehicle.setVehicleType(vehicleType);
        vehicle.setVehicleName(vehicleName);
        vehicle.setVehicleStatus(vehicleStatus);
        vehicle.setVehicleImage(vehicleImage);
        vehicle.setRentalPrice(rentalPrice);
        vehicle.setLocation(loc);
        vehicle.setCreatedAt(new Timestamp(System.currentTimeMillis())); // Set created timestamp

        // Save the vehicle
        vehicleService.saveVehicle(vehicle);

        return "redirect:/vehicle/list"; // Redirect after successful save
    }

    // Edit vehicle
    @GetMapping("/edit/{id}")
    public String editVehicle(@PathVariable("id") String id, Model model,HttpSession session) {
    	User adminUser = (User) session.getAttribute("adminUser");
        if (adminUser == null) {
            return "redirect:/admin/login"; // Redirect to login if user is not logged in
        }
        Optional<Vehicle> vehicle = vehicleService.getVehicleById(id);
        if (vehicle.isPresent()) {
            model.addAttribute("vehicle", vehicle.get());
            return "vehicle-form";
        } else {
            return "error";  // Add a user-friendly error page
        }
    }
 
    // Delete vehicle
    @GetMapping("/delete/{id}")
    public String deleteVehicle(@PathVariable("id") String id) {
        vehicleService.deleteVehicleById(id);
        return "redirect:/vehicle/list";
    }
}