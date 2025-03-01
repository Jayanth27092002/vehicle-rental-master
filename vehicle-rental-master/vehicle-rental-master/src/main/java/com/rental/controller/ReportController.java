package com.rental.controller;
import com.rental.entity.Report;
import com.rental.entity.User;
import com.rental.repository.BookingRepository;
import com.rental.service.ReportService;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.io.ByteArrayInputStream;
import java.util.List;
@SuppressWarnings("unused")
@Controller
@RequestMapping("/reports")
public class ReportController {
    @Autowired
    private ReportService reportService;
    
    @Autowired
    private BookingRepository bookingRepo;

    // Display all reports
    @GetMapping("/all")
    public String listAllReports(Model model,HttpSession session) {
    	User adminUser = (User) session.getAttribute("adminUser");
        if (adminUser == null) {
            return "redirect:/admin/login"; // Redirect to login if user is not logged in
        }
        List<Object []> reports = bookingRepo.findRentalReport();
        model.addAttribute("rentalReports", reports);
        return "reportList";
    }

    // Optionally add a method to create a new report
}
