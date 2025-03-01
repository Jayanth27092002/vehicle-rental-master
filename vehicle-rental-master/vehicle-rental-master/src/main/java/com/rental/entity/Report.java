package com.rental.entity;
import jakarta.persistence.*;

@Entity
@Table(name = "report")
public class Report {
    @Id
    private String id;

    private String name;
    private String vehicleName;

    @OneToOne
    @JoinColumn(name = "booking_id", referencedColumnName = "id")
    private Booking booking;

    private int bookingDuration;
    private double rentalPrice;
    private double totalAmount;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getVehicleName() {
		return vehicleName;
	}
	public void setVehicleName(String vehicleName) {
		this.vehicleName = vehicleName;
	}
	public Booking getBooking() {
		return booking;
	}
	public void setBooking(Booking booking) {
		this.booking = booking;
	}
	public int getBookingDuration() {
		return bookingDuration;
	}
	public void setBookingDuration(int bookingDuration) {
		this.bookingDuration = bookingDuration;
	}
	public double getRentalPrice() {
		return rentalPrice;
	}
	public void setRentalPrice(double rentalPrice) {
		this.rentalPrice = rentalPrice;
	}
	public double getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}

    // Getters and Setters
}