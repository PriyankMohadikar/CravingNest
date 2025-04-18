package com.grownited.entity;

import jakarta.persistence.*;
import java.text.SimpleDateFormat;
import java.util.Date;

@Entity
@Table(name = "membership_transactions")
public class MembershipTransactionEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private Integer userId;
	private String email;
	private Double amount;
	private String transactionId;
	private String invoiceId;
	private String paymentStatus;
	private String couponCode1;
	private String couponCode2;
	private String couponCode3;
	private Double discountPercentage;
	private Date couponExpiryDate;
	private Date createdAt;

	// Date format for dd/MM/yy
	private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yy");

	// Getters and Setters

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getEmail() {
		return email;
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

	public String getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}

	public String getInvoiceId() {
		return invoiceId;
	}

	public void setInvoiceId(String invoiceId) {
		this.invoiceId = invoiceId;
	}

	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
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

	public Double getDiscountPercentage() {
		return discountPercentage;
	}

	public void setDiscountPercentage(Double discountPercentage) {
		this.discountPercentage = discountPercentage;
	}

	public String getCouponExpiryDate() {
		return couponExpiryDate != null ? DATE_FORMAT.format(couponExpiryDate) : null;
	}

	public void setCouponExpiryDate(Date couponExpiryDate) {
		this.couponExpiryDate = couponExpiryDate;
	}

	public String getCreatedAt() {
		return createdAt != null ? DATE_FORMAT.format(createdAt) : null;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
}
