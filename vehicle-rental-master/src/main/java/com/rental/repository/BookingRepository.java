package com.rental.repository;

import com.rental.entity.Booking;
import com.rental.entity.Report;
import com.rental.entity.User;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import java.util.List;
@Repository
public interface BookingRepository extends JpaRepository<Booking, String> {
	
	
	List<Booking> findByUser(User user);
    List<Booking> findByUserId(String userId);
    @Query(value = "SELECT " +
            "b.id AS rentalId, " +
            "u.name AS customerName, " +
            "v.id AS vehicleId, " +
            "b.booking_time AS rentalDate, " +
            "b.id AS bookingId, " +
            "b.duration AS bookingDuration, " +
            "b.created_at AS returnDate, " +
            "v.rental_price AS rentalPrice, " +
            "p.payment_amount AS totalAmount " +
            "FROM bookings b " +
            "JOIN users u ON b.user_id = u.id " +
            "JOIN vehicles v ON b.vehicle_id = v.id " +
            "LEFT JOIN payments p ON b.payment_id = p.id", nativeQuery = true)
    List<Object []> findRentalReport();
}
