package com.rental.entity;
import jakarta.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "payments")
public class Payment {
    @Id
    private String id;

    @ManyToOne
    @JoinColumn(name = "payer_id", nullable = false)
    private User payer;
    
    

    private double paymentAmount;
    private String paymentMode;
    @OneToOne(mappedBy = "payment", cascade = CascadeType.ALL)
    private Booking booking;
    
    public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public User getPayer() {
		return payer;
	}
	public void setPayer(User payer) {
		this.payer = payer;
	}
	public double getPaymentAmount() {
		return paymentAmount;
	}
	public void setPaymentAmount(double paymentAmount) {
		this.paymentAmount = paymentAmount;
	}
	public String getPaymentMode() {
		return paymentMode;
	}
	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}
	public String getPaymentStatus() {
		return paymentStatus;
	}
	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}
	public Timestamp getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(Timestamp paymentDate) {
		this.paymentDate = paymentDate;
	}
	private String paymentStatus;
    private Timestamp paymentDate;

    // Getters and Setters
}