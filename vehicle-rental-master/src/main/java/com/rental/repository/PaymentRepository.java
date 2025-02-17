package com.rental.repository;
import com.rental.entity.Payment;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PaymentRepository extends JpaRepository<Payment, String> {
    List<Payment> findByPayerId(String payerId);
    boolean existsByBooking_Vehicle_Id(String vehicleId);
    Payment findByBooking_Vehicle_Id(String vehicleId);
    List<Payment> findByPaymentStatus(String status);;
}
