package com.rental.service;
import com.rental.entity.Payment;
import com.rental.repository.PaymentRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaymentService {

    @Autowired
    private PaymentRepository paymentRepository;

    // Fetch all payments
    public List<Payment> getAllPayments() {
        return paymentRepository.findAll();
    }
    
    // Fetch payment by ID
    public Payment findById(String paymentId) {
        return paymentRepository.findById(paymentId).orElse(null);
    }

    // Fetch payments by Payer ID
    public List<Payment> getPaymentsByPayerId(String payerId) {
        return paymentRepository.findByPayerId(payerId);
    }
    
    public boolean existsByBooking_Vehicle_Id(String vehicleId) {
        return paymentRepository.existsByBooking_Vehicle_Id(vehicleId);
    }

    public void savePayment(Payment payment) {
        paymentRepository.save(payment);
    }
    
    public Payment findByBooking_Vehicle_Id(String vehicleId) {
        return paymentRepository.findByBooking_Vehicle_Id(vehicleId);
    }
    
    public List<Payment> findByPaymentStatus(String status) {
        return paymentRepository.findByPaymentStatus(status);
    }

    // Update payment status
    public void updatePaymentStatus(String paymentId, String status) {
        Payment payment = paymentRepository.findById(paymentId).orElseThrow(() -> new RuntimeException("Payment not found"));
        payment.setPaymentStatus(status);
        paymentRepository.save(payment);
    }
}
