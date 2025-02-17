//package com.rental.entity;
//
//
//import jakarta.persistence.*;
//
//@Entity
//@Table(name = "company_payment")
//public class CompanyPayment {
//    @Id
//    private String id;
//
//    @ManyToOne
//    @JoinColumn(name = "user_id")
//    private User user;
//
//    @OneToOne
//    @JoinColumn(name = "payment_id", referencedColumnName = "id")
//    private Payment payment;
//
//    public String getId() {
//		return id;
//	}
//	public void setId(String id) {
//		this.id = id;
//	}
//	public User getUser() {
//		return user;
//	}
//	public void setUser(User user) {
//		this.user = user;
//	}
//	public Payment getPayment() {
//		return payment;
//	}
//	public void setPayment(Payment payment) {
//		this.payment = payment;
//	}
//	public float getAmountReceived() {
//		return amountReceived;
//	}
//	public void setAmountReceived(float amountReceived) {
//		this.amountReceived = amountReceived;
//	}
//	public String getPaymentStatus() {
//		return paymentStatus;
//	}
//	public void setPaymentStatus(String paymentStatus) {
//		this.paymentStatus = paymentStatus;
//	}
//	public float getBalance() {
//		return balance;
//	}
//	public void setBalance(float balance) {
//		this.balance = balance;
//	}
//	private float amountReceived;
//    private String paymentStatus;
//    private float balance;
//
//    // Getters and Setters
//}