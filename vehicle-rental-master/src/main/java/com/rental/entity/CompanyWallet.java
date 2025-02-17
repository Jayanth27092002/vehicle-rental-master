//package com.rental.entity;
//import jakarta.persistence.*;
//@Entity
//public class CompanyWallet {
//	@Id
//	@GeneratedValue(strategy =GenerationType.IDENTITY)
//	private long id;
//	 @OneToOne
//	    @JoinColumn(name = "user_id", nullable = false)
//	    private User user;
//
//	    private double balance;
//
//	    // Getters and Setters
//	    public Long getId() {
//	        return id;
//	    }
//
//	    public void setId(Long id) {
//	        this.id = id;
//	    }
//
//	    public User getUser() {
//	        return user;
//	    }
//
//	    public void setUser(User user) {
//	        this.user = user;
//	    }
//
//	    public double getBalance() {
//	        return balance;
//	    }
//
//	    public void setBalance(double balance) {
//	        this.balance = balance;
//	    }
//
//}
