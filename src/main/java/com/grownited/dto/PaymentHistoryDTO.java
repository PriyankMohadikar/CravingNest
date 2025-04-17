package com.grownited.dto;

public class PaymentHistoryDTO {
    private String firstName;
    private String email;
    private Double amount;
    private String couponCode1;
    private String couponCode2;
    private String couponCode3;
    private String couponExpiryDate;
    private String transactionId;

    // Constructor
    public PaymentHistoryDTO(String firstName, String email, Double amount, String couponCode1, String couponCode2, 
                            String couponCode3, String couponExpiryDate, String transactionId) {
        this.firstName = firstName;
        this.email = email;
        this.amount = amount;
        this.couponCode1 = couponCode1;
        this.couponCode2 = couponCode2;
        this.couponCode3 = couponCode3;
        this.couponExpiryDate = couponExpiryDate;
        this.transactionId = transactionId;
    }

    // Getters and Setters
   
    public String getEmail() {
        return email;
    }

    public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public void setEmail(String email) {
        this.email = email;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public String getCouponCode1() {
        return couponCode1;
    }

    public void setCouponCode1(String couponCode1) {
        this.couponCode1 = couponCode1;
    }

    public String getCouponCode2() {
        return couponCode2;
    }

    public void setCouponCode2(String couponCode2) {
        this.couponCode2 = couponCode2;
    }

    public String getCouponCode3() {
        return couponCode3;
    }

    public void setCouponCode3(String couponCode3) {
        this.couponCode3 = couponCode3;
    }

    public String getCouponExpiryDate() {
        return couponExpiryDate;
    }

    public void setCouponExpiryDate(String couponExpiryDate) {
        this.couponExpiryDate = couponExpiryDate;
    }

    public String getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(String transactionId) {
        this.transactionId = transactionId;
    }
}