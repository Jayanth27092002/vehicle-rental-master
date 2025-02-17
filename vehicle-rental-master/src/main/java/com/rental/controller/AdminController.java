package com.rental.controller;
 
import com.rental.entity.User;
import com.rental.service.AdminService;
 
import jakarta.servlet.http.HttpSession;
 
import java.util.Optional;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
 
@Controller
@RequestMapping("/admin")
public class AdminController {
 
    @Autowired
    private AdminService adminService;
 
    // Show admin login page
    @GetMapping("/login")
    public String showAdminLoginForm() {
        return "adminLogin";
    }
 
    // Process admin login
    @PostMapping("/login")
    public String loginAdmin(@RequestParam String email, @RequestParam String password, Model model,HttpSession session) {
        try {
            Optional<User> admin = adminService.loginAdmin(email, password);
            if (admin.isPresent()) {
            	session.setAttribute("adminUser", admin.get());
                model.addAttribute("admin", admin.get());
                return "adminHome"; // Redirect to admin home page on successful login
            } else {
                model.addAttribute("error", "Invalid admin credentials"); // Show error on the same page
                return "adminLogin"; // Stay on the admin login page
            }
        } catch (IllegalArgumentException e) {
            model.addAttribute("error", e.getMessage()); // Show validation errors
            return "adminLogin"; // Stay on the admin login page
        }
    }
// Handle logout
    @GetMapping("/logout")
    public String logoutAdmin(HttpSession session) {
        session.invalidate(); // Invalidate the session
        return "redirect:/"; // Redirect to the login page
    }
}