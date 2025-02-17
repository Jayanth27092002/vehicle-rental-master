package com.rental.entity;
import jakarta.persistence.*;
import java.sql.Timestamp;


@Entity
@Table(name = "bookings")
public class Booking {
    @Id
    private String id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne
    @JoinColumn(name = "vehicle_id", nullable = false)
    private Vehicle vehicle;
    private Timestamp bookingTime;
    private float bookingPrice;
    private double duration;

    @OneToOne
    @JoinColumn(name = "payment_id", referencedColumnName = "id")
    private Payment payment;

    private Timestamp createdAt;
    private String bookingStatus;

    public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Vehicle getVehicle() {
		return vehicle;
	}
	public void setVehicle(Vehicle vehicle) {
		this.vehicle = vehicle;
	}
	public Timestamp getBookingTime() {
		return bookingTime;
	}
	public void setBookingTime(Timestamp bookingTime) {
		this.bookingTime = bookingTime;
	}
	public float getBookingPrice() {
		return bookingPrice;
	}
	public void setBookingPrice(float bookingPrice) {
		this.bookingPrice = bookingPrice;
	}
	public double getDuration() {
		return duration;
	}
	public void setDuration(double duration) {
		this.duration = duration;
	}
	public Payment getPayment() {
		return payment;
	}
	public void setPayment(Payment payment) {
		this.payment = payment;
	}
	public Timestamp getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
	public String getBookingStatus() {
		return bookingStatus;
	}
	public void setBookingStatus(String bookingStatus) {
		this.bookingStatus = bookingStatus;
	}
	
	
	@Override
    public String toString() {
        return "<html><body>" +
                "<h2>Booking Details</h2>" +
                "<table border='1' style='border-collapse: collapse;'>" +
                "<tr><th>Booking ID</th><td>" + id + "</td></tr>" +
                "<tr><th>Payment ID</th><td>" + payment.getId() + "</td></tr>"+
                "<tr><th>Customer Name</th><td>" + user.getName() + "</td></tr>" +
                "<tr><th>Vehicle Name</th><td>" + vehicle.getVehicleName() + "</td></tr>"+
                "<tr><th>Booking Date</th><td>" + bookingTime + "</td></tr>" +
                "<tr><th>Booking duration</th><td>" + duration + "</td></tr>" +
                "<tr><th>Status</th><td>" + bookingStatus + "</td></tr>" +
                "<tr><th>Total Amount</th><td>" + bookingPrice + "</td></tr>" +
                
                "</table>" +
                "</body></html>";
    }
 

    // Getters and Setters
}