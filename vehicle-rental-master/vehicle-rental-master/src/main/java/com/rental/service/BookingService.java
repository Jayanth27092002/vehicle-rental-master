package com.rental.service;
import com.rental.entity.Booking;
import com.rental.entity.User;
import com.rental.entity.Vehicle;
import com.rental.repository.BookingRepository;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookingService {

    @Autowired
    private BookingRepository bookingRepository;

    // Fetch all bookings
    public List<Booking> getAllBookings() {
        return bookingRepository.findAll();
    }
    
    public List<Booking> getBookingsByUser(User user) {
        return bookingRepository.findByUser(user);
    }

    // Fetch bookings by user ID
    public List<Booking> getBookingsByUserId(String userId) {
        return bookingRepository.findByUserId(userId);
    }
    

    
    
    public Optional<Booking> findBookingByUserAndVehicleAndDuration(User user,Vehicle vehicle,double duration) {
    	
    	
    	
    	return bookingRepository.findByUserAndVehicleAndDuration(user,vehicle,duration);
    }
    
    public void saveBooking(Booking booking) {
        bookingRepository.save(booking);
    }

    public Booking getBookingById(String bookingId) {
        return bookingRepository.findById(bookingId)
                .orElseThrow(() -> new IllegalArgumentException("Booking not found"));
    }
}
